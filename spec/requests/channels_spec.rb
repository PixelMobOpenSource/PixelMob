describe "Channels" do
  describe "All Channels" do
  	it "Get all Channels" do
    Channel.create(:name => "Test")
		get '/api/channels/'
    	Channel.all.to_json == JSON.parse(response.body)[:channels] 
	end
  end
  describe "Show Channels" do
  	it "Get a channel and return json" do
  		get '/api/channels/' 
  		id = JSON.parse(response.body)["channels"].last["id"]
  		name = JSON.parse(response.body)["channels"].last["name"]
  		get '/api/channels/' + id
		JSON.parse(response.body)["channel"]["name"].should == name
	end
  end
end
