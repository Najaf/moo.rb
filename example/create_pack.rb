$:.unshift File.expand_path("../lib", File.dirname(__FILE__))
require "moo"

# create the client
client = Moo::Client.new(ENV["MOO_CONSUMER_KEY"], ENV["MOO_CONSUMER_SECRET"])

# upload an image, and put it in a basket
image_hash = client.upload_image(File.join(File.dirname(__FILE__), "image.png"))
image_basket = Moo::Model::ImageBasket.new
image_item = Moo::Model::ImageBasketItem.from_hash(image_hash[:imageBasketItem])
image_basket.items << image_item

# build the pack
pack = Moo::Model::Pack.new
pack.image_basket = image_basket
pack.num_cards = 100
pack.product_code = "minicard"

# build the image side
pack.sides << Moo::Model::Side.new do |side|
  side.side_num = 1
  side.template_code = "minicard_full_image_landscape"
  side.type = "image"
  side.data << Moo::Model::ImageData.new do |image_data|
    image_data.link_id = "variable_image_front"
    image_data.resource_uri = image_item.resource_uri
    image_data.image_box = Moo::Model::BoundingBox.new do |b|
      b.centre = [74/2, 32/2]
      b.width = 74
      b.height = 32
    end
    image_data.enhance = false
  end
end

# build the text side
pack.sides << Moo::Model::Side.new do |side|
  side.side_num = 2
  side.template_code = "minicard_full_text_landscape"
  side.type = "details"
  side.data << Moo::Model::TextData.new do |text_data|
    text_data.link_id = "back_line_1"
    text_data.text = "back"
  end
end

# create the pack
response = client.create_pack(pack)
puts response[:dropIns][:preview]
