class Coreman::EntitiesController < ApplicationController
  def index
    @entities = Entity.where(user_id: authenticated?.user_id)
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
