class ClickerReflex < ApplicationReflex
  def increment(step = 1)
    session[:count] = session[:count].to_i + step
  end

  def save
    puts 'saved'
  end
end
