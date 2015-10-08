class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.integer :age
      t.string :mobile_no
      t.string :email
      t.string :occupation
      t.string :designation
      t.string :company_name
      t.string :college_name
      t.string :course
      t.integer :semester

      t.timestamps null: false
    end
  end
end
