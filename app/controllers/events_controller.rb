class EventsController < ApplicationController

	def new

		Rails.logger.debug(params[:start])

		if (!params[:start].nil?)
			@event = Event.new(:start_time => params[:start].to_time)
		end

		# @event = Event.new(:start_time => Time.now)

		# Rails.logger.debug(params[:start].to_time)
		# Rails.logger.debug(@event.inspect)

		# Rails.logger.debug(render_to_string(:partial => 'fnew'))

		# render :json => {:form => render_to_string(:partial => 'fnew')}
		# render plain: params[:events].inspect

		respond_to do |format|
			format.js
		end
	end

	def create
		@event = Event.new(event_params)

		@event.save
		redirect_to @event
	end

	def index
	end

	def show
		@event = Event.find(params[:id])
	end

	private 
	def event_params
		params.require(:event).permit(:start_time, :end_time, :name)
	end

end