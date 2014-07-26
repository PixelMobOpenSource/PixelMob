class VideoRanker
	include Sidekiq::Worker

	def perform(name, count)
        Video.each do |v|
       		time_rank = Math.log((v.created_at - Time.now()).abs)
       		vote_rank = Math.log([(v.upVotedUsers.length - v.downVotedUsers.length).abs,1].max*2)
       		v.rank = (time_rank + vote_rank) / 3
       		v.save!
        end
	end
end