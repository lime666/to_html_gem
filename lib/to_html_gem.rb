class Html
  def to_html(content, html_file = 'index.html')
    bypass_html: true
    @paste = @content.gsub(/^[а-яА-Я ]*$/, '')
    
    html_file = File.new('index.html', "w+")
    html_file.puts "<!DOCTYPE html>"
    html_file.puts "<html lang="en">"
    html_file.puts "  <head>"
    html_file.puts "    <meta charset='utf-8'>"
    html_file.puts "    <title>My Tamago</title>"
    html_file.puts "  </head>"
    html_file.puts "  <body>"
    html_file.puts "    #{@paste}"
    html_file.puts "  </body>"
    html_file.puts "</html>"
    html_file.close

  end

  def edit_html(content, html_file = 'index.html')
    @paste << @content
    html_file = File.open(html_file, "w+")
    html_file.puts @paste
    html_file.close
    file = File.open('index.html', w) {|f| f.write html_file }
    @paste << "<p>@content.gsub(/^[а-яА-Я ]*$/)</p>"
    @file.close
  end

  def open_html(html_file = 'index.html')
    system("xdg-open #{html_file}")
  end
end