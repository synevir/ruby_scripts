########################################################
#
# Script for parsing links from web page
# Usage: url_open.rb [URL]
# URL must have 'https://' protocol prefix in params
# default url='https://mypromopage.herokuapp.com'
#
########################################################

require 'open-uri'

if (ARGV.size == 0) then
  url = 'https://mypromopage.herokuapp.com'
else
  url = ARGV[0]
end
puts "Parsing URL:  " + url
page = open(url)
text = page.read

pattern = %r{href=\"(\S*)"}
# (\S*) select group in regular expresion - выделение группы в регулярном выражении
# find all url's in a page in tag's <a href="ulr"> link </a>

pattern2= %r{<input type="(\S*)"}
arr = text.scan(pattern)
ar2 = text.scan(pattern2)

def pr(array)
    array.each do |elem|
      puts elem
    end
end

puts 'Это ссылки, которые есть на странице '
pr(arr)
puts '---------------------------'
pr(ar2)
