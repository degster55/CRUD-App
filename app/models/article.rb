# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  author     :string
#  body       :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Article < ApplicationRecord
    validates :title, :body, :author, presence: true
   
end
