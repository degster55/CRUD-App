# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  body       :text
#  edited_at  :datetime
#  published  :boolean
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :integer          not null
#
# Indexes
#
#  index_articles_on_author_id  (author_id)
#
# Foreign Keys
#
#  author_id  (author_id => authors.id)
#
class Article < ApplicationRecord
    # has_and_belongs_to_many :authors
    belongs_to :author

    validates :title, :body, :author, presence: true
   
    scope :published, -> { where(published: true) }
    scope :by_creation_date_desc, -> { order(created_at: :desc) }
end
