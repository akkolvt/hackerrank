def validate_ip(text)
  if is_ipv4?(text)
    puts "IPv4"
  elsif is_ipv6?(text)
    puts "IPv6"
  else
    puts "Neither"
  end
end

def is_ipv4?(text)
  segm = text.split('.')
  return false if segm.size != 4

  matches = segm.map{|s| s.match(/^[\d]{1,3}$/)}
  return false if matches.include?(nil)
  return false if !matches.select{|m| m.to_s.to_i > 255}.empty?

  true
end

def is_ipv6?(text)
  segm = text.split(':')
  return false if segm.size != 8

  !segm.map do |s|
    length = s.size
    s.match(/^[[\d]|[A-Fa-f]]{#{length}}$/)
  end.include?(nil)
end

$stdin.read.split("\n").each_with_index do |line, ind|
  next if ind == 0
  validate_ip(line)
end
