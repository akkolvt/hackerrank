require 'set'
def detect_tags(text)
  regexp = /\<([a-z0-9]+)[\>|\s]/
  matches = text.scan(regexp).flatten
  @tags.merge(matches)
end

$stdin.read.split("\n").each_with_index do |line, ind|
  @tags ||= Set.new
  detect_tags(line) if ind != 0
end

puts @tags.sort.join(';')
