#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
#
# LaunchBar Action Script
#
require 'json'
require 'net/http'
require 'nokogiri'
require 'erb'
include ERB::Util
require 'open-uri'

def noko_html(url)
  headers = {
    'User-Agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36',
  }
  body = open(url, headers).read
  Nokogiri::HTML(body)
end
