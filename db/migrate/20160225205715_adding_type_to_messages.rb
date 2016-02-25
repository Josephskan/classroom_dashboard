class AddingTypeToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :type, :string
  end
end
