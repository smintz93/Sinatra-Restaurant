class MenuitemController < ApplicationController

	get '/' do 
		@menuitems = Menuitem.all
		@menuitems.to_json
	end	



	# get '/:id/orders' do 
		
	# 	@menuitem = Menuitem.find params[:id]
	# 	@orders = @menuitem.orders
	# 	@orders.to_json

	# end	



	post '/' do
		payload_body = request.body.read
		payload = JSON.parse(payload_body).symbolize_keys

		@menuitem = Menuitem.new
		@menuitem.name = payload[:name]
		@menuitem.description = payload[:description]
		@menuitem.price = payload[:price]
		@menuitem.save
		@menuitem.to_json
	end	

	put	'/:id' do
		payload_body = request.body.read
		payload = JSON.parse(payload_body).symbolize_keys

		@menuitem = Menuitem.find params[:id]
		@menuitem.name = payload[:name]
		@menuitem.description = payload[:description]
		@menuitem.price = payload[:price]
		@menuitem.save
		@menuitem.to_json
	end	


	delete '/:id' do
		@menuitem = Menuitem.find params[:id]
		@menuitem.destroy
		{
			success: true,
			message: "Waiter #{@waiter.name} deleted"
		}.to_json
	end	

end

