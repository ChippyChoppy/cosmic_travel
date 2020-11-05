class ScientistsController < ApplicationController
    def index 
        @scientists = Scientist.all
    end 
  
    def show
        @scientist = Scientist.find(params[:id])
    end 

    def new
        @scientist = Scientist.new
    end

    def create
        scientist = Scientist.create(scientist_params)
        if scientist.valid?
            redirect_to scientists_path
        else
            flash[:scientist_errors] = scientist.errors.full_messages
            redirect_to new_scientist_path
        end
    end

    def destroy
        @scientist = Scientist.find(params[:id])
        if @scientist.valid?
            @scientist.destroy
            redirect_to scientists_path
        else
            redirect_to scientist_path
        end
    end

    private
    def scientist_params
        params.require(:scientist).permit(:name, :field_of_study)
    end

  
end
  
  