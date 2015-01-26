require 'nokogiri'
require 'uri'
require 'nokogiri'
require 'time'

class SchedulePage

  def initialize
    copy_files
  end

  def copy_files
# read and parse the old file
    file = File.open("features/fixtures/OnAir/OnAir/e2e_orv_schedule.xml")
    xml = Nokogiri::XML(file)
# save the output into a new file
    File.open("features/fixtures/OnAir/OnAir/e2e_orv_schedule_test.xml", "w") do |f|
      f.write xml.to_xml
    end
  end

  def add_values_to_schedule_xml(key, value)
    doc_1 = Nokogiri::XML(File.open("features/fixtures/OnAir/OnAir/e2e_orv_schedule_test.xml"))
    $schedule_file = doc_1
    doc_1.search(key).each do |node|
      if node.name == 'On_Date'
        get_current_date_schedule(value)
        node.content = $new_value.to_s
        File.open("features/fixtures/OnAir/OnAir/e2e_orv_schedule_test.xml", 'w') { |f| doc_1.write_xml_to f }
        puts "The Schedule xml file has been created successfully with #{$new_value} on #{key}!"
      else
        node.content = value if node.name != 'On_Date'
        File.open("features/fixtures/OnAir/OnAir/e2e_orv_schedule_test.xml", 'w') { |f| doc_1.write_xml_to f }
        puts "The Schedule xml file has been created successfully with #{value} on #{key}!"
      end
    end
  end


  def update_schedule_values(key, value)
    doc = Nokogiri::XML(File.open("features/fixtures/OnAir/OnAir/e2e_orv_schedule_test.xml", 'r'))
    doc.search(key).each do |node|
      if node.name == 'On_Date'
        get_current_date_schedule(value)
        node.content = $new_value.to_s
        File.open("features/fixtures/OnAir/OnAir/e2e_orv_schedule_test.xml", 'w') { |f| doc.write_xml_to f }
        puts "The Schedule xml file has been updated successfully with #{value} on #{key}!"
      else
        node.content = value if node.name != 'On_Date'
        File.open("features/fixtures/OnAir/OnAir/e2e_orv_schedule_test.xml", 'w') { |f| doc.write_xml_to f }
        puts "The Schedule xml file has been updated successfully with #{value} on #{key}!"
      end
    end
  end


  def get_current_date_schedule(value)
    now = Time.now
    value.slice!('+')
    new_value = now + (60 * 60 * 24 * value.to_i)
    new_value = new_value.strftime("%Y-%m-%d")
    $new_value = new_value.to_s + "Z"
    return $new_value
  end


end