class Coreman::EntitiesController < ApplicationController
  before_action :set_entity, only: %i[ show edit update destroy ]
  before_action :get_entity_types, only: %i[ index edit update show]
  def index
    @entities ||= Entity.where(user_id: Current.user[:id])
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
  def entity_params
    params.expect(entity: [ :display_name, :description, :user_id, :entity_type_id ])
  end

  def set_entity
    @entity = Entity.find(params[:id])
  end

  def get_entity_types
    @entity_types ||= {}
    EntityType.all.each { |t| @entity_types[t[:id]] = t[:value] } if @entity_types.empty?
  end
end
