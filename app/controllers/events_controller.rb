class EventsController < ApplicationController
    # GET /events/new
    def new_event
    end
    
    # POST /events/create
    def create_event
        @event = Event.new( name:       params[:name], 
                            description:params[:description],
                            start_date: params[:start_date],
                            end_date:   params[:end_date]
                          )
        if @event.save
            redirect_to show_event_path(@event)
        else
            redirect_to root_path
        end
    end
    
    # GET /events
    def show_all_events
        @events = Event.all
    end
    
    # GET /events/:id
    def show_event
        @event = Event.find(params[:id])
    end
    
    # GET /events/:id/edit
    def edit_event
        @event = Event.find(params[:id])
    end
    
    # POST /events/:id/update
    def update_event
        @event = Event.find(params[:id])
        
        if @event.update(   name:       params[:event][:name],
                            description:params[:event][:description],
                            coordinates:params[:event][:coordinates]
                        )
            redirect_to show_event_path(@event)
        else
            redirect_to root_path
        end
    end
    
    # DELETE /events/:id
    def delete_event
    end
end