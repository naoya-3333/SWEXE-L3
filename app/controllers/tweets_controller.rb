class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end
  
  def new 
    @tweet = Tweet.new
  end
  
  def create
    @tweet = Tweet.new(message: params[:tweet][:message], tdate: params[:tweet][:tdate],file: params[:tweet][:file].read)
    
    if @tweet.save
    redirect_to'/'
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
    redirect_to'/'
  end
  
  def edit
    @tweet = Tweet.find(params[:id])
  end
  
  def update
    @tweet = Tweet.find(params[:id])
    @tweet.update(message: params[:tweet][:message],file: params[:tweet][:file].read)
    if @tweet.save
    redirect_to'/'
    else
      render 'new'
    end
  end
  
  def show
    @tweet = Tweet.find(params[:id])
  end
end
