class CreateMitras < ActiveRecord::Migration[5.0]
  def change
    create_table :mitras do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :auth_token
      t.timestamps
    end

    create_table :meditations do |t|
      t.integer :meditation_time
      t.timestamps
      t.references :mitra, foreign_key: true
    end

    create_table :kirtans do |t|
      t.integer :kirtan_time
      t.timestamps
      t.references :mitra, foreign_key: true
    end
  end
end
