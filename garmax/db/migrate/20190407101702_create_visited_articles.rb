class CreateVisitedArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :visited_articles do |t|
      t.references :user, foreign_key: true
      t.references :article, foreign_key: true

      t.timestamps
    end
  end
end
