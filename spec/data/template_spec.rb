require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require 'nokogiri' 

# Some basic sanity checks for template xml
describe 'Templates' do

  before :all do
    @template_dir = Gem.datadir('moo') + '/templates/'
  end

  def template_files
    Dir.entries(@template_dir).reject do |t|
      t == '.' || t == '..'
    end
  end

  they 'have a matching filename and template code' do
    template_files.each do |f|
      fname = @template_dir + '/' + f
      code_from_filename = File.basename(f, '.xml')
      code_from_xml = Nokogiri::XML(open(fname)).css('Code')[0].content
      code_from_filename.should == code_from_xml
    end
  end
end
