class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user as :author
  has_many :questions

  def self.by_category(category_name)
    joins('JOIN categories ON tests.category_id = categories.id').where(
      'categories.title = ?', category_name).order(title: :desc).pluck(:title).to_a
  end
end
