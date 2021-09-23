class ConditionController < ApplicationController
    skip_before_action :verify_authenticity_token

    # Get all conditions -- GET /conditions
    def index 
        @conditions = Condition.all
        render json: {message: 'success', data: @conditions}
    end 

    def show
        # Read individual weather condition here
    end

    # Create new condition -- POST /condition
    def create
        @condition = Condition.new(
            date_time: '09/23/2021 10:35 AM', 
            temp_c: '24',
            temp_f: '74',
            weather_code: '113',
            icon: 'http://cdn.worldweatheronline.com/images/wsymbols01_png_64/wsymbol_0001_sunny.png',
            desc: 'Sunny',
            windspeed_mph: '4',
            windspeed_kmph: '6',
            winddir_degree: '140',
            winddir_point: 'SE',
            precip_mm: '0.0',
            precip_in: '0.0',
            humidity: '33',
            visibility: '16',
            visibility_miles: '9',
            pressure: '1022',
            pressure_in: '30',
            cloud_cover: '0',
            feels_like_c: '25',
            feels_like_f: '76',
            uv: '1'
        )

        @condition.save
        render json: {message: 'success', data: @condition}
    end

    def update
        # Update weather condition here
    end

    # Destroy condition by ID -- DELETE /condition/:id
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
