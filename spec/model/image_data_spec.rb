require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

include Moo::Model

describe Moo::Model::ImageData do
  describe 'type' do
    it "returns 'imageData'" do
      d = ImageData.new
      d.type.should == 'imageData'
    end
  end
end

