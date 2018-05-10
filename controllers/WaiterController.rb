class WaiterController < ApplicationController

	get '/' do 
		@waiters = Waiter.all
		@waiters.to_json
	end	

	
	# which wait an order goes with 
	# what waiter goes with this order



	# get all the orders for a waiter
	get '/:id/orders' do 

		waiter = Waiter.find params[:id]
		this_waiter_orders = waiter.orders
		{
			success: true, 
			message: "Found #{this_waiter_orders.length} order for #{waiter.name}",
			orders: this_waiter_orders
		}.to_json

		# what other questions could you answer 
		# what orders are still open
		# how many orders is some_waiter waiting for now
	end	

	# gets menu items for a waiter
	# you could also get waietrs for a menu item. this could also do in menu items controllers

 	get '/:id/menuitems' do

		w = Waiter.find params[:id]
		{
			success: true,
			page_title: "Menu items for #{w.name}",
			items: w.menuitems
		}.to_json
	end	


	# what other questions could you answer 
	# how many omletees is sam waiting for

	# waiter show route
	get "/:id" do 
		w = Waiter.find params[:id]
		{
			success: true,
			page_title: "Info for #{w.name}",
			message: "Waiter show route under construction",
			order: w.orders
		}.to_json
	end	



	post '/' do
		payload_body = request.body.read
		payload = JSON.parse(payload_body).symbolize_keys

		@waiter = Waiter.new
		@waiter.name = payload[:name]
		@waiter.save
		@waiter.to_json
	end	

	put	'/:id' do
		payload_body = request.body.read
		payload = JSON.parse(payload_body).symbolize_keys

		@waiter = Waiter.find params[:id]
		@waiter.name = payload[:name]
		@waiter.save
		@waiter.to_json
	end	


	delete '/:id' do
		@waiter = Waiter.find params[:id]
		@waiter.destroy
		{
			success: true,
			message: "Waiter #{@waiter.name} deleted"
		}.to_json
	end	

end	