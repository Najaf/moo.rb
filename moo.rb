=begin
What problems are we trying to solve here?

a) provide an easy way to manipulate cards/packs/sides
b) apply various contraints (or at least give warnings)
   when pack/card/side data is malformed or incorrect
c) interact with moo api and provide drop-in urls so
   any client code can easily redirect to wherever they
   like
=end
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


