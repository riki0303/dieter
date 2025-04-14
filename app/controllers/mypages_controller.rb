class MypagesController < ApplicationController
  def show
    # グラフの表示のためにreverse
    @fitlogs = current_user.fitlogs.recent.reverse
    @chart_data = @fitlogs.map do |fitlog|
      date = fitlog.record_at.strftime("%-m/%-d")  # 例: "4/13"
      [ date, fitlog.weight ]
    end
  end
end
