require 'spec_helper'

describe Channel do
	it "can be instantiated" do
		FactoryGirl.build(:channel).should be_an_instance_of(Channel)
	end
	it "can be instantiated" do
		FactoryGirl.create(:channel).should be_persisted
	end
end
