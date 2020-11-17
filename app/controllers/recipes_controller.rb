class RecipesController < ApplicationController

  def about_page
    render({:template => "content/about.html.erb" })
  end

  def recipe_search
    render({:template => "content/home.html.erb" })
  end

  def index
    matching_recipes = Recipe.all

    @list_of_recipes = matching_recipes.order({ :created_at => :desc })

    render({ :template => "recipes/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_recipes = Recipe.where({ :id => the_id })

    @the_recipe = matching_recipes.at(0)

    render({ :template => "recipes/show.html.erb" })
  end

  def create
    the_recipe = Recipe.new
    the_recipe.name = params.fetch("query_name")
    the_recipe.user_id = params.fetch("query_user_id")
    the_recipe.prep_duration = params.fetch("query_prep_duration")
    the_recipe.cook_duration = params.fetch("query_cook_duration")
    the_recipe.main_ingredient = params.fetch("query_main_ingredient")
    the_recipe.ingredient2 = params.fetch("query_ingredient2")
    the_recipe.description = params.fetch("query_description")

    if the_recipe.valid?
      the_recipe.save
      redirect_to("/recipes", { :notice => "Recipe created successfully." })
    else
      redirect_to("/recipes", { :notice => "Recipe failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_recipe = Recipe.where({ :id => the_id }).at(0)

    the_recipe.name = params.fetch("query_name")
    the_recipe.user_id = params.fetch("query_user_id")
    the_recipe.prep_duration = params.fetch("query_prep_duration")
    the_recipe.cook_duration = params.fetch("query_cook_duration")
    the_recipe.main_ingredient = params.fetch("query_main_ingredient")
    the_recipe.ingredient2 = params.fetch("query_ingredient2")
    the_recipe.description = params.fetch("query_description")

    if the_recipe.valid?
      the_recipe.save
      redirect_to("/recipes/#{the_recipe.id}", { :notice => "Recipe updated successfully."} )
    else
      redirect_to("/recipes/#{the_recipe.id}", { :alert => "Recipe failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_recipe = Recipe.where({ :id => the_id }).at(0)

    the_recipe.destroy

    redirect_to("/recipes", { :notice => "Recipe deleted successfully."} )
  end
end
