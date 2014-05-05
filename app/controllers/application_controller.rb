class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
#  before_filter :authenticate_member! 
  def current_ability
   @current_ability ||=Ability.new(current_member)
  end 
end
