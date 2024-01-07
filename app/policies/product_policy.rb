# frozen_string_literal: true

class ProductPolicy < ApplicationPolicy
  def new?
    user.role == 'admin'
  end

  def edit?
    user.role == 'admin'
  end

  def destroy?
    user.role == 'admin'
  end

  def update?
    user.role == 'admin'
  end

  def create?
    user.role == 'admin'
  end

  def remove_image?
    user.role == 'admin'
  end
end
