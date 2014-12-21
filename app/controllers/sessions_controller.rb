class SessionsController < ApplicationController
  def create
    #auth_hash["info"]["email"]
    #@user = User.find_or_create_from_auth_hash(auth_hash)
    #self.current_user = @user
    redirect_to '/'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
