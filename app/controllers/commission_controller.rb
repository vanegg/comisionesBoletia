class CommissionController < ApplicationController
  def home
  end

  def new
    @commission = Commission.new
  end

  def create
    puts @commission = Commission.new(card: params[:commission][:card],
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
    	end
    else
    	@commission.user_id = params[:commission][:id]
    	if User.exists?(params[:commission][:id])
    		user = User.find(params[:commission][:id])
    		user.hasCommission = true
    	end
    end

    if @commission.save
      flash.now[:success] = "Commission successfully saved"
    else
      flash.now[:error] = "Commission not saved in database"
    end
    redirect_to(:back)
  end

  def destroy
  	puts '***********'
		puts params
		Event.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

end