require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

include Moo::Model

describe Moo::Model::MultiLineTextData do
  describe 'type' do
    it "returns 'multiLineTextData'" do
      d = MultiLineTextData.new
      d.type.should == 'multiLineTextData'
    end
  end
end

