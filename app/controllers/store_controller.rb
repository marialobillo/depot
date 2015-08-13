class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart
  def index
    @products = Product.order(:title)

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
end
