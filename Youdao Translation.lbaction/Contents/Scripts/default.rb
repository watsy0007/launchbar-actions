#!/usr/bin/env ruby
#
# LaunchBar Action Script
#
require 'json'
require 'uri'
require 'net/http'
require 'erb'
include ERB::Util


base_url = 'http://fanyi.youdao.com/openapi.do?keyfrom=launchbar-trans&key=1601880549&type=data&doctype=json&version=1.1&q='
url = URI("#{base_url}#{url_encode(ARGV.first)}")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)

response = http.request(request)
data = JSON.parse(response.read_body)

items = []
items << { title: ARGV.first }

items = data['basic']['explains'].each_with_object(items) do |hash|
  item = {}
  item['title'] = hash
  items << item
end

puts items.to_json
