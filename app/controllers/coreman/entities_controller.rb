class Coreman::EntitiesController < ApplicationController
  def index
    @entities ||= Entity.where(user_id: Current.user[:id])
    get_entity_types
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

  def get_entity_types
    @entity_types ||= {}
    EntityType.all.each { |t| @entity_types[t[:id]] = t[:value] } if @entity_types.empty?
  end
end
