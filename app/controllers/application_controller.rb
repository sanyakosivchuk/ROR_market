# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_query
  include Pundit

  def set_query
    @query = Product.ransack(params[:q])
  end
end
