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

  describe "to_json" do
    it "should represent the data in an image_data object" do
      d = ImageData.new

      b = BoundingBox.new
      b.centre = [20,40]
      b.width = 20
      b.height = 30
      b.angle = 40
      d.image_box = b

      d.link_id = 'some_link_id'
      d.resource_uri = 'abc://123'
      d.enhance = false
      
      expected_json = {
        type: "imageData",
        linkId: "some_link_id",
        imageBox: b.to_hash,
        resourceUri: 'abc://123',
        imageStoreFileId: nil,
        enhance: false
      }.to_json

      d.to_json.should == expected_json

    end
  end

  describe "from_json" do
    it "loads data into an ImageData object from a json string" do
      b = BoundingBox.new
      b.centre = [20,40]
      b.width = 20
      b.height = 30
      b.angle = 40

      json = {
        type: "imageData",
        linkId: "some_link_id",
        imageBox: b.to_hash,
        resourceUri: 'abc://123',
        imageStoreFileId: 'wxyz-blah-blah',
        enhance: true
      }.to_json

      d = ImageData.new
      d.from_json json
      d.image_box.to_hash.should == b.to_hash
      d.link_id.should == 'some_link_id'
      d.resource_uri.should == 'abc://123'
      d.image_store_file_id.should == 'wxyz-blah-blah'
      d.enhance.should == true
    end
  end
end

