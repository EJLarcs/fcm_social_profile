require 'httparty'
require 'open-uri'
class ApiController < ApplicationController

  def download
    logger.debug(request.content_type)
    logger.debug(request.format)
    logger.debug(params[:url])
    save_image(params[:url])
    render json: { msg: "ok"}
  end

  def save_image(url)
    response = HTTParty.get(url)
    logger.debug(response)
  end

  def save_image(url)
   response = HTTParty.get(url)
   url_array = url.split("")
   i = nil
   url_array.each_with_index{|v, k| i = k if v == "/"}
   filename = url[i+1..-1]
   if response.success?
     File.open("#{filename}", "wb") do |f|
       f.write response.parsed_response
     end
   else
     raise response.response
   end
  end

end
