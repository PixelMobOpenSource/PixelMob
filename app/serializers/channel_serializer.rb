class ChannelSerializer < ActiveModel::Serializer
    attributes :id,:name,:subscribed,:avatar, :description
    has_many :videos, embed: :ids, :key => :video_ids
    has_many :users , embed: :ids, :key => :user_ids
    has_many :subscribers , embed: :ids, :key => :subscriber_ids
end
