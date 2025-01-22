class Recipe < ApplicationRecord
  def ingredients_list
    ingredients.split(", ")
  end

  def friendly_created_at
    created_at.strftime("%l:%M:%S %P %B %Y")
  end

  def friendly_prep_time
    hours = prep_time / 60
    minutes = prep_time % 60
    "#{hours} hours and #{minutes} minutes"
    # "7 hours and 35 minutes"
  end
end
