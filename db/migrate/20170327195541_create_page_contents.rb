class CreatePageContents < ActiveRecord::Migration[5.0]
  def change
    create_table :page_contents do |t|
      t.text :about
      t.text :contact

      t.timestamps
    end
  end
end
