require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

include Moo::Model

describe Moo::Model::Colour do
  describe 'type=' do
    it 'sets the type field' do
      c = Colour.new
      c.type = 'CMYK'
      c.type.should == 'CMYK'
    end
    it 'upcases the type field' do
      c = Colour.new
      c.type = 'cmyk'
      c.type.should == 'CMYK'
    end
    it "complains when you set a type that isn't 'cmyk' or 'rgb' (case insensitive)" do
      c = Colour.new
      expect { c.type = 'blah' }.should(
        raise_error ArgumentError, "type must be either 'cmyk' or 'rgb', 'blah' given"
      )
    end
  end
end
