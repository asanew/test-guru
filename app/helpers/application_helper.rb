module ApplicationHelper
  AUTHOR_NAME = 'Асанов С.А.'.freeze
  def current_year
    Time.current.year
  end

  def author_name
    AUTHOR_NAME
  end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end
end
