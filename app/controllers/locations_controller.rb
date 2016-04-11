class LocationsController < ApplicationController
    # GET /locations/new
    def new_location
    end
    
    # POST /locations/create
    def create_location
        @location = Location.new(   name:           params[:name], 
                                    description:    params[:description],
                                    coordinates:    params[:coordinates]
                                )
        if @location.save
            redirect_to show_location_path(@location)
        else
            redirect_to root_path
        end
    end
    
    # GET /locations
    def show_all_locations
        @locations = Location.all
    end
    
    # GET /locations/:id
    def show_location
        @location = Location.find(params[:id])
    end
    
    # GET /locations/:id/edit
    def edit_location
         @location = Location.find(params[:id])
    end

    # POST /locations/:id/update
    def update_location
        @location = Location.find(params[:id])
        
        if @location.update(name:           params[:event][:name],
                            description:    params[:event][:description],
                            coordinates:    params[:event][:coordinates]
                           )
            redirect_to show_location_path(@location)
        else
            redirect_to root_path
        end
    end
    
    # DELETE /locations/:id
    def delete_location
    end
end