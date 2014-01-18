require 'spec_helper'

describe Video do
	it "can be instantiated" do
			FactoryGirl.build(:video).should be_an_instance_of(Video)
	end
	it "can be persisted" do
		v =	FactoryGirl.build(:video)
		v.process_file_upload = false
		v.save!
	end
end
