class CreateTasklists < ActiveRecord::Migration
  def change
    create_table :tasklists do |t|
      t.string :title
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
