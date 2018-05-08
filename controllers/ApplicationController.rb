class ApplicationController < Sinatra::Base

	require 'bundler'
	Bundler.require()

	# ActiveRecord::Base.establish_connection(
 # 		:adapter => 'postgresql', 
 # 		:database => 'player'
	# )


	get '/' do
		{
			success: false,
			message: "Please consult the API DOCS" 
		}.to_json
	end

	not_found do 
		halt 404
	end	

end
