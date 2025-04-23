module ChartsHelper
  def min_weight(chart_data)
    chart_data.map(&:last).min
  end

  def max_weight(chart_data)
    chart_data.map(&:last).max
  end

  def average_weight(chart_data)
    weights = chart_data.map(&:last)
    weights.sum / weights.size.to_f
  end
end
