class ExpertFieldsController < ApplicationController

  def new
    @expert_field = ExpertField.new
    @expert = Expert.find(params[:expert_id])
  end

  def create
    @expert = Expert.find(params[:expert_id])
    @expert_field = ExpertField.new(expert_field_params)
    @expert_field.expert = @expert
    if @expert_field.save
      redirect_to root_path notice: "Congratulations, visitors can now request your services!" # path needs to be updated to experts#show page
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def expert_field_params
    params.require(:expert_field).permit(:field_id)
  end
end
