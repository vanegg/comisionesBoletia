class CommissionController < ApplicationController
  def home
  end

  def new
    @commission = Commission.new
  end

  def create
    @commission = Commission.new(card: params[:commission][:card],
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
        event.save
    	end
    else
    	@commission.user_id = params[:commission][:id]
    	if User.exists?(params[:commission][:id])
    		user = User.find(params[:commission][:id])
    		user.hasCommission = true
        user.save
    	end
    end
    if @commission.save
      flash.now[:success] = "Commission personalizada"
    else
      flash.now[:error] = "Commission not saved in database"
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    if Commission.exists?(params[:id])
      commission = Commission.find(params[:id])

      if commission.event_id != nil 
        event = Event.find(commission.event_id)
        event.hasCommission = false
        event.save

      elsif commission.user_id != nil
        user = User.find(commission.user_id)
        user.hasCommission = false
        user.save
      end

  		commission.destroy
      flash[:success] = "Comisión eliminada"
      redirect_back(fallback_location: root_path)
    end
  end

end