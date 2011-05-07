require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

include Moo::Model

describe Moo::Model::BoxData do
  describe 'initialize' do
    it 'sets link_id to nil' do
      d = BoxData.new
      d.link_id.should == nil
    end
  end
  describe 'type' do
    it "returns 'boxData'" do
      d = BoxData.new
      d.type.should == 'boxData'
    end
  end
end
