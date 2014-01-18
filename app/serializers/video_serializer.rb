class VideoSerializer < ActiveModel::Serializer
    attributes :id,:name,:description,:file, :is1080p, :is720p, :game_id, :owned,  :vast,:upVotes,:downVotes,:upVoted,:downVoted,:smallName,:rank, :views, :token, :slug, :tempProgress
    has_one :channel, embed: :ids, :key => :channel_id
    has_many :comments, embed: :ids, :key => :comment_ids
    has_many :tags , embed: :ids, :key => :tag_ids
    has_many :upVotedUsers , embed: :ids, :key => :upVotedUser_ids
end
