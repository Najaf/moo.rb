require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
include Moo::Model

describe Moo::Model::Colour do
  describe 'initialize' do
    it 'should initialize type to nil' do
      c = Colour.new
      c.type.should == nil
    end
  end

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

  describe 'c=' do
    it 'should set the value of c' do
      c = Colour.new
      c.c = 50
      c.c.should == 50
    end
    it 'should complain when value is non-numeric' do
      c = Colour.new
      expect { c.c = 'blah' }.should(
        raise_error ArgumentError, 'tried to set c to non-numeric value'
      )
    end
    it 'should complain if value is out of range 0 - 100' do
      c = Colour.new
      expect { c.c = 112.5 }.should(
        raise_error ArgumentError, 'value 112.5 out of range, must be between 0 and 100.0 inclusive'
      )
    end
  end

  describe 'm=' do
    it 'should set the value of m' do
      c = Colour.new
      c.m = 50
      c.m.should == 50
    end
    it 'should complain when value is non-numeric' do
      c = Colour.new
      expect { c.m = 'blah' }.should(
        raise_error ArgumentError, 'tried to set m to non-numeric value'
      )
    end
    it 'should complain if value is out of range 0 - 100' do
      c = Colour.new
      expect { c.m = -226.543  }.should(
        raise_error ArgumentError, 'value -226.543 out of range, must be between 0 and 100.0 inclusive'
      )
    end
  end

  describe 'y=' do
    it 'should set the value of y' do
      c = Colour.new
      c.y = 50
      c.y.should == 50
    end
    it 'should complain when value is non-numeric' do
      c = Colour.new
      expect { c.y = 'blah' }.should(
        raise_error ArgumentError, 'tried to set y to non-numeric value'
      )
    end
    it 'should complain if value is out of range 0 - 100' do
      c = Colour.new
      expect { c.y = -226.543  }.should(
        raise_error ArgumentError, 'value -226.543 out of range, must be between 0 and 100.0 inclusive'
      )
    end
  end

  describe 'k=' do
    it 'should set the value of k' do
      c = Colour.new
      c.k = 50
      c.k.should == 50
    end
    it 'should complain when value is non-numeric' do
      c = Colour.new
      expect { c.k = 'blah' }.should(
        raise_error ArgumentError, 'tried to set k to non-numeric value'
      )
    end
    it 'should complain if value is out of range 0 - 100' do
      c = Colour.new
      expect { c.k = 226.543  }.should(
        raise_error ArgumentError, 'value 226.543 out of range, must be between 0 and 100.0 inclusive'
      )
    end
  end

  describe 'r=' do
    it 'should set the value of r' do
      c = Colour.new
      c.r = 50
      c.r.should == 50
    end
    it 'should complain when value is non-numeric' do
      c = Colour.new
      expect { c.r = 'blah' }.should(
        raise_error ArgumentError, 'tried to set r to non-numeric value'
      )
    end
    it 'should complain if value is out of range 0 - 255' do
      c = Colour.new
      expect { c.r = 276.543  }.should(
        raise_error ArgumentError, 'value 276.543 out of range, must be between 0 and 255 inclusive'
      )
    end
  end

  describe 'g=' do
    it 'should set the value of g' do
      c = Colour.new
      c.g = 50
      c.g.should == 50
    end
    it 'should complain when value is non-numeric' do
      c = Colour.new
      expect { c.g = 'blah' }.should(
        raise_error ArgumentError, 'tried to set g to non-numeric value'
      )
    end
    it 'should complain if value is out of range 0 - 255' do
      c = Colour.new
      expect { c.g = 276.543  }.should(
        raise_error ArgumentError, 'value 276.543 out of range, must be between 0 and 255 inclusive'
      )
    end
  end

  describe 'b=' do
    it 'should set the value of b' do
      c = Colour.new
      c.b = 50
      c.b.should == 50
    end
    it 'should complain when value is non-numeric' do
      c = Colour.new
      expect { c.b = 'blah' }.should(
        raise_error ArgumentError, 'tried to set b to non-numeric value'
      )
    end
    it 'should complain if value is out of range 0 - 255' do
      c = Colour.new
      expect { c.b = 276.543  }.should(
        raise_error ArgumentError, 'value 276.543 out of range, must be between 0 and 255 inclusive'
      )
    end
  end

  describe "to_hash" do
    it "should reflect the values set on the colour object" do
      hash = {
        :type => 'RGB',
        :r    => 100,
        :g    => 150,
        :b    => 200
      }
      c = Colour.new
      c.type = 'rgb'
      c.r = 100
      c.g = 150
      c.b = 200
      c.to_hash.should == hash

      hash = {
        :type => 'CMYK',
        :c => 50,
        :m => 60,
        :y => 70,
        :k => 80
      }

      c = Colour.new
      c.type = 'cmyk'
      c.c = 50
      c.m = 60
      c.y = 70
      c.k = 80

      c.to_hash.should == hash
    end
  end

  describe "from_hash" do
    it "should load values into a colour from a hash" do
      hash = {
        :type => 'CMYK',
        :c => 50,
        :m => 60,
        :y => 70,
        :k => 80
      }
      c = Colour.new
      c.from_hash(hash)
      c.type.should == 'CMYK'
      c.c.should == 50
      c.m.should == 60
      c.y.should == 70
      c.k.should == 80

      hash = {
        :type => 'RGB',
        :r    => 100,
        :g    => 150,
        :b    => 200
      }
      c.from_hash(hash)
      c.type.should == 'RGB'
      c.r.should == 100
      c.g.should == 150
      c.b.should == 200
    end
  end
end
