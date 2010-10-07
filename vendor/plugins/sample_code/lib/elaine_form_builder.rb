class ElaineFormBuilder < ActionView::Helpers::FormBuilder
  #Adds error message directly inline to a form label
  #Accepts all the options normal passed to form.label as well as:
  #  :hide_errors - true if you don't want errors displayed on this label
  #  :additional_text - Will add additional text after the error message or after the label if no errors
  def label(method, text = nil, options = {})
    #Check to see if text for this label has been supplied and humanize the field name if not.
    text = text || method.to_s.humanize
    #Get a reference to the model object
    object = @template.instance_variable_get("@#{@object_name}")



    puts object.class
    puts method

   # puts is_required_field?(Movie, "title")
    
    #Generate the label using the text as well as the error message wrapped in a span with error class
    text += "********" if is_required_field?(object.class, method)

    #Add any additional text that might be needed on the label
    text += " #{options[:additional_text]}" if options[:additional_text]
    #Finally hand off to super to deal with the display of the label
    super(method, text, options)
  end
  

   def is_required_field?(klass, field_name)
   return false unless klass.respond_to?(:reflect_on_validations_for)

   field = find_association_name_for(klass, field_name)
   validations = klass.reflect_on_validations_for(field)
   return validations.any?{|v| v.macro == :validates_presence_of}
 end

 private

 def find_association_name_for(klass, field_name)
    association =
klass.reflect_on_all_associations(:belongs_to).select do |association|
      association.primary_key_name.to_sym == field_name.to_sym
    end.first
   return association.nil? ? field_name :  association.name
 end


end




