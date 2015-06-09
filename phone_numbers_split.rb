def parse_phone_number(text)
  text.match(/^([\d]{1,3})[\s|-]([\d]{1,3})[\s|-]([\d]{4,10})$/)
  puts "CountryCode=#{$1},LocalAreaCode=#{$2},Number=#{$3}"
end

$stdin.read.split("\n").each_with_index do |line, ind|
  parse_phone_number(line) if ind != 0
end
