class CommentSerializer < ActiveModel::Serializer
    attributes :id,:content, :parent_comment_id, :user_id
    has_one :video, embed: :id, :key => :video_id
    has_many :child_comments, embed: :ids, :key => :child_comment_ids
    has_one :user, embed: :id,:key => :user_id
end
