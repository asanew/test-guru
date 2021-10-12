class User < ApplicationRecord
  has_many :test_results, dependent: :destroy
  has_many :tests, through: :test_results
  has_many :own_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy

  validates :login, presence: true

  scope :by_test_level, -> (test_level) {
    joins(:tests)
      .where('tests.level = ?',test_level).distinct
  }

  def get_tests(test_level)
    by_test_level(test_level).where(id: self.id).first.tests
  end
end
