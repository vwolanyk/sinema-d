class Films::WatchedController < ApplicationController
def create
  @film = Film.find(params[:id])
  respond_to do |format|
    if @film.update(last_watched: Date.today)
      format.html { redirect_to "/films", notice: 'Film was successfully watched.' }
      format.json {redirect_to films_url, status: :created}
    else
      format.html { redirect_to films_url }
      format.json { render json: @film.errors, status: :unprocessable_entity }
    end
  end
end
end
