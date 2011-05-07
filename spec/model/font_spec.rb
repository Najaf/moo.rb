require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

include Moo::Model

describe Moo::Model::Font do
  describe 'initialize' do 
    it 'sets family to helvetica by default' do
      f = Font.new
      f.family.should == 'helvetica'
    end

    it 'sets bold to false by default' do
      f = Font.new
      f.bold.should === false
    end

    it 'sets italic to false by default' do
      f = Font.new
      f.italic.should === false
    end
  end

  it 'should respond to bold? to determine boldness' do
      f = Font.new
      f.bold?.should === false
      f.bold = true
      f.bold?.should === true
  end

  it 'should respond to italic? to determine italicness' do
      f = Font.new
      f.italic?.should === false
      f.italic = true
      f.italic?.should === true
  end

  describe 'family=' do
    it 'should set the value of family' do
      f = Font.new
      f.family = 'arial'
      f.family.should == 'arial'
    end

    it "should complain if value isn't a string" do
      f = Font.new
      expect { f.family = 42 }.should raise_error ArgumentError
    end

    it "should complain if value isn't in accepted fonts" do
      f = Font.new
      expect { f.family = 'This spec is baller' }.should raise_error ArgumentError
    end
  end
end
