def validate_pan(text)
  if text.match(/^[A-Z]{5}[\d]{4}[A-Z]{1}$/).nil?
    puts "NO"
  else
    puts "YES"
  end
end

$stdin.read.split("\n").each_with_index do |line, ind|
  validate_pan(line) if ind != 0
end
