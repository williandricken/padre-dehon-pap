class AddUserRefToResponsible < ActiveRecord::Migration
  def change
    add_reference :responsibles, :user, index: true, foreign_key: true
  end
end
