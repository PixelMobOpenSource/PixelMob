require 'spec_helper'

describe User do
	it "can be instantiated" do
		FactoryGirl.build(:user).should be_an_instance_of(User)
	end
	it "can be persisted" do
		FactoryGirl.create(:user).should be_persisted
	end
	it "can have subscriptions" do
		u = FactoryGirl.create(:user)
		u.subscriptions_channels << FactoryGirl.create(:channel)
		u.subscriptions_channels.length.should_not == 0
	end
	it "can have subscriptions videos" do
		u = FactoryGirl.create(:user)
		u.subscriptions_channels << FactoryGirl.create(:channel_with_videos)
		u.subscriptions_videos.length.should_not == 0
	end
	it "can have subscriptions videos be videos" do
		u = FactoryGirl.create(:user)
		u.subscriptions_channels << FactoryGirl.create(:channel_with_videos)
		u.subscriptions_videos.last.should be_an_instance_of(Video)
	end
end
