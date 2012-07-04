class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.has_attached_file :photo
      t.string :tag

      t.timestamps
    end
  end
end
