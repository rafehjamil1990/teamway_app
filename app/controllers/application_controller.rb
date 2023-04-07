# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def current_username
    @current_username ||= session['username']
  end

  def check_username
    redirect_to root_path if session['username'].blank?
  end
end
