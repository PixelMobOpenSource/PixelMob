class Channel
    include Mongoid::Document
    mount_uploader :avatar, AvatarUploader
    field :name, type: String
    field :subscribed, type: Boolean
    field :description, type: String
    def subscribed
        if User.current
            self.subscribers.include?(User.current)
        end
    end
    has_many :videos
    has_and_belongs_to_many :subscribers, :class_name => 'User', :inverse_of => :subscriptions_channels
    has_and_belongs_to_many :users, :inverse_of => :channels
end
