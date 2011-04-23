require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Moo::Model::Side do
  include Moo::Model

  describe "type=" do
    it "should complain if side type is not 'image' or 'details'" do
      side = Side.new
      expect { side.type = 'foo' }.should raise_error(ArgumentError, "type must be either 'image' or 'details'")
    end

    it "should not complain if side type is 'image' or 'details'" do
      side = Side.new
      expect { side.type = 'image' }.should_not raise_error(ArgumentError)
      expect { side.type = 'details' }.should_not raise_error(ArgumentError)
    end
  end

  describe "pack=" do
    it "should complain if pack is not a pack object" do
      side = Side.new
      expect { side.pack = Hash.new }.should raise_error(ArgumentError, "pack must be of type Pack, Hash given")
    end
  end

  describe "template_code=" do
    it "should complain on an invalid template code" do
      side = Side.new
      expect { side.template_code = 'slartibartfast' }.should raise_error(ArgumentError, "invalid templatecode")
    end
  end
end
