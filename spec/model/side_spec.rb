require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Moo::Model::Side do
    include Moo::Model

    describe "type=" do
        it "should complain if side type is not 'image' or 'details'" do
            side = Side.new
            expect { side.type = 'foo' }.should 
                raise_error(ArgumentError, "type must be either 'image' or 'details'")
        end

        it "should not complain if side type is 'image' or 'details'" do
            side = Side.new
            expect { side.type = 'image' }.should_not raise_error(ArgumentError)
            expect { side.type = 'details' }.should_not raise_error(ArgumentError)
        end
    end
end
