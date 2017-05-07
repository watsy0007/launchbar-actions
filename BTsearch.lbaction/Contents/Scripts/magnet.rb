require_relative './public'

def search(url)
  html = noko_html(url)
  result = html.css('#result')
  result.xpath('.//script[@data-cfhash]').remove
  result.xpath('.//a[@class="__cf_email__"]').remove
  file_type = result.css('.file').first.text
  magnet = result.css('.list-group').first.text
  [
    {
      title: file_type,
      subtitle: magnet,
      url: magnet
    }
  ].to_json
end

puts search(ARGV.first)
