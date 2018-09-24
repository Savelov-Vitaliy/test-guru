class GistQuestionService

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end

  def call
    result = @client.create_gist(gist_params)
    ResultObject.new(result)
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

end
