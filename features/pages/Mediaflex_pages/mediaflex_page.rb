require 'features/support/env'
class MediaflexPage < SikuliNavigator

  attr_accessor :login, :password

  BITMAPTOLERANCELEVEL = 0.72
  BITMAPTOLERANCELEVEL_FOR_ASSERTION = 0.8
  BITMAPTOLERANCELEVEL_FOR_EXISTS = 0.8
#WAITLONG = 750
#WAITMEDIUM = 250
#WAITSHORT = 100
  WAITLONG = 500
  WAITMEDIUM = 220
  WAITSHORT = 100

  def calculate_wait (waitingTime)
    # determine if we wait for a long time e.g waiting for a recording to finish
    if waitingTime.include? "eventually"
      waitingOver = WAITLONG
    elsif waitingTime.include? "soon"
      waitingOver = WAITMEDIUM
    else
      waitingOver = WAITSHORT
    end
    puts waitingOver.to_s
    return waitingOver
  end

  def initialize(login, password)
    @login = login
    @password = password
  end

  def login_to_mediaflex
    @screen.click "#{login}"
    @screen.type "#{@login}"
    @screen.click "#{password}"
    @screen.type "#{@password}"

  end


end