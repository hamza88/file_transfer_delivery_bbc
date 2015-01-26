require 'nokogiri'
$LOAD_PATH.unshift(File.expand_path("features/fixtures/OnAir/AsRun", File.dirname(__FILE__)))

class AsRunPage

def update_day_type_values(path, value)
	f = File.open("features/fixtures/OnAir/AsRun/e2e_orv_asrun.xml")
	doc = Nokogiri::XML(f)
	# doc = Nokogiri::XML(File.open("e2e_orv_asrun.xml"))
	 doc.search(path).each do |node|
	  node.content = value
	  File.open("features/fixtures/OnAir/AsRun/e2e_orv_asrun.xml",'w') {|f| doc.write_xml_to f}
	 end
	puts "The AsRun xml file has been changed successfully!"
end

def update_on_date(on_date)
	time_now = get_current_time(time)
	doc = Nokogiri::XML(File.open("e2e_orv_asrun.xml"))
	 doc.search("On_Date").each do |node|
	  node.content = time_now.to_s
	  File.open("e2e_orv_asrun.xml",'w') {|f| doc.write_xml_to f}
	 end
	puts "The AsRun xml file has been changed successfully!"
end

def update_video_source(video_source)
	doc = Nokogiri::XML(File.open("e2e_orv_asrun.xml"))
	 doc.search("Video_Source").each do |node|
	  node.content = video_source
	  File.open("e2e_orv_asrun.xml",'w') {|f| doc.write_xml_to f}
	 end
	puts "The AsRun xml file has been changed successfully!"
end

def get_current_time(time)
	time = Time.now
	#do time parsing here
end
end

