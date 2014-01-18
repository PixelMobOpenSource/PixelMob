class Api::VideosController < ApplicationController
    include ActionController::Live
    before_filter :set_current_user
    def index
        @videos = []
        if params[:search] then
            Video.search(params[:search]).each do
                |e|
                @videos << Video.find(e.id)
            end
        elsif params[:subscriptions]
            @videos = current_user.subscriptions_videos
        else
            @videos = Video.all
        end
        if params[:page]  then
            lastVideoIndex = params[:page].to_i * 5
            firstVideoIndex = lastVideoIndex - 5
            render :json => @videos.select(&:is_video)[firstVideoIndex...lastVideoIndex]
        else
            render :json => @videos.select(&:is_video)
        end
    end
    def search_autocomplete
        @video_names = []
        Video.all.each do |v|
           @video_names << v.name
        end
        render :json => @video_names.to_json
    end
    def lastPage
        @videos = []
        if params[:search] then
            Video.search(params[:search]).each do
                |e|
                @videos << Video.find(e.id)
            end
        elsif params[:subscriptions]
            @videos = current_user.subscriptions_videos
        else
            @videos = Video.all
        end
        render :text => (@videos.length / 5.0).ceil
    end
    def upVote
        video = Video.find(params[:id])
        if(!video.upVoted)
            video.downVotedUsers.delete(current_user)
            video.upVotedUsers << current_user
            if video.save!
                render :json => video
            else
                render :text => false
            end
        else
            video.upVotedUsers.delete(current_user)
            if video.save!
                render :text => true
            else
                render :text => false
            end
        end
    end
    def downVote
        video = Video.find(params[:id])
        if(!video.downVoted)
            video.upVotedUsers.delete(current_user)
            video.downVotedUsers << current_user
            if video.save!
                render :json => video
            else
                render :text => false
            end
        else
            video.downVotedUsers.delete(current_user)
            if video.save!
                render :text => true
            else
                render :text => false
            end
        end
    end
    def watch
        video = Video.find(params[:id])
        view = VideoView.new({:durrationViewed => params[:duration], :timeViewed => Time.now.to_i, :user => current_user, :video => video})
        legitment = false
        userWatched = false
        video.video_views.each do |v|
            if v.user == current_user && (v.timeViewed + v.durrationViewed).to_i > Time.now.to_i then
                legitment = true
            end
            if v.user == current_user then
                userWatched = true
            end
        end
        if userWatched == false then
            legitment == true
        end
        if legitment == true then
            if view.save!
                render :json => view
            else
                render :json => view.errors
            end
        else
            render :json => "Error"
        end
    end
    def show
        v = Video.find(params[:id])
        render :json => v.is_video == true ? Video.find(params[:id]) : "WTF?"
    end
    def create
        video = Video.new(params[:video])
        if video.save! then
            render :json => video
        else
            render :json => video.errors
        end
    end
    def new
        video = Video.new()
        render :text => video.id
    end
    def update
        if user_signed_in?
            begin
                video = Video.find(params[:id])
            rescue
                video = Video.new()
                video.id = params[:id]
            end
            if(params[:video]) then
                video.name = params[:video][:name]
                video.description = params[:video][:description]
                if(params[:video][:channel_id]) then
                    video.channel_id = params[:video][:channel_id]
                end
                video.tag_ids = params[:video][:tag_ids]
            end
            if(params[:file]) then
                video.file = params[:file]
                video.processing = true
            else
                video.processing = false
            end
            if(video.channel != nil) then
                if(current_user.channels.include?(video.channel)) then
                    if(video.save! && user_signed_in?) then
                     render :json => video
                    else
                     render :json => video.errors
                    end
                else
                    render :json => "I am sorry #{current_user.email} I cant let you do that"
                end
            else
                if(video.save!) then
                    render :json => video
                else
                    render :json => video.errors
                end
            end
        else
            render :json => "Please sign in to do that"
        end
    end
    def destroy
        video = Video.find(params[:id])
        if(video.user == current_user) then
            video.destroy()
        end
            render :json => nil
    end
    private
    def video_params
        if(params[:video])
            new_params = params[:video]
            new_params.delete(:owned)
            new_params.delete(:rank)
            params.require(:video).permit!
        end
    end
end
private
def sse(object, options = {})
  (options.map{|k,v| "#{k}: #{v}" } << "data: #{JSON.dump object}").join("\n") + "\n\n"
end
