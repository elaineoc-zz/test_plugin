 require File.dirname(__FILE__) + '/spec_helper'

 describe "ElaineFormBuilder" do
   it "should print '****' after each label" do
     form = ElaineFormBuilder.new(object_name, object)
     elaine = form.label(method, 'Elaine', nil)
     puts elaine
   end
 end