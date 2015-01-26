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

Given /^I click on "(.*?)" if exists(.*)$/ do |bitmap, controlParameter|
  begin
    if @screen.exists "#{bitmap}"
      @region = @screen.exists "#{bitmap}",3
      puts @region.getScore()

      if @region.getScore() > BITMAPTOLERANCELEVEL_FOR_EXISTS
        if controlParameter.include? "noHighlight"
          # do nothing - Jupiter has some quirks with the Create Keyframe / Components screen and the highlight causes a problem
        else
          @region.highlight(1)
        end
        @screen.click "#{bitmap}"
      else
        puts "Bitmap Exists = " + bitmap + " does Not Score Above Required Limit of " + BITMAPTOLERANCELEVEL_FOR_EXISTS.to_s + " - Score = " + @region.getScore().to_s
      end
    else
      puts "Bitmap = " + bitmap + " does Not Exist"
    end
  end
end

Given /^I waitAndclick on "(.*?)"$/ do |bitmap|
  begin
    @screen.wait "#{bitmap}", 20
    @screen.click "#{bitmap}"
  rescue
    fail("The following bitmap cannot be found: " + bitmap)
  end
end

Given /^I set the current time plus "(.*?)" seconds$/ do |offset|

  currentTime = Time.new
  #puts CurrentTime
  currentTimeOffset = currentTime + "#{offset}".to_i
  #puts CurrentTimeOffset

  currentTimeOffsetHourString = currentTimeOffset.hour.to_s
  currentTimeOffsetMinString = currentTimeOffset.min.to_s

  if currentTimeOffsetHourString.length == 1
    currentTimeOffsetHourString = "0" + currentTimeOffsetHourString
  end

  if currentTimeOffsetMinString.length == 1
    currentTimeOffsetMinString = "0" + currentTimeOffsetMinString
  end

  $currentTimeOffsetString = currentTimeOffsetHourString + currentTimeOffsetMinString
  puts $currentTimeOffsetString
end

Given /^I click on dropdown "(.*?)"$/ do |bitmap|
  begin
    @screen.wait "#{bitmap}", 10
    @region = @screen.exists "#{bitmap}"
    #@region.highlight(1)
    @screen.click "#{bitmap}"
  rescue
    fail("The following bitmap cannot be found: " + bitmap + "\n")
  end
end

Given /^I click on dropdown "(.*?)" and click "(.*?)"$/ do |bitmap, bitmap2|
  begin
    @screen.wait "#{bitmap}", 10
    @region = @screen.exists "#{bitmap}"

    if @region.getScore() > BITMAPTOLERANCELEVEL
      #@region.highlight(1)
      @screen.click "#{bitmap}"
    else
      puts @region.getScore()
      fail("The following bitmap cannot be found: " + bitmap + "\n")
    end

    @region = @screen.exists "#{bitmap2}"
    puts @region.getScore()

    if @region.getScore() > BITMAPTOLERANCELEVEL
      @screen.click "#{bitmap2}"
    else
      fail("Bitmap = " + bitmap2 + " does Not Score Above Required Limit of " + BITMAPTOLERANCELEVEL.to_s + " - Score = " + @region.getScore().to_s)
    end

  rescue
    fail("The following bitmap cannot be found: " + bitmap + "\n")
  end
end

Given /^I examine "(.*?)"$/ do |bitmap|
  begin
    @region = @screen.find "#{bitmap}"
    puts "text is: " + @region.text()
  end
end

Given /^Wait for loading cursor$/ do
  begin
    if @screen.exists "Loading_Cursor.png"
      puts "Loading"
      !@screen.wait "Loading_Cursor.png", 10
    end
  rescue
  end
end

Given /^I click on "(.*?)"$/ do |bitmap|
  #step "Wait for loading cursor"
  begin
    #   @value = @screen.exists "#{bitmap}", 10
    #   puts @value
    if @screen.exists "#{bitmap}", 10
      @region = @screen.exists "#{bitmap}"
      #puts @region.getScore()
      if @region.getScore() > BITMAPTOLERANCELEVEL
        @region.highlight(1)
        @screen.click "#{bitmap}"
      else
        fail("Bitmap = " + bitmap + " does Not Score Above Required Limit of " + BITMAPTOLERANCELEVEL.to_s + " - Score = " + @region.getScore().to_s)
      end
    else
      fail("The following bitmap cannot be found: " + bitmap )
    end
  end
  step "Wait for loading cursor"
end

Given /^I click on "(.*?)" with noHighlight$/ do |bitmap|
#Jupiter has some quirks with the Create Keyframe / Components screen and the highlight causes a problem
  begin
#   @value = @screen.exists "#{bitmap}", 10
#   puts @value
    if @screen.exists "#{bitmap}", 10
      @region = @screen.exists "#{bitmap}"
      #puts @region.getScore()
      if @region.getScore() > BITMAPTOLERANCELEVEL
        @screen.click "#{bitmap}"
      else
        fail("Bitmap = " + bitmap + " does Not Score Above Required Limit of " + BITMAPTOLERANCELEVEL.to_s + " - Score = " + @region.getScore().to_s)
      end
    else
      fail("The following bitmap cannot be found: " + bitmap )
    end
  end
end

Given /^I click on "(.*?)" until "(.*?)" appears(.*)$/ do |bitmap, bitmap2, waitingTime|
  timeout = 0
  waitingOver = calculate_wait(waitingTime)
  #puts waitingOver.to_s

  begin
    bitmap2report = bitmap
    @region = @screen.exists "#{bitmap}"
    if @region.getScore() > BITMAPTOLERANCELEVEL
      puts bitmap + " Clicked"
      @region.highlight(1)
      @screen.click "#{bitmap}"
    end

    sleep 1

    bitmap2report = bitmap2
    @screen.wait "#{bitmap2}", 5
    @region = @screen.exists "#{bitmap2}"
    #puts @region.getScore()

    if @region.getScore() > BITMAPTOLERANCELEVEL_FOR_EXISTS
      puts "Bitmap found - " +bitmap2
    else
      fail("Throw Exception - Force Rescue Block")
    end

  rescue
    if timeout == waitingOver
      fail("TimedOut - " + timeout.to_s + ":The following bitmap cannot be found: " + bitmap2report)
    end

    timeout += 10
    #puts "Timeout= " + timeout.to_s
    retry
  end
end

Given /^I click on "(.*?)" until "(.*?)" disappears(.*)$/ do |bitmap, bitmap2, waitingTime|
  timeout = 0
  waitingOver = calculate_wait(waitingTime)
  #puts waitingOver.to_s

  begin
    while timeout < waitingOver
      bitmap2report = bitmap
      @region = @screen.exists "#{bitmap}"
      if @region.getScore() > BITMAPTOLERANCELEVEL
        #puts bitmap + " Clicked"
        @region.highlight(1)
        @screen.click "#{bitmap}"
      end

      sleep 1
      bitmap2report = bitmap2
      @screen.wait "#{bitmap2}", 5

      timeout += 5
      puts "Timeout= " + timeout.to_s
    end
  rescue
    puts "Bitmap Disappeared - " +bitmap2
  end

  if timeout == waitingOver
    fail("TimedOut - " + timeout.to_s + ":The following bitmap has not Disappeared: " + bitmap2report )
  end
end

Given /^I click on "(.*?)" if "(.*?)" exists$/ do |bitmap, bitmap2|
  begin
    @screen.wait "#{bitmap2}", 5
    if @screen.exists "#{bitmap2}"
      @screen.click "#{bitmap}"
    end
  rescue
    fail("The following bitmap cannot be found: " + bitmap + "\n")
  end
end

Given /^I click on "(.*?)" if "(.*?)" not exists$/ do |bitmap1, bitmap2|
  if !(@screen.exists "#{bitmap2}")
    @screen.click "#{bitmap1}"
  else
    ## do nothing if Jupiter already open
  end
end

Given /^I ensure Jupiter is ready for testing$/ do

  if !@screen.exists "jupiter_top.png"
    step 'I click on "taskbar_Icon.png" if "menu_New.png" not exists'
    step 'I click on "window_Maximize.png" if exists'
    step 'I should see "menu_New.png"'
  end

  begin
    if @screen.exists "button_Cancel.png"
      @screen.click "button_Cancel.png"
    end
    if @screen.exists "button_Cancel2.png"
      @screen.click "button_Cancel2.png"
    end
    if @screen.exists "button_Ok.png"
      @screen.click "button_Ok.png"
    end
    if @screen.exists "button_Yes.png"
      @screen.click "button_Yes.png"
    end
    if @screen.exists "dlg_Error_Sign.png"
      @screen.click "button_Close.png"
    end
    if @screen.exists "existing_Keyframe_Warning.png"
      @screen.click "button_Close.png"
    end
    if @screen.exists "search_Close_Button.png"
      timeout = 0
      while @screen.exists "search_Close_Button.png" and timeout < 6
        @screen.click "search_Close_Button.png"
        sleep 1
        timeout = timeout + timeout
      end
    end
    if @screen.exists "button_Exceptions_Close.png"
      @screen.click "button_Exceptions_Close.png"
    end
  rescue
    puts "Jupiter already set"
  end
  #@screen.click "jupiter_top.png"
end

Given /^I close Search Windows$/ do
  while @screen.exists "search_Close_Button.png"
    @screen.click "search_Close_Button.png"
    sleep 1
  end
end

Given /^I doubleclick on "(.*?)"$/ do |bitmap|
  begin
    @screen.wait "#{bitmap}", 5
    @region = @screen.exists "#{bitmap}"
    @region.highlight(1)
    @screen.doubleClick "#{bitmap}"
  rescue
    fail("The following bitmap cannot be found: " + bitmap )
  end
end

Given /^I rightclick on "(.*?)" and click "(.*?)"$/ do |bitmap, bitmap2|
  begin
    @region = @screen.exists "#{bitmap}"
    #puts @region.getScore()

    #@screen.wait "#{bitmap}", 20
    if @region.getScore() > BITMAPTOLERANCELEVEL
      puts bitmap + " RightClicked"
      @screen.rightClick "#{bitmap}"
    else
      fail("Bitmap = " + bitmap + " does Not Score Above Required Limit of " + BITMAPTOLERANCELEVEL.to_s + " - Score = " + @region.getScore().to_s)
    end

    @region = @screen.exists "#{bitmap2}"
    #puts @region.getScore()

    if @region.getScore() > BITMAPTOLERANCELEVEL
      puts bitmap2 + " Clicked"
      @screen.click "#{bitmap2}"
    else
      fail("Bitmap = " + bitmap2 + " does Not Score Above Required Limit of " + BITMAPTOLERANCELEVEL.to_s + " - Score = " + @region.getScore().to_s )
    end
  end
end


When /^I drag "(.*?)" to "(.*?)"$/ do |bitmap, destination|
  begin
    @screen.wait "#{bitmap}", 10
    if @screen.exists "#{bitmap}"
      @screen.dragDrop("#{bitmap}",destination)
    end
  rescue
    fail("The following bitmap cannot be found: " + bitmap)
  end
end


When /^I type time$/ do
  puts $currentTimeOffsetString
  @screen.type "#{$currentTimeOffsetString}"
end


When /^I type "(.*?)"$/ do |text|
  @screen.type "#{text}"
end

When /^I type "(.*?)" and TAB$/ do |text|
  @screen.type "#{text}"+ "\t"
  sleep(1)
end

When /^I use BACKSPACE$/ do
  @screen.type(Sikuli::KEY_BACKSPACE)
end

When /^I use TAB$/ do
  @screen.type("\t")
end


When /^I use DOWNARROW$/ do
#  @screen.type(Sikuli::KEY_DOWN)
  @screen.type(KEY.PAGE_DOWN)
#   @screen.type(u"\ue003")
#   @screen.type("\ue003")
end

When /^I use CTRL A$/ do
  sleep(1)
  @screen.type("a", Sikuli::KEY_CTRL)
  sleep(1)
  @screen.type("x", Sikuli::KEY_CTRL)
end

When /^I use RETURN$/ do
#	And I wait "1" seconds
#    And I use CTRL A
  sleep(1)
  @screen.type("\n")
end

When /^I Copy and Paste$/ do
  sleep(1)
  @screen.type("a", Sikuli::KEY_CTRL)
  sleep(1)
  @screen.type("c", Sikuli::KEY_CTRL)
  sleep(1)
  @screen.type("v", Sikuli::KEY_CTRL)
  @screen.type("v", Sikuli::KEY_CTRL)
end

When /^I Clear and Paste$/ do
  sleep(1)
  @screen.type("a", Sikuli::KEY_CTRL)
  sleep(1)
#  @screen.type("x", Sikuli::KEY_CTRL)
  @screen.type(Sikuli::KEY_BACKSPACE)
  sleep(1)
  @screen.type("v", Sikuli::KEY_CTRL)
  @screen.type(Sikuli::KEY_BACKSPACE)
end

When /^I paste "(.*?)"$/ do |text|
  @screen.paste("#{text}")
end


#When /^I wait for "(.*?)" to appear$/ do |bitmap|
#  begin
#    @screen.wait "#{bitmap}", 20
# rescue
#    fail("The following bitmap cannot be found: " + bitmap)
#  end
#end

When /^I wait for "(.*?)" to appear$/ do |bitmap|
  waitingOver = WAITSHORT
  timeout = 0
  begin
    while timeout < waitingOver
      timeout += 10
      @screen.wait "#{bitmap}", 5
    end
  rescue
    if timeout > waitingOver
      fail("TimedOut - " + timeout.to_s + ":The following bitmap cannot be found: " + bitmap)
    else
      puts bitmap + " Not Present"
      retry
    end
  end
end

When /^I wait for "(.*?)" to disappear$/ do |bitmap|
  waitingOver = WAITSHORT
  timeout = 0
  bitmapStillThere = true

#    while bitmapStillThere
#		if @screen.waitVanish "#{bitmap}"
#			bitmapStillThere = false
#		end
#		puts "still there"
#	end

  while bitmapStillThere
    timeout += 10
    if @screen.waitVanish "#{bitmap}",5
      bitmapStillThere = false
    else
      puts bitmap + " Still Present"
    end

    if timeout == waitingOver
      fail("TimedOut - " + timeout.to_s + ":The following bitmap cannot be found: " + bitmap)
    end

  end
  puts bitmap + " Disappeared"
end



Then /^I should see "(.*?)"(.*)$/ do |bitmap, controlParameter|
  #puts "NH = " +controlParameter

  # allow user to specify how long to wait
  waitingTime = ""
  if controlParameter.include? "soon"
    waitingTime = "soon"
  elsif controlParameter.include? "eventually"
    waitingTime = "eventually"
  end
  waitingOver = calculate_wait(waitingTime)

  nearly_not_quite = false
  timeout = 0
  begin
    puts "Locate Bitmap " + bitmap
    if @screen.exists "#{bitmap}"
      @region = @screen.exists "#{bitmap}"
      puts @region.getScore()

      # the assertion has to be almost spot on

      if @region.getScore() > BITMAPTOLERANCELEVEL_FOR_ASSERTION
        if controlParameter.include? "noHighlight"
          # do nothing - Jupiter has some quirks with the Create Keyframe / Components screen and the highlight causes a problem
        else
          @region.highlight(1)
        end
      else
        nearly_not_quite = true
        fail("Throw Exception - Force Rescue Block")
      end
    else
      fail("Throw Exception - Force Rescue Block")
    end

  rescue
    sleep(1)
    puts "Rescuing - " + timeout.to_s
    if timeout == waitingOver
      fail("TimedOut - " + timeout.to_s + ":The following bitmap cannot be found: " + bitmap)
    end

    if nearly_not_quite == true
      fail("Bitmap = " + bitmap + " does Not Score Above Required Limit of " + BITMAPTOLERANCELEVEL_FOR_ASSERTION.to_s + " - Score = " + @region.getScore().to_s)
    end

    timeout += 5
    retry
  end
end

Then /^I should not see "(.*?)"$/ do |bitmap|
  begin
    @screen.waitVanish "#{bitmap}", 5
  rescue Exception => e
    #puts "Exception was raised: #{e.class}"
    fail("The following bitmap was found: " + bitmap)
  end
end

Then /^I wait "(.*?)" seconds$/ do |delay|
  sleep "#{delay}".to_i
end

Then /^I wait upto "(.*?)" seconds for "(.*?)" to vanish$/ do |delay, bitmap|
  @screen.waitVanish "#{bitmap}", "#{delay}".to_i
end

When /^I uncheck all check boxes$/ do
  for x in @screen.findAll "jupiterCheckboxTicked.png"
    @screen.click "jupiterExportButton.png"
  end
end

When /^I create a region "(.*?)"$/ do |bitmap|
  r=@screen.find "#{bitmap}".below(500)
end

When /^I click on "(.*?)" in the region$/ do |bitmap|
  t=r.find "#{bitmap}".getCenter().offset(0,0)
  @screen.click(t)
end

# Make sikuli more robust
# from org.sikuli.script.natives import Vision
#Vision.setParameter("MinTargetSize", 6) # A small value such as 6 makes the matching algorithm be faster.
#Vision.setParameter("MinTargetSize", 18) # A large value such as 18 makes the matching algorithm be more robust.

#find("OK") return all regions with ok label
#Region.text return text in a region

# Beware using this cos the application is closed automatically after the job has finished
#@script.openApp("C:\\Program Files (x86)\\BBC\\Jupiter\\bin\\Jupiter.exe")

#popup("Hello World!\nHave fun with Sikuli!")

#while @screen.exists "#{bitmap}"
#	@screen.click "#{bitmap}"
#	sleep 1
#end
#loop do @screen.click "#{bitmap}"
#	sleep 1
#	break if not (@screen.exists "#{bitmap}")
#end

#STDOUT.write "Given I click on " + bitmap + "\n"

