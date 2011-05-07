require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

include Moo::Model

describe Moo::Model::FixedImageData do
  describe 'initialize' do

    it 'sets link_id to nil' do
      d = FixedImageData.new
      d.link_id.should == nil
    end

    it 'sets resource_uri to nil' do
      d = FixedImageData.new
      d.resource_uri.should == nil
    end
  end

  describe 'type' do
    it "returns 'fixedImageData'" do
      d = FixedImageData.new
      d.type.should == 'fixedImageData'
    end
  end

  describe 'resource_uri=' do
    it "sets the value of resource_uri" do
      d = FixedImageData.new
      d.resource_uri = 'http://example.com'
      d.resource_uri.should == 'http://example.com'
    end

    it "should complain if resource uri is not a string" do
      d = FixedImageData.new
      expect { d.resource_uri = 12 }.should raise_error ArgumentError
    end
  end
end
