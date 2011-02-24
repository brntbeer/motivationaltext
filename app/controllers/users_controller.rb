class UsersController < ApplicationController
  before_filter :autenticate_user!

  def show
    @user = User.find(params[:id])
  end

end
