require 'httparty'
require 'open-uri'
class ImageController < ApplicationController

  def index
    @images = Image.all
  end

  def download
    render json: { msg: "ok"}
    # raw_image = HTTParty.get(url)
    # if response.success?
    #   new_image = Image.new(raw_image)
    #   new_image.save
    # else
    #   raise raw_image.response
    # end
    # save_image(params[:url])
  end

  def save_image(url)
    logger.debug(params[:url])
    raw_image = HTTParty.get('URI')
    if response.success?
      new_image = Image.new(raw_image)
      new_image.save
    else
      raise raw_image.response
    end
  end

  # def destroy
  #   work = Work.find(params[:id])
  #   work.destroy
  #   redirect_to root_path
  # end

private
  #
  # def image_params
  #   params.require(:image).permit(:url)
  # end

end
