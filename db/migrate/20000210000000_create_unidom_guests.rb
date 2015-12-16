class CreateUnidomGuests < ActiveRecord::Migration

  def change

    create_table :unidom_guests, id: :uuid do |t|

      t.column :platform_code, 'char(4)',         null: false, default: 'SITE'
      t.string :platform_specific_identification, null: false, default: '', limit: 200

      t.column   :state, 'char(1)', null: false, default: 'C'
      t.datetime :opened_at,        null: false, default: ::Time.utc(1970)
      t.datetime :closed_at,        null: false, default: ::Time.utc(3000)
      t.boolean  :defunct,          null: false, default: false
      t.jsonb    :notation,         null: false, default: {}

      t.timestamps null: false

    end

    add_index :unidom_guests, [ :platform_specific_identification, :platform_code ], unique: true, name: :index_guests_on_identification

  end

end
