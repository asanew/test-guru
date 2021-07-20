class User < ApplicationRecord
  has_many :test_results, dependent: :destroy
  has_many :tests, through: :test_results, dependent: :restrict_with_error
  has_many :own_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :restrict_with_error

  def get_tests(test_level)
    Test.joins(:test_results)
      .where(test_results: { user: self})
      .where(level: test_level)
  end
end
