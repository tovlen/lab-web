class LabworksController < ApplicationController

    def index
        
        @labwork = Labwork.all

    end

    def show
        
        @labwork = Labwork.find(params[:id])

    end

    def new
        
        @labwork =Labwork.new

    end

    def create
        
        labwork = Labwork.new(params.require(:labwork).permit(:title,:description))
        labwork.user_id=1

        if labwork.save

            redirect_to root_path

        else

            redirect_to root_path
            flash[:DANGER] = "Labwork was not created! "

        end

    end

    def edit
        
        @labwork=Labwork.find(params[:id])

    end

    def update

        @labwork = Labwork.find(params[:id])
        @labwork.update(params.require(:labwork).permit(:title,:description))
        redirect_to root_url

    end

    def destroy

        @labwork = Labwork.find(params[:id])
        @labwork.destroy
        redirect_to root_url

    end

    def mark

        @labwork = Labwork.find(params[:id])

    end

    def grade
        
        @labwork = Labwork.find(params[:id])

        if @labwork.update(params.permit(:grade))
        redirect_to root_url

        else
            render :mark
        end

    end

end