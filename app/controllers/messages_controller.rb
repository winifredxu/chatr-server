class MessagesController < ApplicationController

#  protect_from_forgery only: []

  def index
#    head :ok  #render nothing:true, status 200 ("Ok")

    # render json: Message.first #, Message.limit(10), Message.all
    render json: Message.order(created_at: :desc).limit((params[:limit] || 10) ) 

  end


  def create
    # POST /messages
    # body=My body

    #Message.create(body: params.require(:body)) #bad sanitized code for unsafe strong params
    message = Message.new
    message.body = params[:body]
    message.save!  #get around strong params problem

    head :created #render nothing:true, status 201  ("Created")

  end

end
