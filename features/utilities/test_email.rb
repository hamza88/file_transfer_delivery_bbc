require 'net/imap.rb'

class TestEmail
  def init_email(username, password, folder = 'inbox')
    @imap = Net::IMAP.new('imap.gmail.com', 993, true, nil, false)
    res = @imap.login(username, password)

    if res.name == 'OK'
      @logged_in = true
      @folder = folder
      @imap.select(@folder)
      @imap.search(["NOT", "SEEN"]).each do |message_id|
        @imap.store(message_id, "+FLAGS", [:Seen])
      end

      at_exit {
        if @logged_in
          @imap.logout
        end
      }
    end
  end

  def poll(retries, timeout = 5)
    while retries > 0 do
      retries -= 1

      # it does seem to be necessary to reselect this
      @imap.select(@folder)

      @imap.search(["UNSEEN"]).each do |message_id|
        @imap.store(message_id, "+FLAGS", [:Seen])
        envelope = @imap.fetch(message_id, "ENVELOPE")[0].attr["ENVELOPE"]
        return envelope
      end

      sleep timeout
    end
  end
end