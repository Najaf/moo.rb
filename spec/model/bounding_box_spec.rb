require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

include Moo::Model

describe Moo::Model::BoundingBox do
  describe 'initialize' do
    it 'sets centre to [0,0] by default' do
      b = BoundingBox.new
      b.centre.should == [0,0]
    end
    it 'sets width to 0 by default' do
      b = BoundingBox.new
      b.width.should == 0
    end
    it 'sets height to 0 by default' do
      b = BoundingBox.new
      b.height.should == 0
    end
    it 'sets angle to 0 by default' do
      b = BoundingBox.new
      b.angle.should == 0
    end
  end

  describe 'centre=' do
    it 'sets value of centre' do
      b = BoundingBox.new
      b.centre = [47,324.928]
      b.centre.should == [47,324.928]
    end
    it "complains when value isn't a hash or array" do
      b = BoundingBox.new
      expect { b.centre = 'hello world' }.should(
        raise_error ArgumentError, "value must be a hash or an array, String given"
      )
      expect { b.centre = 25 }.should(
        raise_error ArgumentError, "value must be a hash or an array, Fixnum given"
      )
    end
  end
end
