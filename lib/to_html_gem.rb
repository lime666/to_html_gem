class Html

def to_html(content, html_file = 'index.html')
  paste = content.gsub(/^[а-яА-Я ]*$/, '')
    
  html_file = File.new('index.html', "w+")
  html_file.puts "<!DOCTYPE html>"
  html_file.puts "  <head>"
  html_file.puts "    <meta charset='utf-8'>"
  html_file.puts "    <title>My Tamago</title>"
  html_file.puts "  </head>"
  html_file.puts "  <body>"
  html_file.puts "    #{paste}"
  html_file.puts "  </body>"
  html_file.puts "</html>"
  html_file.close

end

def open_html(html_file = 'index.html')
  system("xdg-open #{html_file}")
end

end