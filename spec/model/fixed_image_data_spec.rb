require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

include Moo::Model

describe Moo::Model::FixedImageData do
  describe 'initialize' do
    it 'sets link_id to nil' do
      d = FixedImageData.new
      d.link_id.should == nil
    end
  end
  describe 'type' do
    it "returns 'fixedImageData'" do
      d = FixedImageData.new
      d.type.should == 'fixedImageData'
    end
  end
end
