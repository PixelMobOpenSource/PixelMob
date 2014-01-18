class VideoView
    include Mongoid::Document
    belongs_to :user
    belongs_to :video
    field :timeViewed, type: Integer
    field :durrationViewed, type: Integer
end
