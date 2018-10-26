# frozen_string_literal: true

module PostsHelper
  # TODO: Use decorator pattern for such methods
  def full_name(user)
    "#{user.first_name} #{user.last_name}"
  end

  def my_date_format(date)
    date.strftime('%d %B %Y at %H:%M')
  end
end
