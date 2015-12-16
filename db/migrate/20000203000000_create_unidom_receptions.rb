class CreateUnidomReceptions < ActiveRecord::Migration

  def change

    create_table :unidom_receptions, id: :uuid do |t|

      t.references :visitor, type: :uuid, null: false,
        polymorphic: { null: false, default: '', limit: 200 }
      t.references :party,   type: :uuid, null: false,
        polymorphic: { null: false, default: '', limit: 200 }

      t.boolean :elemental, null: false, default: false

      t.column   :state, 'char(1)', null: false, default: 'C'
      t.datetime :opened_at,        null: false, default: ::Time.utc(1970)
      t.datetime :closed_at,        null: false, default: ::Time.utc(3000)
      t.boolean  :defunct,          null: false, default: false
      t.jsonb    :notation,         null: false, default: {}

      t.timestamps null: false

    end

    add_index :unidom_receptions, :visitor_id
    add_index :unidom_receptions, :party_id

  end

end
