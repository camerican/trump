class ConfigureInitialSchema < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.integer :location_id, index: true, foreign_key: true
      t.integer :type, default: nil, index: true
    end

    create_table :locations do |t|
      t.string :name, index: true
      t.float :geo_x, default: nil, index: true
      t.float :geo_y, default: nil, index: true
    end

    create_table :positions do |t|
      t.string  :name
    end

    create_table :organization_positions do |t|
      t.integer :organization_id, index: true, foreign_key: true
      t.integer :position_id, index: true, foreign_key: true
      t.datetime :start, index: true
      t.datetime :end, default: nil, index: true
    end

    # add_index :organization, :type

    # add_index :location, :name
    # add_index :location, :geo_x
    # add_index :location, :geo_y

    # add_index :organization_positions, :start
    # add_index :organization_positions, :end

    # add_reference :organization, :location, index: true, foreign_key: true
    # add_reference :organization_positions, :organization_id, index: true, foreign_key: true
    # add_reference :organization_positions, :position_id, index: true, foreign_key: true
  end
end
