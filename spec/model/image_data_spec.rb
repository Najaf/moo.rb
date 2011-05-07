require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

include Moo::Model

describe Moo::Model::ImageData do
  describe 'initialize' do
    it 'sets link_id to nil' do
      d = ImageData.new
      d.link_id.should == nil
    end
  end
  describe 'type' do
    it "returns 'imageData'" do
      d = ImageData.new
      d.type.should == 'imageData'
    end
  end
end

