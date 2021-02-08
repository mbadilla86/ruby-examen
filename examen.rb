require "uri"
require "net/http"
require "json"

def request(url,token = nil)
    sol = ARGV[0]
    url = URI("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=#{sol}1000&api_key=d4v6gZycznoxIBp3HGJJlyRPYFvht48pSVTyXMjM")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(url)
    response = http.request(request)
    return JSON.parse(response.read_body)
end

#index.html
def buid_wed_page(info_hash)
    File.open('index.html', 'w') do |file|      
        file.puts "<img src='#{info_hash["photos"]}"
    end
end
nasa_array = request("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&","d4v6gZycznoxIBp3HGJJlyRPYFvht48pSVTyXMjM")
puts buid_wed_page(nasa_array)