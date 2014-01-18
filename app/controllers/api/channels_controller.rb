class Api::ChannelsController < ApplicationController
    before_filter :set_current_user
    def index
        render :json => Channel.all
    end
    def update
        channel = Channel.find(params[:id])
        channel.update_attributes(channel_params)
        if(params[:files]) then
            channel.avatar = params[:files][0]
        end
        if channel.save! && user_signed_in? && channel.users.include?(current_user) then
            current_user.channels << channel
            current_user.save!
            render :json => channel
        else
            render :json => channel.errors
        end
    end
    def create
            channel = Channel.new(channel_params)
            channel.avatar = params[:files][0]
            current_user.channels << channel
            channel.users << current_user
            current_user.save!
        if channel.save! && user_signed_in? then
            render :json =>  channel
        else
            render :json => channel.errors
        end
    end
    def show
        channel = Channel.find(params[:id])
        videos = []
        if(params[:video_page])
            lastVideoIndex = params[:video_page].to_i * 5
            firstVideoIndex = lastVideoIndex - 5
            channel.videos = channel.videos.select(&:is_video)[firstVideoIndex...lastVideoIndex]
        end
        render :json => channel
    end
    private
    def channel_params
        if(params[:channel])
           params.require(:channel).permit!
        end
    end
end
