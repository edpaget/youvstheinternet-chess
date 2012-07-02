class SessionsController < ApplicationController
  def create
    request.env['omniauth.auth'].inspect
  end
end
