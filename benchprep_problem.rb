require 'rubygems'
require 'httparty'
require 'awesome_print'
require "json"


# Developer Key for YouTube
# AI39si41yjmL_5qUULNRJYm2x4HHcKwfEapPFsFo7kkuF-g5JY4OTkgQskkAd6UfFTM4uKV2QC9mZ8Ss06uCkk3RYro2pL2cww

# AllowedFormats = { 
#   :xml => %w[application/xml application/atom+xml text/xml], 
#   :json => %w[application/json text/json] 
# }

# feed, entry, description
# <media:thumbnail>
# <media:title>
# <media:description>

class YouTube
  include HTTParty
  base_uri "https://gdata.youtube.com/feeds/api/videos?"
  default_params apiKey: "AI39si41yjmL_5qUULNRJYm2x4HHcKwfEapPFsFo7kkuF-g5JY4OTkgQskkAd6UfFTM4uKV2QC9mZ8Ss06uCkk3RYro2pL2cww"
  format :xml
  
  def self.get_video_by_keyword(keyword)
     get("q=#{keyword}")
  end
   
   
end

ap YouTube.get_video_by_keyword("ravens")



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
#   ap item['user']['screen_name']
#   ap item['text']
# end

####################Failed Attempt########################
# class YouTube
#   include HTTParty
#  
#   base_uri "https://gdata.youtube.com/feeds/api/videos?"
#  
#   attr_accessor :title, :thumbnail, :description
#  
#   def initialize(title, thumbnail, description)
#     self.title = title
#     self.thumbnail = thumbnail
#     self.description = description
#   end
#  
#   # Find a particular video, based on its name
#   def self.find(title)
#     response = get("q=#{title}")
#     if response.success?
#       self.new(response["title"], response["thumbnail"], response["description"])
#     else
#       # this just raises the net/http response that was raised
#       raise response.response    
#     end
#   end
# end
# 
# ap YouTube.find("tebow")








  