class Post < ApplicationRecord
  def post
    create_table :posts do |to_do|
      t.string :title
      t.string :author
      t.string :body

      t.timestamps
    end
  end
end
