class CreateUnidomAuthenticatings < ActiveRecord::Migration

  def change

    create_table :unidom_authenticatings, id: :uuid do |t|

      t.references :visitor,    type: :uuid, null: false,
        polymorphic: { null: false, default: '', limit: 200 }
      t.references :credential, type: :uuid, null: false,
        polymorphic: { null: false, default: '', limit: 200 }

      t.column :flag_code, 'char(4)', null: false, default: 'RQRD'

      t.column   :state, 'char(1)', null: false, default: 'C'
      t.datetime :opened_at,        null: false, default: ::Time.utc(1970)
      t.datetime :closed_at,        null: false, default: ::Time.utc(3000)
      t.boolean  :defunct,          null: false, default: false
      t.jsonb    :notation,         null: false, default: {}

      t.timestamps null: false

    end

    add_index :unidom_authenticatings, :visitor_id
    add_index :unidom_authenticatings, :credential_id

  end

end
