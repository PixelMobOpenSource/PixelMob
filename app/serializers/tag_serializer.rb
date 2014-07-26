class TagSerializer < ActiveModel::Serializer
    attributes :id,:name,:description
    has_many :videos, embed: :id, :key => :video_ids
    has_many :subscribers, embed: :id, :key => :subscriber_ids
    has_many :users , embed: :id, :key => :user_ids
end
