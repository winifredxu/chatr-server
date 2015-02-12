class MessagesController < ApplicationController

  def index
#    head :ok

    # render json: Message.first #, Message.limit(10), Message.all
    render json: Message.order(created_at: :desc).limit((params[:limit] || 10)  

  end

end
