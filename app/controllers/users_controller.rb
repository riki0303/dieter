class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[ withdraw ]

  def withdraw
    current_user.withdraw

    sign_out current_user
    redirect_to new_user_session_path, notice: '退会処理が完了しました。ご利用ありがとうございました。'

  rescue => e
    # エラーハンドリング
    logger.error "user_id: #{current_user.id} の退会処理に失敗しました: #{e.message}"
    redirect_to edit_user_registration_path, alert: '退会処理に失敗しました。'
  end
end
