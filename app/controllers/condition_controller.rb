class ConditionController < ApplicationController
    skip_before_action :verify_authenticity_token

    # Get all conditions -- GET /conditions
    def index 
        @conditions = Condition.all
        render json: {message: 'success', data: @conditions}
    end 

    # Get one condition by id -- GET /condition/:id
    def show
        @condition = Condition.find(params[:id])
        render json: {message: 'success', data: @condition}
    end

    # Create new condition -- POST /condition
    def create
        api_params = params.permit(:date_time, :temp_c,:temp_f, :weather_code, :icon, :desc,
            :windspeed_mph, :windspeed_kmph, :winddir_degree, :winddir_point, :precip_mm, :precip_in,
            :humidity, :visibility, :visibility_miles, :pressure, :pressure_in, :cloud_cover,
            :feels_like_c, :feels_like_f, :uv)

        @condition = Condition.new(api_params)
        @condition.save
        render json: {message: 'success', data: @condition}
    end

    def update
        @condition = Condition.update(params[:id], :temp_c => '5000')
        render json: {message: 'success', data: @condition}
    end

    # Destroy one condition by ID -- DELETE /condition/:id
    def destroy
        begin
            @condition = Condition.find(params[:id])
            @condition.destroy
            render json: {message: 'success'}
        rescue => err
            render json: {message: "ERROR: could not destroy condition id: #{params[:id]}"}
        end
    end
end
