class AddAnsOptionsToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :ans_options, :string, array: true, default: []
  end
end
