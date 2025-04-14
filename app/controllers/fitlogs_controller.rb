class FitlogsController < ApplicationController
  before_action :authenticate_user!
  def index
    @fitlogs = current_user.fitlogs.all.order(created_at: :desc)
  end

  def new
    @fitlog = current_user.fitlogs.new
  end

  def create
    @fitlog = current_user.fitlogs.new(fitlog_params)
    if @fitlog.save
      redirect_to fitlogs_path, notice: "記録が保存出来ました"
    else
      flash.now[:alert] = "記録の保存に失敗しました"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @fitlog = current_user.fitlogs.find(params[:id])
  end

  def update
    @fitlog = current_user.fitlogs.find(params[:id])
    if @fitlog.update(fitlog_params)
      redirect_to fitlogs_path, notice: "記録が更新されました"
    else
      flash.now[:alert] = "記録の更新に失敗しました"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @fitlog = current_user.fitlogs.find(params[:id])
    if @fitlog.destroy
      redirect_to fitlogs_path, notice: "記録が削除されました"
    else
      flash.now[:alert] = "記録の削除に失敗しました"
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def fitlog_params
    params.require(:fitlog).permit(:record_at, :weight, :body_fat, :muscle, :bmr, :body_age, :memo)
  end
end
