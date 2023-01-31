class ApplicationController < ActionController::Base

  def homepage
    render ({ :template => "dashboard_templates/homepage.html.erb"})
  end

end
