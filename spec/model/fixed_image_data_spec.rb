require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

include Moo::Model

describe Moo::Model::FixedImageData do
  describe 'type' do
    it "returns 'fixedImageData'" do
      d = FixedImageData.new
      d.type.should == 'fixedImageData'
    end
  end
end
