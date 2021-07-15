class Test < ApplicationRecord
  def self.tests_by_category(category_name)
    Test.where(category_id: Category.where(title: category_name).select(:id)).order(title: :desc)
  end
end
