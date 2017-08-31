class ExpendituresController < ApplicationController
  before_action :require_login

  def index
    @expenditures_created = Expenditure.where(payer: current_user)
    @expenditures_participating = Expenditure.where(group: current_user.groups)
  end

  def show
    @expenditure = Expenditure.find(params[:id])
  end

  def new; end

  def create
    @expenditure = Expenditure.new(required_parameters)
    @expenditure.payer = current_user
    @expenditure.save
    redirect_to @expenditure
  end

  def edit; end

  def update; end

  def destroy; end

  private

  def required_parameters
    params.require(:expenditure).permit(:object, :date_made, :amount, :group, :categories)
  end
end
