# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_articles_on_user_id  (user_id)
#
class Article < ApplicationRecord
    has_one_attached :eyecatch
    has_rich_text :content

  validates :title, presence: true
  validates :content, presence: true
  #length
  validates :title, length:{minimum: 2, maxmum: 100}

  validates :title, format: {with: /\A(?!\@)/ }


  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :user

end
