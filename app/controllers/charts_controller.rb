class ChartsController < ApplicationController
  before_action :authenticate_user!, only: %i[ show ]
  def show
    # グラフ表示のためリバース
    @fitlogs = current_user.fitlogs.recent.reverse
    return if @fitlogs.blank?

    @chart_data = @fitlogs.map do |fitlog|
      date = fitlog.record_at.strftime('%-m/%-d')  # 例: "4/13"
      [ date, fitlog.weight ]
    end
  end
end
