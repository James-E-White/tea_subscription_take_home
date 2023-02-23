class TeasController < ApplicationController
 def create
    new_tea = Tea.create!(tea_params)
    render json: TeaSerializer.new(tea)
  end

  private

  def tea_params
    params.permit(:title, :description, :temperature, :brew_time)
  end
end