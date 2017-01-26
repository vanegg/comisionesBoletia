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
      flash.now[:success] = "Commission successfully saved"
    else
      flash.now[:error] = "Commission not saved in database"
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
  	puts '***********'
		puts params
		Event.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

end