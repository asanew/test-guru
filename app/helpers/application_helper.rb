module ApplicationHelper
  AUTHOR_NAME = 'Асанов С.А.'.freeze
  PROJECT_NAME = 'Test GURU'.freeze
  def current_year
    Time.current.year
  end

  def author_name
    AUTHOR_NAME
  end

  def github_url(author, repo)
    link_to PROJECT_NAME, "https://github.com/#{author}/#{repo}"
  end
end
