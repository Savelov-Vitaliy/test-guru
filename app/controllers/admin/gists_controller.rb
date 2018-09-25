class Admin::GistsController < Admin::BaseController

  def index
    @gists = Gist.all
  end

  def destroy
    gist = Gist.find(params[:id])
    GistQuestionService.new(gist.question).destroy(helpers.gist_url(gist))
    gist.destroy
    redirect_to admin_gists_url
  end

end
