class User < ApplicationRecord
  def get_tests(test_level)
    Test.where(id: TestResult.where(user_id: self.id).select(:test_id))
        .where(level: test_level)
  end
end
