class RenameComentToCommentInComments < ActiveRecord::Migration[8.1]
  def change
    rename_column :comments, :coment, :comment
  end
end