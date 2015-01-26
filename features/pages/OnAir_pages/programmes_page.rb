require 'nokogiri'
require 'uri'
require 'nokogiri'
require 'time'

class ProgrammesPage

  def initialize
    copy_files
  end

  def copy_files
# read and parse the old file
    file = File.open("features/fixtures/OnAir/OnAir/e2e_orv_programmes.xml")
    xml = Nokogiri::XML(file)
# save the output into a new file
    File.open("features/fixtures/OnAir/OnAir/e2e_orv_programmes_test.xml", "w") do |f|
      f.write xml.to_xml
    end
  end

  def add_values_to_programmes_xml(key, value)
    doc = Nokogiri::XML(File.open("features/fixtures/OnAir/OnAir/e2e_orv_programmes_test.xml", 'r'))
    doc.search(key).each do |node|
      node.content = value
      File.open("features/fixtures/OnAir/OnAir/e2e_orv_schedule_test.xml", 'w') { |f| doc.write_xml_to f }
      puts "The Programmes xml file has been updated successfully with #{value} on #{key}!"
    end
  end


  def update_programmes_values(key, value)
    doc = Nokogiri::XML(File.open("features/fixtures/OnAir/OnAir/e2e_orv_programmes_test.xml", 'r'))
    doc.search(key).each do |node|
        node.content = value
        File.open("features/fixtures/OnAir/OnAir/e2e_orv_schedule_test.xml", 'w') { |f| doc.write_xml_to f }
        puts "The Programmes xml file has been updated successfully with #{value} on #{key}!"
      end
  end
end