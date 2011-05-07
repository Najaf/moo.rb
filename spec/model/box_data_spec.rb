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
      expect { d.colour = 'woof woof' }.should raise_error ArgumentError
    end
  end
end
