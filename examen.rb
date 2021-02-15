require "uri"
require "net/http"
require "json"

def request(url,token = nil)
    url = URI("#{url}api_key=#{token}")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(url)
    response = http.request(request)
    return JSON.parse(response.read_body)
end


def buid_wed_page(info_hash)
    File.open('index.html', 'w') do |file|      
        file.puts "<html>"
        file.puts "<head>"
        file.puts "<meta charset='UTF-8'>"
        file.puts"<meta name='Mauricio Badilla'>"
        file.puts"<meta name='viemport' content='width=device-width, initial-scale=1.0'>"
        file.puts "</head>"
        file.puts "<title>'Fotos de la Nasa'</title>"
        file.puts "<body>"
        file.puts "<h1>Mars Rover Photos</h1>"
        file.puts "<ul>"
        info_hash["photos"].each do |photo_hash|
             file.puts "<li><img src='#{photo_hash["img_src"]} 'width = '110'></li>"

        end
        file.puts "</ul>"
        file.puts "</body>"
        file.puts "</html>"
    end
end
nasa_array = request("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&","d4v6gZycznoxIBp3HGJJlyRPYFvht48pSVTyXMjM")
puts buid_wed_page(nasa_array)