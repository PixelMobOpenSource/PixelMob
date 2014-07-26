require 'spec_helper'

describe "Videos" do
	describe "New Video" do
			it "Gets a new videos id" do
				get "/api/videos/new"
				Moped::BSON::ObjectId.legal?(response.body).should == true
			end
	end
	# describe "Create Video" do
	# it "Creates and Updates a video with name" do
	# 	id = Moped::BSON::ObjectId.new().to_s()
	# 	print id
	# 	post  '/api/videos/update/' + id , :file => fixture_file_upload("spec/files/The_Harlem_Shake_v2__1_.mp4", 'video/mp4'), :video => {:name => "Test"}
	# 	get '/api/videos/' + id
	# 	JSON.parse(response.body)["video"]["name"].should == "Test"
	# end
	# end
	# describe "Update Video" do
	# 	it "Tries to update video when the user is not signed it" do
	# 		id = Moped::BSON::ObjectId.new().to_s()
	# 		post '/api/videos/update/' + id, :description => "Lorem Ipsum"
	# 		post '/api/videos/update/' + id, :name => "Test"
	# 		response.body.should == "Please sign in to do that"
	# 	end
	# 	it "Update video to have description" do
	# 		post '/api/user/', :user => { :email => 'test@test.net', :password => '12345678' }
	# 		id = Moped::BSON::ObjectId.new().to_s()
	# 		post '/users/sign_in.json', :email => 'test@test.net', :password => '12345678'
	# 		post  '/api/videos/update/' + id , :file => fixture_file_upload("spec/files/The_Harlem_Shake_v2__1_.mp4", 'video/mp4'), :video => {:name => "Test"}
	#
	# 		post '/api/videos/update/' + id, :video => {:description => "Lorem Ipsum"}
	# 		get '/api/videos/'
	# 		puts response.body
	# 		JSON.parse(response.body)["videos"].last["description"].should == "Lorem Ipsum"
	# 	end
	# end
	describe "All Videos" do
		it "Get all videos and return json" do
		v = FactoryGirl.create(:video)
		while !v.is_video do
			sleep(1)
		end
		get '/api/videos/'
			Video.exists(channel_id: true).exists(name: true).where(processing: false).last.id.to_s.should == JSON.parse(response.body)[:videos].last["id"]
		end
	end
 describe "Get Video" do
	it "Get a video" do
		Video.all.delete
		v = FactoryGirl.create(:video)
		get '/api/videos'
		id = JSON.parse(response.body)["videos"].last["id"]
		name = JSON.parse(response.body)["videos"].last["name"]
		get '/api/videos/' + id
		JSON.parse(response.body)["video"]["name"].should == name
	end
	end
 end
