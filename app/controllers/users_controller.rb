# app/controllers/users_controller.rb
class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[ withdraw ]
  
  def withdraw
    current_user.withdraw

    sign_out current_user
    redirect_to new_user_session_path, notice: "退会処理が完了しました。ご利用ありがとうございました。"
  end
end
