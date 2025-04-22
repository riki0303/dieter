module ProfilesHelper
  def bmi_color(bmi)
    case bmi
    when 0..18.4
      'text-info'
    when 18.5..24.9
      'text-success'
    when 25..29.9
      'text-warning'
    else
      'text-danger'
    end
  end

  def bmi(weight, height)
    (weight / ((height / 100) ** 2)).round(1)
  end

  def bmi_status(bmi)
    case bmi
    when 0..18.4
      ['低体重', 'bg-info']
    when 18.5..24.9
      ['標準', 'bg-success']
    else
      ['過体重', 'bg-warning']
    end
  end

  def progress_down(target_weight, weight)
    [(target_weight / weight * 100).to_i, 100].min
  end
  def progress_up(weight, target_weight)
    [(weight / target_weight * 100).to_i, 100].min
  end
end
