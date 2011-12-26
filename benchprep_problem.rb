require 'rubygems'
require 'httparty'
require 'awesome_print'
require "json"

class YouTube
  include HTTParty
  base_uri "https://gdata.youtube.com/feeds/api/videos?"
  default_params apiKey: "AI39si41yjmL_5qUULNRJYm2x4HHcKwfEapPFsFo7kkuF-g5JY4OTkgQskkAd6UfFTM4uKV2QC9mZ8Ss06uCkk3RYro2pL2cww"
  format :json
  
  def self.get_video_by_keyword(keyword)
     @results = get("q=#{keyword}&max-results=1&fields=entry&alt=json")  
  end
  
end

results = YouTube.get_video_by_keyword("ravens")
results.each do |result|
  ap result[1]["entry"][0]
end





# YouTube.get_video_by_keyword("ravens").each do |video|
#   ap video["feed"]["entry"]["title"]
#   ap video["feed"]["entry"]["media:group"]["media:thumbnail"]["url"]
#   ap video["feed"]["entry"]["media:group"]["media:description"]
# end





#########Twitter Example###############
# class Twitter
#   include HTTParty
#   base_uri 'twitter.com'
# 
#   def self.public_timeline
#     get('/statuses/public_timeline.json')
#   end
# end
# 
# Twitter.public_timeline.each do |item|
#   ap item['user']
# end









  