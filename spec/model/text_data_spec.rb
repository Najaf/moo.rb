require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

include Moo::Model

describe Moo::Model::TextData do

  before :each do
    @d = TextData.new
  end

  describe 'initialize' do
    [:link_id, :font, :colour, :point_size, :alignment].each do |att|
      it "sets #{att.to_s} to nil" do
        @d.send(att).should == nil
      end
    end
  end

  describe 'type' do
    it "returns 'textData'" do
      @d.type.should == 'textData'
    end
  end

  describe 'font=' do
    it 'sets the value of font' do
      f = Font.new
      @d.font = f
      @d.font.should == f
    end

    it "complains if value isn't a Font" do
      expect { @d.font = 427.821 }.should raise_error ArgumentError
    end
  end
  
  describe 'colour=' do
    it 'sets the value of colour' do
      c = Colour.new
      @d.colour = c
      @d.colour.should == c
    end

    it "complains if value isn't a Colour" do
      expect { @d.colour = 'woof woof' }.should raise_error ArgumentError
    end
  end

  describe 'point_size=' do
    it "sets the value of point_size" do
      @d.point_size = 32.457
      @d.point_size.should == 32.457
    end

    it "complains if value is not Numeric" do
      expect { @d.point_size = 'stringy string'}.should raise_error ArgumentError
    end
  end

  describe 'alignment=' do
    it "sets the alignment" do
      @d.alignment = :left
      @d.alignment.should == :left
    end

    it "should complain if alignment isn't :left, :right or :center" do
      expect { @d.alignment = 'a123' }.should raise_error ArgumentError
    end

    it "shouldn't complain if alignment is set to :left, :right or :center" do
      expect { @d.alignment = :left   }.should_not raise_error ArgumentError
      expect { @d.alignment = :right  }.should_not raise_error ArgumentError
      expect { @d.alignment = :center }.should_not raise_error ArgumentError
    end

    it "shouldn't complain if alignment is set to left, right or center" do
      expect { @d.alignment = 'left'   }.should_not raise_error ArgumentError
      expect { @d.alignment = 'right'  }.should_not raise_error ArgumentError
      expect { @d.alignment = 'center' }.should_not raise_error ArgumentError
    end
  end
end
