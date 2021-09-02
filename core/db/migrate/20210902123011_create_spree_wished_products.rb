class CreateSpreeWishedProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :spree_wished_products, if_not_exists: true do |t|
      t.references :variant
      t.references :wishlist

      t.column :quantity, :integer, default: 1, null: false
      t.column :remark, :text

      t.timestamps
    end

    add_index :spree_wished_products, :variant_id unless index_exists?(:spree_wished_products, :variant_id)
    add_index :spree_wished_products, :wishlist_id unless index_exists?(:spree_wished_products, :wishlist_id)
  end
end

