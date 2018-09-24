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

  def gist_name(gist)
    truncate(gist.question.body, length: 25)
  end

  def gist_url(gist)
    gist.github_url.split('/')[-1]
  end

end
