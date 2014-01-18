class Game
    include Mongoid::Document
    field :name, type: String
    field :description, type: String
    mount_uploader :cover, CoverArtUploader
    has_many :videos
end
