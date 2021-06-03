require 'nokogiri'

file = File.open('test.xml')
file_data = file.read

start = Time.now

root = Nokogiri::XML(file_data)
root.search('duplication').each do |elem_dupli|
  elem_dupli.search('file').each do |file|
    p file[:path]
  end
end

p "nokogiri_time: #{Time.now - start}"

file.close
