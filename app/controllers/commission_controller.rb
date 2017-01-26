class CommissionController < ApplicationController
  def home
  end

  def new
    @commission = Commission.new
  end

  def create
    puts @commission = Commission.new(	card: params[:commission][:card],
    							 								deposit: params[:commission][:deposit]
    														)
    case params[:commission][:type] 
    when "0"
    	@commission.booking_id = params[:commission][:id]
    when "1"
    	@commission.event_id 	= params[:commission][:id]
    	if Event.exists?(params[:commission][:id])
    		event = Event.find(params[:commission][:id])
    		event.hasCommission = true
    		puts '************+'
    		puts event.save
    	end
    else
    	@commission.user_id = params[:commission][:id]
    end

    if @commission.save
      flash[:success] = "Commission successfully saved"
    else
      flash[:error] = "Commission not saved in database"
    end
  end
end