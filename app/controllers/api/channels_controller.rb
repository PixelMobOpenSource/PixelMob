module Api
  class ChannelsController < ApplicationController
    before_filter :set_current_user
    def index
      render json: Channel.all
    end

    def update
      new_params = channel_params
      channel = Channel.find(new_params[:id])
      channel.description = new_params[:description]
      channel.name = new_params[:name]
      if(params[:files]) then
        channel.avatar = params[:files][0]
      end
      if channel.save! && user_signed_in? && channel.users.include?(current_user) then
        current_user.channels << channel
        current_user.save!
        render json: channel
      else
        render json: channel.errors
      end
    end

    def create
        channel = Channel.new(channel_params)
        channel.avatar = params[:files][0]
        current_user.channels << channel
        channel.users << current_user
        current_user.save!
        if channel.save! && user_signed_in?
            render json:  channel
        else
            render json: channel.errors
        end
    end

    def show
      channel = Channel.find(params[:id])
      if params[:video_page]
        last_video_index = params[:video_page].to_i * 5
        first_video_index = last_video_index - 5
        channel.videos = channel.videos.select(&:is_video)[first_video_index..last_video_index]
      else
        channel.videos = channel.videos.select(&:is_video)
      end
      render json: channel
    end

    private

    def channel_params
      if(params[:channel])
         params.require(:channel).permit!
      end
    end
  end
end
