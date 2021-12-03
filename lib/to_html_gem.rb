#f.readlines[0]   #=> "This is line one"
class Html

def initialize content
  @content = content
end
  
def to_html
  convert_content
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

end

private

def convert_content
  @html_file = File.open("index.html", w) {|f| f.write @html }
  @paste << "<p>@content.gsub(/^[а-яА-Я ]*$/)</p>"
  @html_file.close
end

def open_html
  to_html    
  system("xdg-open #{@html_file}")
end

end