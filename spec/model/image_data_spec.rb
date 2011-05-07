require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

include Moo::Model

describe Moo::Model::ImageData do
  describe 'initialize' do
    d = ImageData.new
    [:link_id, :image_box, :resource_uri, :image_store_file_id].each do |att|
      it "sets #{att.to_s} to nil" do
        d.send(att).should == nil
      end
    end

    it "sets enhance to false" do
      d = ImageData.new
      d.enhance.should === false
    end
  end

  describe 'type' do
    it "returns 'imageData'" do
      d = ImageData.new
      d.type.should == 'imageData'
    end
  end

  describe "image_box=" do
    it "sets the value of image_box" do
      d = ImageData.new
      b = BoundingBox.new
      d.image_box = b
      d.image_box.should == b
    end

    it "complains if value isn't a BoundingBox" do
      d = ImageData.new
      expect { d.image_box = 'woof' }.should raise_error ArgumentError
    end
  end

  describe "resource_uri=" do
    it "sets the value of resource_uri" do
      d = ImageData.new
      d.resource_uri = 'woof'
      d.resource_uri.should == 'woof'
    end

    it "complains if value not a string" do
      d = ImageData.new
      expect { d.resource_uri = 123 }.should raise_error ArgumentError
    end
  end

  describe "image_store_file_id=" do
    it "sets the value of image_store_file_id" do
      d = ImageData.new
      d.image_store_file_id = 'woof'
      d.image_store_file_id.should == 'woof'
    end

    it "complains if value not a string" do
      d = ImageData.new
      expect { d.image_store_file_id = 123 }.should raise_error ArgumentError
    end
  end

  describe "enhance=" do
    it "sets the value of enhance" do
      d = ImageData.new
      d.enhance = true
      d.enhance.should === true
    end

    it "complains if value not a boolean" do
      d = ImageData.new
      expect { d.enhance = 'woof woof' }.should raise_error ArgumentError
    end
  end
end

