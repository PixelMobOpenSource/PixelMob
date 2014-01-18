class Api::UserController < ApplicationController
    before_filter :set_current_user
    def index
        render :json => User.all
    end
    def logout_clef
        data = {
            body: {
                logout_token: params[:logout_token],
                app_id: '5da008568d5b331c24cf0820cb32fd74',
                app_secret: 'a5d3313e240da8b306db317a1a7a47cb'
            }
        }
        response = HTTParty.post("https://clef.io/api/v1/logout",data)
        if(response["success"])
            clef_id = response["clef_id"]
            user = User.find_by(clef_id: clef_id)
            logger.debug(clef_id)
            sign_out(user)
            render :json => {success: "Success"}
        else
            render :json => response["error"]
        end
    end
    def clef
        p request.env['omniauth.auth']
        @user = User.find_or_create_from_auth_hash(request.env['omniauth.auth'])
        if @user.persisted?
            sign_in_and_redirect @user, :event => :authentication
        else
            notice = "User was created."
        end
    end
    def launchkey_callback
        if(params[:deorbit]) then
            user = User.find_by(user_key: JSON.parse(params[:deorbit])[:user_hash])
            logger.debug(user.email)
            sign_out(user)
        end
    end
    def launchkey_newuser
        auth_request = LaunchKey.authorize(params[:username])
        until (LaunchKey.poll_request(auth_request)["message"] != "Pending response")
                sleep(1)
        end
        auth_response = LaunchKey.poll_request(auth_request)
        if LaunchKey.authorized?(auth_response["auth"]) then
            if(!params[:user_id]) then
                user = User.new
                user.email = params[:email]
                user.user_key = auth_response["user_hash"]
                user.auth_req = auth_request
                user.save!
            else
                render :text => 'false'
            end
        else
            render :text => "false"
        end
    end
    def launchkey
        auth_request = LaunchKey.authorize(params[:username])
        until (LaunchKey.poll_request(auth_request)["message"] != "Pending response")
            sleep(1)
        end
        auth_response = LaunchKey.poll_request(auth_request)
        if LaunchKey.authorized?(auth_response["auth"]) then
            if(params[:user_id]) then
                user = User.find(params[:user_id])
                user.user_key = auth_response["user_hash"]
                user.auth_req = auth_request
                user.save!
            else
                sign_in(User.find_by(user_key: auth_response["user_hash"]))
                render :text => "true"
            end
        else
            render :text => "false"
        end
    end
    def show
        render :json => User.find(params[:id])
    end
    def subscriptions
        render :json => User.subscriptions_channels
    end
    def unsubscribe
        channel = Channel.find(params[:id])
        current_user.subscriptions_channels.delete(channel)
        if current_user.save! then
            render :json => "Success"
        else
            render :json => current_user.errors
        end
    end
    def subscribe
        channel = Channel.find(params[:id])
        current_user.subscriptions_channels << channel
        if current_user.save! then
            render :json => "Success"
        else
            render :json => current_user.errors
        end
    end
    def subscriptions_videos
            videos = []
            current_user.subscriptions_channels.each do |u|
                u.videos.each do |v|
                    videos << v
                end
            end
            videos_sorted = videos.sort_by{|v| v.created_at}.reverse
            render :json =>    videos_sorted
    end
    def current
        render :json => current_user
    end
    def create
        user = User.new(user_params)
        if user.save! then
            render :json => user
        else
            render :json => user.errors
        end
    end
    def update
        user = User.find(params[:id])
        if(user.update_attributes(user_params) && user == current_user) then
            render :json => user
        end
    end
    private
    def user_params
        params.require(:user).permit!
    end
end
