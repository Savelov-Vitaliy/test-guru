module QuestionsHelper

  def question_header(question)
    title = question.test.title
    if question.persisted?
      "Edit '#{title}' Question"
    else      
      "Create new '#{title}' Question"
    end
  end

end
