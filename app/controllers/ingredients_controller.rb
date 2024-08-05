class IngredientsController < ApplicationController
  before_action :set_ingredient, only: %i[ show edit update destroy ]
  require 'csv'

  def index
    @ingredients = Ingredient.all
  end

  def show
  end

  def new
    @ingredient = Ingredient.new
  end

  def edit
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)

    respond_to do |format|
      if @ingredient.save
        format.html { redirect_to ingredient_url(@ingredient), notice: "Ingredient was successfully created." }
        format.json { render :show, status: :created, location: @ingredient }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

def update
  respond_to do |format|
    if @ingredient.update(ingredient_params)
      format.html { redirect_to ingredient_url(@ingredient), notice: "Ingredient was successfully updated." }
      format.json { render :show, status: :ok, location: @ingredient }
    else
      format.html { render :edit, status: :unprocessable_entity }
      format.json { render json: @ingredient.errors, status: :unprocessable_entity }
    end
  end
end

  def destroy
    @ingredient.destroy!

    respond_to do |format|
      format.html { redirect_to ingredients_url, notice: "Ingredient was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    def ingredient_params
      params.require(:ingredient).permit(:name, :vegetarian, :vegan)
    end
end
