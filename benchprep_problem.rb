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
     get("q=#{keyword}&max-results=10&fields=entry&alt=json")  
  end
  
end

results = YouTube.get_video_by_keyword("ravens")
results["feed"]["entry"].each do |item|
  ap item["media$group"]["media$title"]["$t"]
  ap item["media$group"]["media$thumbnail"][0]
  ap item["media$group"]["media$description"]["$t"]  
end







#########Twitter Example For Fun As Well###############
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
#   ap item['user']['screen_name']
#   ap item['text]
# end









  