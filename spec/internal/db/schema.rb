ActiveRecord::Schema.define do
  create_table(:dummies) do |t|
    t.string :value
    t.timestamps
  end
end
