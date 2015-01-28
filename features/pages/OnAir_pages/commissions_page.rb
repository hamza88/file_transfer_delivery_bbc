class CommissionsPage
  require 'nokogiri'
  require 'uri'
  require 'nokogiri'
  require 'time'

  def initialize
    copy_files
  end

  def copy_files
# read and parse the old file
    file = File.open("features/fixtures/OnAir/OnAir/e2e_orv_commissions.xml")
    xml = Nokogiri::XML(file)
# save the output into a new file
    File.open("features/fixtures/OnAir/OnAir/temp_xmls/commissions.xml", "w") do |f|
      f.write xml.to_xml
    end
  end

  def add_values_to_commissions_xml(key, value)
    doc_1 = Nokogiri::XML(File.open("features/fixtures/OnAir/OnAir/temp_xmls/commissions.xml"))
    $commissions_file = "commissions.xml"
    doc_1.search(key).each do |node|
      if node.name == 'Delivery_Date'
        get_current_time(value)
        node.content = $new_value.to_s
        File.open("features/fixtures/OnAir/OnAir/temp_xmls/commissions.xml", 'w') { |f| doc_1.write_xml_to f }
        puts "The Commissions xml file has been created successfully with #{$new_value} on #{key}!"
      else
        node.content = value if node.name != 'Delivery_Date'
        File.open("features/fixtures/OnAir/OnAir/temp_xmls/commissions.xml", 'w') { |f| doc_1.write_xml_to f }
        puts "The Commissions xml file has been created successfully with #{value} on #{key}!"
      end
    end
  end

  def update_commissions_values(key, value)
    doc = Nokogiri::XML(File.open("features/fixtures/OnAir/OnAir/temp_xmls/commissions.xml", 'r'))
    get_current_time(value) if key == 'Delivery_Date'
    doc.search(key).each do |node|
      if node.name == 'Delivery_Date'
        get_current_time(value)
        node.content = $new_value.to_s
        File.open("features/fixtures/OnAir/OnAir/temp_xmls/commissions.xml", 'w') { |f| doc.write_xml_to f }
        puts "The Commissions xml file has been updated successfully with #{$new_value} on #{key}!"
      else
        node.content = value if node.name != 'Delivery_Date'
        File.open("features/fixtures/OnAir/OnAir/temp_xmls/commissions.xml", 'w') { |f| doc.write_xml_to f }
        puts "The Commissions xml file has been updated successfully with #{value} on #{key}!"
      end
    end
  end

  def get_current_time(value)
    now = Time.now
    value.slice!('+')
    new_value = now + (60 * 60 * 24 * value.to_i)
    new_value = new_value.strftime("%Y-%m-%d")
    $new_value = new_value
    return $new_value
  end
end
