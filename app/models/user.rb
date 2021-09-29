class User < ApplicationRecord
  has_many :test_results, dependent: :destroy
  has_many :tests, through: :test_results
  has_many :own_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy

  validates :login, presence: true

  scope :user_tests, -> (user,test_level) {
    Test.joins(:test_results)
      .where(test_results: { user: user})
      .where(level: test_level)
  }

  def get_tests(test_level)
    self.class.user_tests(self,test_level)
  end
end
