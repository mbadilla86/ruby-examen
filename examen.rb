require "uri"
require "net/http"
url = URI("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=#{sol}&api_key=d4v6gZycznoxIBp3HGJJlyRPYFvht48pSVTyXMjM")

https = Net::HTTP.new(url.host, url.port)
https.use_ssl = true

request = Net::HTTP::Get.new(url)

response = https.request(request)
puts response.read_body