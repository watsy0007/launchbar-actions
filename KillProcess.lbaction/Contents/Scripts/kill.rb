require 'json'
pid, name = ARGV.first.split ','
`kill -9 #{pid}`
puts [{title: "#{name} killed"}].to_json
