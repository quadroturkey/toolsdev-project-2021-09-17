class ConditionController < ApplicationController
    def index 
        @conditions = Condition.all
        puts @conditions
    end 

    def show
        # Read individual weather condition here
    end

    def create
        # Create weather condition here
    end

    def update
        # Update weather condition here
    end

    def delete
        # Delete weather condition here
    end
end
