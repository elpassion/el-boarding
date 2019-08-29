class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :authenticate_should_be_skipped?

  private

  def authenticate_should_be_skipped?
    params[:controller] == 'switch_user'
  end
end
