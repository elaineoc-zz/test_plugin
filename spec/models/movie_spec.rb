require 'spec_helper'

describe Movie do
  before(:each) do
    @valid_attributes = {
      :title => "value for title",
      :rating => 1
    }
  end

  it{should validate_presence_of(:title)}

  it "should create a new instance given valid attributes" do
    Movie.create!(@valid_attributes)
  end
end
