class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']

    auth = Authorization.find_by_hash auth_hash
    auth ||= Authorization.create_from_hash auth_hash, @current_user

    session[:user_id] = auth.user.id

    redirect_to root_url
  end
end
