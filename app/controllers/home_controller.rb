class HomeController < ApplicationController
  def index
  end

  def show
    if !signed_in?
      redirect_to action: 'index'
    end
  end
end
