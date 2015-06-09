# Регекс надо доделать - странно работает
def valid_params?(params)
  if !params.match(/^[\d]+$/)
    x, y = params.gsub(/\(|\)/, '').split(', ')
    if !valid_form?(x, y) || !valid_number?(x.to_f, y.to_f)
      puts 'Invalid'
    else
      puts 'Valid'
    end
  end
end

def valid_form?(x, y)
  regexp = /^([\+|\-]?[^0][\d]{0,2}?(\.)?([\d]+))$/
  x.match(regexp) && y.match(regexp)
end

def valid_number?(x, y)
  (x >= -90 && x <= 90) && (y >= -180 && y <= 180)
end

$stdin.read.split("\n").each do |params|
  valid_params?(params)
end

