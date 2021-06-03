require "rexml/document"

file = File.open("test.xml")
file_data = file.read

start = Time.now

root = REXML::Document.new(file_data).root
root.each_element('duplication') do |elem_dupli|
  elem_dupli.get_elements('file').each do |f|
    p(f[:path])
  end
end

p "rexml_time: #{Time.now - start}"

file.close
