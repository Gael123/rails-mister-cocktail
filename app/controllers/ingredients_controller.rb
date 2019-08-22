class IngredientsController < ApplicationController
def index
@ingredient = Ingredient.all
end

def new
  @ingredient = Ingredient.new

 end
  def show
    @ingredient = Ingredient.find(params[:id])
   end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.save
    redirect_to ingredient_path(@ingredient)
  end
 def ingredients_params
  params.require(:ingredient).permit(:name)

 end


end
