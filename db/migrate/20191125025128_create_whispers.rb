class CreateWhispers < ActiveRecord::Migration[5.2]
  def change
    create_table :whispers do |t|
      t.text :content
    end
  end
end
