require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
include Moo::Model

describe Moo::Model::Side do
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

    it "should not complain on valid template code" do
      side = Side.new
      expect { side.template_code = 'businesscard_full_image_landscape' }.should_not(
          raise_error(ArgumentError, "invalid templatecode")
      )
    end

    it "should set @template to the appropriate template object" do
      side = Side.new
      side.template_code = "businesscard_full_image_landscape"
      side.template.code.should == 'businesscard_full_image_landscape'
    end
  end

  describe "template_code" do
    it "should return nil if template or template code hasn't been set yet" do
      Side.new.template_code.should == nil
    end

    it "should return set template code if template code set" do
      side = Side.new
      side.template_code = 'businesscard_full_image_landscape'
      side.template_code.should == 'businesscard_full_image_landscape'
    end
  end

  describe 'to_hash' do
    it 'outputs a hash representation of a side object' do
      expected = {
        :sideNum => 4,
        :templateCode => "minicard_full_image_portrait",
        :type => "image",
        :data => [
          {
            :type => "imageData",
            :linkId => "variable_image_front",
            :imageBox => {
              :center => {
                :x => 11.5384615385,
                :y => 37
              },
              :width => 55.5,
              :height => 74,
              :angle => 0
            },
            :resourceUri => "http://farm2.static.flickr.com/1382/4609720520_b321f27011_o.jpg",
            :enhance => false
          }
        ]
      }
      i = ImageData.new
      i.link_id = 'variable_image_front'
      i.resource_uri = 'http://farm2.static.flickr.com/1382/4609720520_b321f27011_o.jpg'
      i.enhance = false
      b = BoundingBox.new
      b.centre = [11.5384615385, 37]
      b.width = 55.5
      b.height = 74
      b.angle = 0
      i.image_box = b

      s = Side.new
      s.data << i
      s.side_num = 4
      s.template_code = 'minicard_full_image_portrait'
      s.type = 'image'
      s.to_hash.should == expected
    end
  end

  describe "from_hash" do
    it "sets data on a side from a hash" do
      hash = {
        :sideNum => 4,
        :templateCode => "minicard_full_image_portrait",
        :type => "image",
        :data => [
          {
            :type => "imageData",
            :linkId => "variable_image_front",
            :imageBox => {
              :center => {
                :x => 11.5384615385,
                :y => 37
              },
              :width => 55.5,
              :height => 74,
              :angle => 0
            },
            :resourceUri => "http://farm2.static.flickr.com/1382/4609720520_b321f27011_o.jpg",
            :enhance => false
          }
        ]
      }
      i = ImageData.new
      i.link_id = 'variable_image_front'
      i.resource_uri = 'http://farm2.static.flickr.com/1382/4609720520_b321f27011_o.jpg'
      i.enhance = false
      b = BoundingBox.new
      b.centre = [11.5384615385, 37]
      b.width = 55.5
      b.height = 74
      b.angle = 0
      i.image_box = b

      s = Side.new
      s.from_hash(hash)
      s.side_num.should == 4
      s.template_code.should == 'minicard_full_image_portrait'
      s.type.should == 'image'
      s.data.length.should == 1
      s.data[0].to_hash.should == i.to_hash

    end
  end
end
