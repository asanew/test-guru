class User < ApplicationRecord
  has_many :tests

  def get_tests(test_level)
    Test.joins('JOIN test_results ON tests.id = test_results.test_id').where(
      'test_results.user_id = ?', self.id).where(level: test_level)
  end
end
