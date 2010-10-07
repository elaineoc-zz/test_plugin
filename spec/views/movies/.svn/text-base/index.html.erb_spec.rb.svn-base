require 'spec_helper'

describe "/movies/index.html.erb" do
  include MoviesHelper

  before(:each) do
    assigns[:movies] = [
      stub_model(Movie,
        :title => "value for title",
        :rating => 1
      ),
      stub_model(Movie,
        :title => "value for title",
        :rating => 1
      )
    ]
  end

  it "renders a list of movies" do
    render
    response.should have_tag("tr>td", "value for title".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end
