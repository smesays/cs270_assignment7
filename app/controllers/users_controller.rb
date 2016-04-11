class UsersController < ApplicationController
    # GET /users/new
    def new_user
    end
    
    # POST /users/create
    def create_user
        @user = User.new(   first_name: params[:first_name], 
                            last_name:  params[:last_name],
                            email:      params[:email]
                          )
        if @user.save
            redirect_to show_user_path(@user)
        else
            redirect_to root_path
        end
    end
    
    # GET /users
    def show_all_users
        @users = User.all
    end
    
    # GET /users/:id
    def show_user
        @user = User.find(params[:id])
    end
    
    # GET /users/:id/edit
    def edit_user
        @user = User.find(params[:id])
    end
    
    # POST /users/:id/update
    def update_user
        @user = User.find(params[:id])
        
        if @user.update(first_name: params[:user][:first_name],
                        last_name:  params[:user][:last_name],
                        email:      params[:user][:email]
                        )
            redirect_to show_user_path(@user)
        else
            redirect_to root_path
        end
    end
    
    # DELETE /users/:id
    def delete_user
    end
end