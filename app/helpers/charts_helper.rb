module ChartsHelper
  def min_weight(chart_data)
    chart_data.map(&:last).min
  end

  def max_weight(chart_data)
    chart_data.map(&:last).max
  end
end
