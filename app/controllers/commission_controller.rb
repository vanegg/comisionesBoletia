class CommissionController < ApplicationController
  def home
  end

  def new
    @commission = Commission.new
  end

  def create
    @commission = Commission.new()
    puts "creating commission"
    # current_user.questions << @question
    # if @question.save
    #   flash[:success] = "Question successfully saved"
    # else
    #   flash[:error] = "Question not saved in database"
    # end
    # render :new
  end
end
