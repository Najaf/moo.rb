require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
include Moo::Model

describe Moo::Model::BoxData do
  describe 'initialize' do
    it 'sets link_id to nil' do
      d = BoxData.new
      d.link_id.should == nil
    end

    it 'sets colour to nil' do
      d = BoxData.new
      d.colour.should == nil
    end
  end

  describe 'type' do
    it "returns 'boxData'" do
      d = BoxData.new
      d.type.should == 'boxData'
    end
  end

  describe 'colour=' do
    it 'sets the value of colour' do
      d = BoxData.new
      c = Colour.new
      d.colour = c
      d.colour.should == c
    end

    it "complains if value isn't a Colour" do
      d = BoxData.new
      expect { d.colour = 'woof woof' }.to raise_error ArgumentError
    end
  end

  describe 'to_hash' do
    it 'should reflect the values set on the boxdata object' do
      c= Colour.new
      c.type = 'rgb'
      c.r = 100
      c.g = 150
      c.b = 200
      bd = BoxData.new
      bd.link_id = 'woof_woof'
      bd.colour = c
      expected = {
        :linkId => 'woof_woof',
        :type => 'boxData',
        :colour => {
          :type => 'RGB',
          :r    => 100,
          :g    => 150,
          :b    => 200
        }
      }
      bd.to_hash.should == expected
    end
  end

  describe 'from_hash' do
    it 'should set values on boxdata from a hash' do
      c= Colour.new
      c.type = 'rgb'
      c.r = 100
      c.g = 150
      c.b = 200
      hash = {
        :linkId => 'woof_woof',
        :type => 'boxData',
        :colour => c.to_hash
      }
      bd = BoxData.new
      bd.from_hash(hash)
      bd.colour.to_hash.should == c.to_hash
      bd.type.should == 'boxData'
      bd.link_id.should == 'woof_woof'
    end
  end
end
