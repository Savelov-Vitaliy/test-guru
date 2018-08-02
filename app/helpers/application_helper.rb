module ApplicationHelper

  def this_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to "Test-guru", "https:/github.com/#{author}/#{repo}", target: :blank
  end

  def flash_message(message)
    content_tag :p, flash[message], class: "flash alert" if flash[message]
  end

end
