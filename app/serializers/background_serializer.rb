class BackgroundSerializer
  def self.format_data(photo)
    {
      "data": {
        "type": "image",
        "id": nil,
        "attributes": {
          "image": {
            "location": photo.location,
            "image_url": photo.image_url,
            "credit": {
              "source": "unsplash.com",
              "author": photo.author,
              "logo": "https://unsplash.com/blog/content/images/max/2560/1-VnKoValwGK3-d1bZhD6sVA.jpeg"
            }
          }
        }
      }
    }
  end
end