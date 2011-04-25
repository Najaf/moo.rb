require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

include Moo::Model

describe Moo::Model::BoxData do
  describe 'type' do
    it "returns 'boxData'" do
      d = BoxData.new
      d.type.should == 'boxData'
    end
  end
end
