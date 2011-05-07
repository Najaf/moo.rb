require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

include Moo::Model

describe Moo::Model::TextData do
  describe 'initialize' do
    it 'sets link_id to nil' do
      d = TextData.new
      d.link_id.should == nil
    end
  end
  describe 'type' do
    it "returns 'textData'" do
      d = TextData.new
      d.type.should == 'textData'
    end
  end
end
