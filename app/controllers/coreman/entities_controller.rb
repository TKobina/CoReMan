class Coreman::EntitiesController < ApplicationController
  def index
    user = authenticated?.user_id
    binding.pry
    @entities = Entity.where(user_id: user)
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
end
