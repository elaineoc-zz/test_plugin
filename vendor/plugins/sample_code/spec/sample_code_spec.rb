 require File.dirname(__FILE__) + '/spec_helper'

 describe "SampleCode" do
   it "should print 'elaine says'" do
     "lala".elaine_says.should == "Elaine says lala"
   end
 end