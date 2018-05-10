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

	get '/:id' do 
		menuitem = Menuitem.find params[:id]

		item_orders = menuitem.orders
		{
			success: true, 
			message: "Found #{item_orders.length} order for #{menuitem.name}",
			items: item_orders
		}.to_json

	end	

	get '/:id/waiter_id' do 
		# menuitem = Menuitem.find params[:id]
		waiter = Waiter.find params[:waiter_id]
		item_orders = waiter.menuitems
		{
			success: true, 
			message: "Found #{item_orders.length} order for #{menuitem.name} for #{waiter.name}",
			items: item_orders
		}.to_json

	end	






	post '/' do
		payload_body = request.body.read
		payload = JSON.parse(payload_body).symbolize_keys

		menuitem = Menuitem.new
		menuitem.name = payload[:name]
		menuitem.description = payload[:description]
		menuitem.price = payload[:price]
		menuitem.save
		{
			success: true,
			message: "Added #{menuitem.name}",
			added_item: menuitem
		}.to_json
		# @menuitem.to_json

	end	

	put	'/:id' do
		payload_body = request.body.read
		payload = JSON.parse(payload_body).symbolize_keys

		menuitem = Menuitem.find params[:id]
		menuitem.name = payload[:name]
		menuitem.description = payload[:description]
		menuitem.price = payload[:price]
		menuitem.save
		menuitem.to_json

		{
			success: true,
			updated_item = menuitem
		}.to_json
	end	


	delete '/:id' do
		menuitem = Menuitem.find params[:id]
		menuitem.destroy
		{
			success: true,
			# message: "Waiter #{waiter.name} deleted",
			deleted_item: menuitem
		}.to_json
	end	

end

