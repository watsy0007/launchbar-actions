#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
#
# LaunchBar Action Script
#
require_relative './public'

def parse_list(url)
  html = noko_html(url)
  html.css('#result .g').each do |el|
    el.search('.//script[@data-cfhash]').remove
    el.search('.//span[@class="__cf_email__"]').remove
    title = el.xpath('.//a').first['title']
    link = el.xpath('.//a').first['href']
    info = el.xpath('.//div[@class="std2"]').text.delete("\n")
    yield title, info, link
  end
end

def search(query)
  url = "http://www.btkiki.com/s/#{url_encode(query)}.html"

  items = []
  parse_list(url) do |title, info, link|
    items << {
      title: title,
      subtitle: info,
      url: link,
      quickLookURL: link,
      action: 'magnet.rb',
      actionArgument: link,
      actionReturnsItems: true
    }
  end
  items.to_json
end

puts search(ARGV.first)
