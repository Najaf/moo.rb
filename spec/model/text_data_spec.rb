require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

include Moo::Model

describe Moo::Model::TextData do
  describe 'type' do
    it "returns 'textData'" do
      d = TextData.new
      d.type.should == 'textData'
    end
  end
end
