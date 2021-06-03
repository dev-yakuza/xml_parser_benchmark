require 'ox'

file = File.open('test.xml')
file_data = file.read

start = Time.now

root = Ox.parse(file_data)
root.locate('pmd-cpd/duplication').each do |elem_dupli|
  elem_dupli.locate('file').each do |file|
    p file[:path]
  end
end

p "ox_time: #{Time.now - start}"

file.close
