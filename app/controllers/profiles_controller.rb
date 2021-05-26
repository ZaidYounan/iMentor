class ProfilesController < ApplicationController
    before_action :authenticate_user!
    def index
        @profiles = Profile.all
    end

    def new
        if current_user.profile.present?
            redirect_to index_path, notice: "You already have a profile!"
        else 
            @profile = Profile.new(:user_id => current_user)
        end
    end

    def create
        @user = current_user
        @profile = Profile.new(profile_params)
        @profile.user = current_user
        @profile.save
        redirect_to users_profile_path(current_user.profile.id)
    end

    def show
        @profile = Profile.find(params[:id])
    end

    def edit
        if current_user.profile == Profile.find(params[:id])
            @profile = current_user.profile
        else
            redirect_to users_profile_path, notice: "PERMISSION DENIED!"
        end
    end

    def update
        @profile = current_user.profile
        current_user.avatar.attach(profile_params[:avatar])
        if @profile.update(profile_params)
            redirect_to users_profile_path(current_user.profile.id)
        else
            render :show
        end
    end

    def profile_params
        params.require(:profile).permit(:about_me, :motivations, :interests, :background, :avatar)
    end
end
