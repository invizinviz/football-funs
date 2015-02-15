class Team < ActiveRecord::Base
  has_many :tweets

  def instagram_images
    data = HTTParty.get("https://api.instagram.com/v1/users/#{self.instagram_id}/media/recent/?access_token=#{ENV['INST_ACCESS_TOKEN']}&count=10")
    arr_imgs = []
    img = {}
    if data["data"].count > 10
      for i in 0..9
        arr_imgs << img = {
          url: data["data"][i]["images"]["standard_resolution"]["url"],
          comments: data["data"][i]["comments"]["count"],
          likes:  data["data"][i]["likes"]["count"]
        }
      end
    end
    arr_imgs
  end
end
