# frozen_string_literal: true

class DeviseUserRole < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :role, :integer, default: 0
  end
end
