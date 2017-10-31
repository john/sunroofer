class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: ['index']

  def index
    @roof_sets = RoofSet.all
  end

end

