require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

include Moo::Model

describe Moo::Model::MultiLineTextData do
  describe 'initialize' do
    it 'sets link_id to nil' do
      d = MultiLineTextData.new
      d.link_id.should == nil
    end
  end
  describe 'type' do
    it "returns 'multiLineTextData'" do
      d = MultiLineTextData.new
      d.type.should == 'multiLineTextData'
    end
  end
end

