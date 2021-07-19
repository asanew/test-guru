class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :questions
  has_many :test_results
  has_many :users, through: :test_results

  def self.by_category(category_name)
    joins('JOIN categories ON tests.category_id = categories.id').where(
      'categories.title = ?', category_name).order(title: :desc).pluck(:title).to_a
  end
end
