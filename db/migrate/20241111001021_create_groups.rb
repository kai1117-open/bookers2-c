class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.references :owner, null: false, foreign_key: { to_table: :users }  # 外部キー参照を明示的に設定

      t.timestamps
    end
  end
end

