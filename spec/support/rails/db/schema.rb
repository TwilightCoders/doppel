ActiveRecord::Schema.define do

  enable_extension "fuzzystrmatch"

  self.verbose = false

  create_table :users do |t|
    t.string :name, index: :btree
    t.string :email, index: :btree
    t.timestamps null: false
  end

end
