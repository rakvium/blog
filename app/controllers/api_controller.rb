# frozen_string_literal: true

class APIController < ActionController::API
  private

  def current_user
    @current_user ||= auth_token.try(:user)
  end

  def auth_token
    @auth_token ||= TokenManager::TokenUpdater.call(
      TokenManager::TokenExtractor.call(request)
    )
  end
end
