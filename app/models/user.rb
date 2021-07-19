class User < ApplicationRecord
  has_many :test_results
  has_many :tests, through: :test_results
  # связь для автора, надо либо переименовывать tests в что-то типа running_tests
  # либо вот так называть тесты, в которых пользователь-автор, иначе
  has_many :exercises, class_name: 'Test', foreign_key: 'author_id'

  def get_tests(test_level)
    Test.joins('JOIN test_results ON tests.id = test_results.test_id').where(
      'test_results.user_id = ?', self.id).where(level: test_level)
  end
end
