class HomepageController < ApplicationController
  before_action :authenticate_user!

  def edit
    @diet_types = DietType.all
    render "home/diet"
  end

  def update
    current_user.diet_id = params["diet_id"]
    if current_user.save
      redirect_to(check_ingredient_path)
    else
      @diet_types = DietType.all
      redirect_to root_path, alert: "Please select your diet before proceeding."
    end
  end

end
