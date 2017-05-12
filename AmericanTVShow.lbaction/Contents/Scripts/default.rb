#!/usr/bin/env ruby
#
# LaunchBar Action Script
#
require_relative './public'

def search(name)
  html = noko_html("http://cn163.net/?s=#{url_encode(name)}&x=0&y=0")
  html.css('.entry_box').each_with_object([]) do |item, acc|
    link = item.css('.archive_title a')[0]
    acc << {
      title: link.text,
      url: link['href'],
      subtitle: item.css('archive_info').text.delete("\n"),
      quickLookURL: link['href']
    }
  end
end

puts search(ARGV[0]).to_json
