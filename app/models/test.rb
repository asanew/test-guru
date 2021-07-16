class Test < ApplicationRecord
  def self.by_category(category_name)
    joins('JOIN categories ON tests.category_id = categories.id').where(
      'categories.title = ?', category_name).order(title: :desc).select(:title).to_a
  end
end
