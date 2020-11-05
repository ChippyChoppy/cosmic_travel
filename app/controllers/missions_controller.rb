class MissionsController < ApplicationController
    def index
        @missions = Mission.all
    end

    def show
      @mission = Mission.find(params[:id])
    end 
    
    def new
        @mission = Mission.new
        @scientists = Scientist.all 
        @planets = Planet.all 
    end

    def create 
        mission = Mission.create(mission_params)
        if mission.valid?
            redirect_to missions_path
        else
            flash[:mission_errors] = mission.errors.full_messages
            redirect_to scientist_path(mission.scientist.id)
        end
    end

    private
    def mission_params
        params.require(:mission).permit(:name, :scientist_id, :planet_id)
    end

  
  end
  
  