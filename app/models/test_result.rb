class TestResult < ApplicationRecord
  belongs_to :users
  belongs_to :tests
end
