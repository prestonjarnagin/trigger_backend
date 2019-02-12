class WelcomeController < ApplicationController

  def show
    render html: "Documentation for this website can be found at https://github.com/prestonjarnagin/trigger_backend"
  end

end
