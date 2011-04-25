require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

require 'fileutils'
include Moo::Model

describe Template do
  def template_files
    template_dir = Gem.datadir('moo') + '/templates/'
    Dir.entries(template_dir).reject do |t|
      t == '.' || t == '..'
    end
  end

  def template_codes
    template_files.map { |f| File.basename f, '.xml' }
  end

  describe 'initialize' do
    before :each do
      @filename = '/tmp/my_template_file.xml'
      @product = 'my'
      @code = 'my_template_file'
      FileUtils.touch @filename
    end

    after :each do
      FileUtils.rm @filename
      @filename = nil
    end

    it "should set filename to provided filename" do
      t = Template.new @filename
      t.filename.should == @filename
    end

    it "should set product to first word before underscore of filename" do
        t = Template.new @filename
        t.product.should == @product
    end

    it "should set code to the basename of the provided filename" do
      t = Template.new @filename
      t.code.should == @code
    end

    it "should complain if passed template filename doesn't exist" do
      expect { Template.new '/tmp/non-existant-file' }.should(
        raise_error(ArgumentError, "Template file provided doesn't exist: /tmp/non-existant-file")
      )
    end
  end

  describe 'loaded?' do
    before do
      Template.unload
    end
    it "should return false until templates are loaded" do
      Template.loaded?.should == false
    end

    it "should return true after templates are loaded" do
      Template.load
      Template.loaded?.should == true
    end

    it "should return false after templates have been unloaded" do
      Template.load
      Template.unload
      Template.loaded?.should == false
    end
  end

  describe 'load' do
    it "should load all templates" do
      Template.load
      Template.all.each do |t|
        t.should be_an_instance_of Template
        template_files.should include File.basename(t.filename)
        # delete this one out of the test array to check for dupes
        template_files.delete File.basename(t.filename)
      end
    end
  end

  describe 'unload' do
    it "should clear out all template objects"  do
      Template.load
      Template.unload
      Template.all.should == nil
    end
  end

  describe 'codes' do
    it "should load all templates if they haven't been loaded yet" do
      Template.unload
      Template.codes
      Template.loaded?.should == true
    end

    it 'should contain all  template codes' do
      codes = template_codes
      Template.codes.each do |c|
        codes.should include c
        codes.delete c
      end
    end
  end

  describe 'with_code' do
    it "should not complain on a rubbish template code" do
      expect { Template.with_code 'woof' }.should_not raise_error ArgumentError
    end

    it "should return nil on a rubbish template code" do
      Template.with_code('woof').should == nil
    end

    it "should load all templates if they haven't been loaded yet" do
      Template.unload
      Template.with_code 'woof'
      Template.loaded?.should == true
    end 

    it "should return template with the provided code" do
      Template.with_code('businesscard_full_image_landscape').code.should == 'businesscard_full_image_landscape'
    end
  end
end
