require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Object do
  describe 'complain_if_not_a' do
    it 'should raise an error if object is not an instance of provided class' do
      expect { "hello world".complain_if_not_a Fixnum }.should raise_error ArgumentError
      expect { 123.complain_if_not_a String }.should raise_error ArgumentError
    end
  end
end
