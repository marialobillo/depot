class StoreController < ApplicationController
  skip_before_action :authorize, only: [:create, :update, :destroy]
  include CurrentCart
  before_action :set_cart
  def index
    if params[:set_locale]
      redirect_to store_url(locale: params[:set_locale])
    else
      @products = Product.order(:title)
    end
    
    @count = session_count
    @session_greeting_msg = session_greeting
    flash[:notice] = @session_greeting_msg
  end

  def session_count
    if session[:counter].nil?
      session[:counter] = 0
    else
      session[:counter] += 1
    end
  end

  def session_greeting
    if @count == 0
      session_greeting = "Welcome!"
    else
      session_greeting = @count
    end
  end

  private
    def invalid_cart
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to store_url, notice: 'Invalid cart'
    end
end
