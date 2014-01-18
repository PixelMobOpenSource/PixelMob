class Annotation
    include Mongoid::Document
    field :name, type: String
    embeds_many :point
    belongs_to :video
end
