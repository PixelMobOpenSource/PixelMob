class UserSerializer < ActiveModel::Serializer
    attributes :id, :email, :gravatar_url, :links
    has_many :channels, embed: :ids, :key => :channel_ids
    has_many :comments, embed: :ids ,:key => :comment_ids
    has_many :subscriptions_videos, embed: :ids, :key => :subscriptions_video_ids
    has_many :subscriptions_channels, embed: :ids, :key => :subscription_channel_ids
end
