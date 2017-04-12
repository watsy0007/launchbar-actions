#!/usr/bin/env ruby
#
# LaunchBar Action Script
#
require 'json'

items = []

process_name = ARGV.first
results = IO.popen("ps -eo pid,ppid,%cpu,%mem,stat,start,ucomm,comm | grep -i #{process_name}").readlines
results = results.map do |result|
  result.delete("\n").split(' ')
end
pids = results.map { |res| res[0] }
results.delete_if { |res| pids.include? res[1] }

results.each do |result|
  items << {
    title: result[6],
    subtitle: "cpu: #{result[2]}% mem: #{result[3]}% #{result[7]}",
    action: 'kill.rb',
    actionArgument: "#{result[0]},#{result[6]}"
  }
end
puts items.to_json
