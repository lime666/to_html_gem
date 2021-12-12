require 'nokogiri'

class Html
  def to_html(content, bypass_html: true, html_file = 'index.html')
    @paste = content.gsub!(/^[а-яА-Я ]*$/, '') if bypass_html
    
    html_file = File.new('index.html', 'w+')
    html_file.puts '<!DOCTYPE html>'
    html_file.puts '  <head>'
    html_file.puts '    <meta charset='utf-8'>'
    html_file.puts '    <title>odoodo</title>'
    html_file.puts '    <script>'
    html_file.puts '      setInterval(()=>{ window.location.reload() }, 2000)'
    html_file.puts '    </script>'
    html_file.puts '  </head>'
    html_file.puts '  <body>'
    html_file.puts '    #{@paste}'
    html_file.puts '  </body>'
    html_file.puts '</html>'
    html_file.close

  end

  def edit_html(content, html_file = 'index.html')
    File.open(html_file) { |html_file| Nokogiri::HTML(html_file) }
    @paste << content
    html_file = File.open(html_file, 'w+')
    html_file.puts @paste
    html_file.close
  end

  def open_html(html_file = 'index.html')
    system("xdg-open #{html_file}")
  end
end
