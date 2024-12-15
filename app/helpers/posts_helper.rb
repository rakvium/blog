# frozen_string_literal: true

module PostsHelper
  # TODO: Use decorator pattern for such methods
  def full_name(user)
    user.name
  end

  def my_date_format(date)
    date.strftime('%Y-%m-%d | %H:%M')
  end
end
