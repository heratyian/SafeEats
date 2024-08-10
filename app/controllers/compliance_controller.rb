class ComplianceController < ApplicationController
  before_action only: [:check, :safe]

  def food
    # render "compliant/food"
  end

  def check_compliance
    ingredients_param = params["ingredients"]
    @ingredients = ingredients_param.present? ? ingredients_param.split(',').map(&:strip) : []

    if @ingredients.empty?
      redirect_to food_path, { :alert => "Please enter ingredients before proceeding." }
    else
      service = FoodComplianceService.new(current_user, @ingredients)
      @compliant = service.call

      if @compliant
        render "compliance/can_eat"
      else
        render "compliance/cant_eat"
      end
    end
  end
end
