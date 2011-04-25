require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe String do
  describe 'uncapitalize' do
    it 'downcases the first letter of a string' do
      'ABCDEFG'.uncapitalize.should == 'aBCDEFG'
    end
    it 'preserves the case of the remaining chars' do
      'AbCdEfG'.uncapitalize.should == 'abCdEfG'
    end
    it 'returns the original string if it starts with a lower case letter' do
      'blah'.uncapitalize.should == 'blah'
    end
    it 'returns the empty string if original string is empty' do
      ''.uncapitalize.should == ''
    end
  end
end
