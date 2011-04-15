module MooClient
  class Pack
    attr_accessor :cards
  end

  class Card
    # image and details side
    attr_accessor :image_side, :details_side
  end

  class Side
    attr_accessor :template_code
  end
end


