class User
    include Mongoid::Document
    include Gravtastic
    include Mongoid::Timestamps
    gravtastic
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable,:omniauthable, :omniauth_providers => [:clef]
    field :email, :type                  => String
    field :username, :type               => String
    field :auth_req
    field :user_key, :type               => String
    field :gravatar_url, :type           => String
    field :encrypted_password, :type     => String, :default => ""
    field :reset_password_token, :type   => String
    field :reset_password_sent_at, :type => Time
    field :remember_created_at, :type    => Time
    field :sign_in_count, :type          => Integer, :default => 0
    field :current_sign_in_at, :type     => Time
    field :last_sign_in_at, :type        => Time
    field :current_sign_in_ip, :type     => String
    field :last_sign_in_ip, :type        => String
    field :clef_id, :type                => String
    field :links, :type                  => Array, :default => [{name: "Home",icon: "fa fa-home fa-3x",link: "subscriptions"}, {name: "Upload",icon: "fa fa-upload fa-3x",link: "upload_container"}]
    field :subscriptions_video_ids       => Array
    field :subscription_channel_ids      => Array
    has_many :video_views
    has_and_belongs_to_many :channels, :inverse_of => :users
    has_many :comments
    has_and_belongs_to_many :subscriptions_channels, :class_name => 'Channel', :inverse_of => :subscriber
    has_and_belongs_to_many :subscriptions_tags, :class_name => 'Tag', :inverse_of => :subscriber
    has_and_belongs_to_many :downVotedVideos , :class_name => 'Video', :inverse_of => :downVotedUsers
    has_and_belongs_to_many :upVotedVideos , :class_name => 'Video', :inverse_of => :upVotedUsers
    has_and_belongs_to_many :tags, :inverse_of => :users
    def self.current
        Thread.current[:user]
    end
    def self.current=(user)
        Thread.current[:user] = user
    end
    def subscriptions_videos
        videos = []
        self.subscriptions_channels.each do |u|
                u.videos.each do |v|
                        if(v.is_video)
                                videos << v
                        end
                end
        end
        self.subscriptions_tags.each do |t|
                t.videos.each do |v|
                        if(v.is_video && !videos.include?(v))
                                videos << v
                        end
                end
        end
        videos_sorted = videos.sort_by{|v| v.rank}
        return videos_sorted
    end
    def self.find_or_create_from_auth_hash(auth_hash)
        if user = User.find_by({clef_id: auth_hash[:uid]})
                user
        else
                User.create(
                        clef_id: auth_hash[:uid],
                        email: auth_hash[:info][:email]
                )
        end
    end
end
