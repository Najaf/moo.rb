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
      expect { d.resource_uri = 12 }.to raise_error ArgumentError
    end
  end

  describe 'to_hash' do
    it 'represents FixedImageData object as hash' do
      d = FixedImageData.new
      expected = {
        type: d.type,
        linkId: 'fixed_image_link_id',
        resourceUri: 'abc://123'
      }

      d.link_id = 'fixed_image_link_id'
      d.resource_uri = 'abc://123'

      d.to_hash.should == expected
    end
  end

  describe 'from_hash' do
    it 'sets fixed image data from a hash' do
      d = FixedImageData.new
      hash = {
        type: d.type,
        linkId: 'blah_bleeh_blooh',
        resourceUri: 'waah-weeh-wooh'
      }
      d.from_hash(hash)
      d.link_id.should == 'blah_bleeh_blooh'
      d.resource_uri.should == 'waah-weeh-wooh'
    end
  end
end
