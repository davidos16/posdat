class DashboardController < ApplicationController
  def home
    @widgets = current_user.widgets.all
  end
end
