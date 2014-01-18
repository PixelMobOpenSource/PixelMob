class Tag
    include Mongoid::Document
    field :name, type: String
    field :description, type: String
    has_and_belongs_to_many :videos
    has_and_belongs_to_many :subscribers, :class_name => 'User', :inverse_of => :subscriptions_tags
end
