class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :restrict_with_error
  has_many :test_results, dependent: :destroy
  has_many :users, through: :test_results, dependent: :restrict_with_error

  def self.by_category(category_name)
    joins(:category)
      .where(categories: { title: category_name })
      .order(title: :desc)
      .pluck(:title).to_a
  end
end
