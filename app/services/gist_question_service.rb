class GistQuestionService

  def initialize(question, client = default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    result = @client.create_gist(gist_params)
    ResultObject.new(result)
  end

  def destroy(gist_id)
    @client.delete_gist(gist_id)
  end

  private

  def gist_params
    {
      description: I18n.t('services.gist_question_service.gist_description', test_title: @test.title),
      files: {
        'test_guru_question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end

  def default_client
     Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end

end

class ResultObject

  attr_reader :html_url

  def initialize(result)
    @html_url = result.html_url if result.respond_to?(:html_url)
  end

  def success?
    @html_url.present?
  end

end

