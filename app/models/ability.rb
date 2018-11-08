# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= Guest.new
    can :read, :all
    alias_action :create, :read, :update, :destroy, to: :crud

    if user.admin? || user.root?
      can :manage, :all
    elsif user.author?
      can :crud, Post, user_id: user.id
      can %i[create destroy], Comment, user_id: user.id
    end
  end
end
