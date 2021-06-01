class AddTitleToOffers < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :title, :string
  end
end
