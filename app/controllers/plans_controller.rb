class PlansController < ApplicationController
  before_action :set_plan, only: [:show, :update, :destroy]

  # GET /plans
  def index
    @plans = Plan.all

    render 'index', formats: 'json', handlers: 'jbuilder'
  end

  # GET /plans/1
  def show
    render json: @plan
  end

  # POST /plans
	def create
    @plan = Plan.new(plan_params)

    ActiveRecord::Base.transaction do
      @plan.save!
      @plan.build_location(location_params).save!
      render json: @plan, status: :created
    end

  rescue => e
    render json: e
  end

  # PATCH/PUT /plans/1
	def update
		if @plan.update(plan_params) && @plan.location.update(location_params)
			render json: @plan
		else
			render json: @plan.errors, status: :unprocessable_entity
		end
  end

  # DELETE /plans/1
  def destroy
    @plan.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plan
      @plan = Plan.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
		def plan_params
			params.require(:plan).permit(:departure_date, :return_date, :description)
		end
		
		def location_params
			params.require(:location).permit(:name, :latitude, :longitude)
		end
end
