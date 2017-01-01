class SubscriptionsController < ApplicationController
  before_action :authenticate_user!, except: [:new]
  before_action :redirect_to_signup, only: [:new]

  def show
    #code
  end

  def new
    #code
  end

  def create
    #code
  end

  def destroy
    #code
  end

  private
  def redirect_to_signup
    if !user_signed_in?
      # return back after registiring
      session['user_return_to'] = new_subscription_path
      redirect_to new_user_registration_path
    end
  end
end
