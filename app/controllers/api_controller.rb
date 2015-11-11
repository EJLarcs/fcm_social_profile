require 'httparty'
require 'open-uri'

class ApiController < ApplicationController

  def download
    raw_image = HTTParty.get(params[:url])
    if raw_image.success?
      Image.create_from_raw(params[:url], raw_image)
      render json: { msg: "ok"}
    else
      raise raw_image.response
    end
  end

end
