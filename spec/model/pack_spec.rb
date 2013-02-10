require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
include Moo::Model

describe Moo::Model::Pack do

  def product_codes
    ['businesscard', 'minicard', 'postcard', 'holidaycard', 'sticker']
  end

  describe 'initialize' do
    it 'should initialize cards to empty array' do
      Pack.new.cards.should == []
    end

    it 'should initialize sides to empty array' do
      Pack.new.sides.should == []
    end
  end

  describe 'product_code=' do
    it "should set the product code" do
      pack = Pack.new
      pack.product_code = 'businesscard'
      pack.product_code.should == 'businesscard'
    end
    it 'should complain on invalid product code' do
      pack = Pack.new
      expect { pack.product_code = 'slarty' }.to(
        raise_error ArgumentError, "Invalid product code 'slarty', must be one of [#{product_codes.join(', ')}]"
      )
    end
    it "should not complain on a valid product code" do
      pack = Pack.new
      expect {pack.product_code = 'businesscard'}.to_not raise_error ArgumentError
    end
  end

end
