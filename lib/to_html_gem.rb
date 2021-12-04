class Html

def to_html(content, bypass_html: true)
  @content = content
  @paste << "<p>@content.gsub(/^[а-яА-Я ]*$/)</p>"
    
  @html = <<HTML
    <! doctype html>

    <html lang="en">
    <head>
    <meta charset="utf-8">

    <title></title>
    </head>

    <body>
      #{@paste}
    </body>
    </html>
HTML

  @html_file = File.open('index.html', w) {|f| f.write @html }
  @html_file.close

end

def open_html(html_file = 'index.html')
  to_html    
  system("xdg-open #{@html_file}")
end

end