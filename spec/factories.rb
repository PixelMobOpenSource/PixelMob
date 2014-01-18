include ActionDispatch::TestProcess
FactoryGirl.define do
	factory :user do
		email {Forgery(:internet).email_address}
		password "password"
	end
	factory :video do 
		name { Forgery(:lorem_ipsum).words(1) }
		description {Forgery(:lorem_ipsum).words(10)}
		file { fixture_file_upload("spec/files/The_Harlem_Shake_v2__1_.mp4","type/mp4") } 
		processing true
		channel
	end
	factory :channel do
		name { Forgery(:lorem_ipsum).words(1) }
		factory :channel_with_videos do
			ignore do
				videos_count 5
			end
			after(:create) do |channel, evaluator|
				FactoryGirl.create_list(:video , 1, channel: channel)
			end
		end
	end
end
