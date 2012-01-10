require 'rspec'
require File.expand_path(File.dirname(__FILE__) + '/../lib/lesstile')

shared_examples_for 'an html formatter' do
  it "normal text unchanged" do
    @format["hello"].should == "hello"
  end

  it "does not modify the input parameter" do
    text = 'hello---\nRAR---'
    @format[text]
    text.should == 'hello---\nRAR---'
  end

  it "surrounds code blocks in appropriate tags" do
    @format["---\nhello\n---\n"].should == "|hello\n|"
  end
  
  it "parses code blocks with language specified" do
    @format["--- abc\nhello\n---\n"].should == "|(abc)hello\n|"
  end
  
  # spaces, dashes, plusses, normal, underscore, brackets, numbers, dots
  ["Ruby on Rails", "Objective-C", "Objective-C++", 
   "Python", "_SQL_", "(X)HTML", "CSS3", "Javascript1.2"].each do |language|
    it "parses code blocks with language #{language}" do
      @format["--- #{language}\nhello\n---\n"].should == "|(#{language.downcase})hello\n|"
    end
  end

  it "parses code blocks at end of input" do
    @format["---\nhello\n---"].should == "|hello\n|"
  end
  it "parses code blocks inside text" do
    @format["yo\n---\nhello\n---\n"].should == "yo\n|hello\n|"
  end

  it "parses multiple code blocks" do
    @format["yo\n---\nhello\n---\nnya\n---\nmore code\n---\n"].should == "yo\n|hello\n|nya\n|more code\n|"
  end

  it "parses unclosed code blocks" do
    @format["yo\n---\nhello"].should == "yo\n---\nhello"
  end

  it 'escapes html' do
    @format["<a>&---\nyo<---"].should == "&lt;a&gt;&amp;|yo&lt;|"
  end

  it 'escapes quotes' do 
    @format['"'].should == "&quot;"
  end
end

describe "Lesstile#format_as_xhtml" do
  before(:all) do
    @lesstile = Lesstile
    @format = lambda {|text| 
      @lesstile.format_as_xhtml(text, 
        :code_formatter => lambda {|code, lang| "|#{"(#{lang})" if lang}#{code}|" },
        :text_formatter => lambda {|text| text }
      )
    }
  end

  it_should_behave_like 'an html formatter'
end

describe "Lesstile#format_as_html" do
  before(:all) do
    @lesstile = Lesstile
    @format = lambda {|text| 
      @lesstile.format_as_html(text, 
        :code_formatter => lambda {|code, lang| "|#{"(#{lang})" if lang}#{code}|" },
        :text_formatter => lambda {|text| text }
      )
    }
  end

  it_should_behave_like 'an html formatter'
end

describe 'Lesstile default text formatter' do
  before(:all) do
    @format = lambda {|text| Lesstile.default_options[:text_formatter][text] }
  end

  it 'recognises links in text' do
    @format[CGI::escapeHTML('"a link":http://example.com "<link":http://example.com linkage')].should == 
      '<a href="http://example.com">a link</a> <a href="http://example.com">&lt;link</a> linkage'
  end

  it 'does not recognise blank links' do
    text = '"":http://example.com'
    @format[CGI::escapeHTML(text)].should == text
  end

  it 'unescapes " since it is not dangerous in plain text and allows us to use a simple regex for link formatting' do
    @format["&quot;"].should == '"'
  end
end

describe "Lesstile#format_with_xhtml with default formatters" do
  before(:all) do
    @lesstile = Lesstile
    @format = @lesstile.method(:format_as_xhtml)
  end

  it 'adds br and code tags' do
    @format["hello\nyou---\na\nb\n---\nmore text\nyeah"].should == 
      "hello<br />\nyou<pre><code>a\nb\n</code></pre>more text<br />\nyeah"
  end
end
