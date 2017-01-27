class CommissionController < ApplicationController
  def home
  end

  def new
    @commission = Commission.new
  end

  def create
    puts '+' * 30
    puts 'TIPO:' + params[:commission][:type]
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
        event.save
        puts "Cambiando has commission de event"
    	end
    else
    	@commission.user_id = params[:commission][:id]
    	if User.exists?(params[:commission][:id])
    		user = User.find(params[:commission][:id])
    		user.hasCommission = true
        user.save
        puts "Cambiando has commission de user"
    	end
    end
    puts @commission.save
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
        puts event.save

      elsif commission.user_id != nil
        user = User.find(commission.user_id)
        user.hasCommission = false
        puts user.save
      end

  		commission.destroy
      flash[:success] = "Comisión eliminada"
      redirect_back(fallback_location: root_path)
    end
  end

end