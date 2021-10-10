class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end
  
  def new 
    @tweet = Tweet.new
  end
  
  def create
    logger.debug "----------"+params[:tweet][:message]+"--------------"
    if params[:tweet][:file]
      @tweet = Tweet.new(message: params[:tweet][:message], tdate: Time.current,file: params[:tweet][:file].read)
    else
      @tweet = Tweet.new(message: params[:tweet][:message], tdate: Time.current)
    end
    
    if @tweet.save
    redirect_to tweets_path
    else
      render 'new'
    end
  end
  
  def get_image
    tweet = Tweet.find(params[:id])
    send_data tweet.file,disposition: :inline, type: 'image/png'
  end
  
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to tweets_path
  end
  
  def edit
    @tweet = Tweet.find(params[:id])
  end
  
  def update
    @tweet = Tweet.find(params[:id])
    if params[:tweet][:file]
      if @tweet.update(message: params[:tweet][:message], tdate: Time.current,file: params[:tweet][:file].read)
        redirect_to tweets_path
      else
        render'edit'
      end
    else
      if @tweet.update(message: params[:tweet][:message], tdate: Time.current)
        redirect_to tweets_path
      else
        render'edit'
      end
    end
    
   
  end
  
  def show
    @tweet = Tweet.find(params[:id])
  end
end
