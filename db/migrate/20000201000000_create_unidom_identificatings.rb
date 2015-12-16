class CreateUnidomIdentificatings < ActiveRecord::Migration

  def change

    create_table :unidom_identificatings, id: :uuid do |t|

      t.references :identity, type: :uuid, null: false,
        polymorphic: { null: false, default: '', limit: 200 }
      t.references :visitor,  type: :uuid, null: false,
        polymorphic: { null: false, default: '', limit: 200 }

      t.column   :state, 'char(1)', null: false, default: 'C'
      t.datetime :opened_at,        null: false, default: ::Time.utc(1970)
      t.datetime :closed_at,        null: false, default: ::Time.utc(3000)
      t.boolean  :defunct,          null: false, default: false
      t.jsonb    :notation,         null: false, default: {}

      t.timestamps null: false

    end

    add_index :unidom_identificatings, :identity_id
    add_index :unidom_identificatings, :visitor_id

  end

end
