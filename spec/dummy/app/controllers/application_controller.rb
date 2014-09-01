class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  theme :theme_resolver

  private

    def theme_resolver
      @current_theme ||= (params[:theme] || 'theme_a')
    end
end