class Comment
    include Mongoid::Document
    field :content, type: String
    belongs_to :video
    belongs_to :user
    has_many :child_comments, :class_name => 'Comment', :inverse_of => :parent_comment
    belongs_to :parent_comment, :class_name => 'Comment', :inverse_of => :child_comments
end
