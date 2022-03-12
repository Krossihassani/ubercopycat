class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
  end

  def profile
  end

  def ride_history
  end
end
