class CreateUnidomPasswords < ActiveRecord::Migration

  def change

    create_table :unidom_passwords, id: :uuid do |t|

      t.column :hashed_content, 'char(128)', null: false
      t.column :pepper_content, 'char(128)', null: false

      t.column   :state, 'char(1)', null: false, default: 'C'
      t.datetime :opened_at,        null: false, default: Unidom::Common::OPENED_AT
      t.datetime :closed_at,        null: false, default: Unidom::Common::CLOSED_AT
      t.boolean  :defunct,          null: false, default: false
      t.jsonb    :notation,         null: false, default: {}

      t.timestamps null: false

    end

    add_index :unidom_passwords, :hashed_content

  end

end
