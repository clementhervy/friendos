class ExpendituresController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    render plain: params[:expenditure].inspect
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
