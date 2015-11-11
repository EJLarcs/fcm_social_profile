class Image < ActiveRecord::Base

  BASE_DIR = "#{::Rails.root}/Images"

  def self.create_from_raw(url, raw_image)
    filename = (url.split("/"))[-1]
    new_image = Image.new(url: url, name: filename, path: self.path(filename))
    new_image.save
    File.open(self.path(filename), "wb") do |f|
      f.write raw_image.parsed_response
    end
    new_image
  end

private

  def self.path(filename)
    File.join(BASE_DIR, filename)
  end

end
