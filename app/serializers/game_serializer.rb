class GameSerializer < ActiveModel::Serializer
    attributes :id, :name,:description, :cover
    has_many :videos, embed: :ids, :key => :video_ids
end
