require 'spec_helper'

describe "/movies/new.html.erb" do
  include MoviesHelper

  before(:each) do
    assigns[:movie] = stub_model(Movie,
      :new_record? => true,
      :title => "value for title",
      :rating => 1
    )
  end

  it "renders new movie form" do
    render

    response.should have_tag("form[action=?][method=post]", movies_path) do
      with_tag("input#movie_title[name=?]", "movie[title]")
      with_tag("input#movie_rating[name=?]", "movie[rating]")
    end
  end
end
