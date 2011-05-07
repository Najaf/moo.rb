require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require 'json'

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
    it 'sets value of centre to an array from an array' do
      b = BoundingBox.new
      b.centre = [47,324.928]
      b.centre.should == [47,324.928]
    end

    it 'sets value of centre to an array from an x/y keyed hash' do
      b = BoundingBox.new
      b.centre = { :y => 12, :x => 15.457 }
      b.centre.should == [15.457, 12]
    end
    
    it "complains when value isn't enumerable" do
      b = BoundingBox.new
      expect { b.centre = 'hello world' }.should(
        raise_error ArgumentError, "value must be Enumerable, String given"
      )
      expect { b.centre = 25 }.should(
        raise_error ArgumentError, "value must be Enumerable, Fixnum given"
      )
    end
  end

  describe 'width=' do
    it 'sets the value of width' do
      b = BoundingBox.new
      b.width = 27
      b.width.should == 27
    end

    it 'complains if value is non-numeric' do
      b = BoundingBox.new
      expect { b.width = 'hello world' }.should raise_error ArgumentError
    end
  end

  describe 'height=' do
    it 'sets the value of height' do
      b = BoundingBox.new
      b.height = 27
      b.height.should == 27
    end

    it 'complains if value is non-numeric' do
      b = BoundingBox.new
      expect { b.height = 'hello world' }.should raise_error ArgumentError
    end
  end

  describe 'angle=' do
    it 'sets the value of angle' do
      b = BoundingBox.new
      b.angle = 27
      b.angle.should == 27
    end

    it 'complains if value is non-numeric' do
      b = BoundingBox.new
      expect { b.angle = 'hello world' }.should raise_error ArgumentError
    end
  end

  describe "to_json" do
    it "shows a zeroed out bounding box by default" do
      json = {
        :center => {
          :x => 0,
          :y => 0
        },
        :width  => 0,
        :height => 0,
        :angle  => 0
      }.to_json
      BoundingBox.new.to_json.should == json
    end

    it "values should reflect those of fields on bounding box" do
      json = {
        :center => {
          :x => 1,
          :y => 2
        },
        :width  => 3,
        :height => 4,
        :angle  => 5.5
      }.to_json
      b = BoundingBox.new
      b.centre = [1,2]
      b.width = 3
      b.height = 4
      b.angle = 5.5
      b.to_json.should == json
    end
  end

  describe "from_json" do
    it "sets the values on a bounding box from json" do
      json = {
        :center => {
          :x => 3,
          :y => 4
        },
        :width  => 5.6,
        :height => 6.7,
        :angle  => 7.8
      }.to_json

      b = BoundingBox.new
      b.from_json json
      b.centre.should == [3,4]
      b.width.should  == 5.6
      b.height.should == 6.7
      b.angle.should  == 7.8
    end
  end

end
