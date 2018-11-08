# frozen_string_literal: true

module PostsHelper
  # TODO: Use decorator pattern for such methods
  def full_name(user)
    "#{user.try(:first_name)} #{user.try(:last_name)}"
  end

  def my_date_format(date)
    date.strftime('%d %B %Y at %H:%M')
  end
end
