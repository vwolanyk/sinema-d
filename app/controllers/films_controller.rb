class FilmsController < ApplicationController
  before_action :set_film, only: [:show, :edit, :update, :destroy]

  # GET /films
  # GET /films.json
  def index
    @films = Film.all
  end

  # GET /films/1
  # GET /films/1.json
  def show
  end

  # GET /films/new
  def new
    @film = Film.new
  end

  # GET /films/1/edit
  def edit
  end

  # POST /films
  # POST /films.json
  def create
    @film = Film.new(create_params)
    binding.pry;0
    create_new_genre if (!@film.genre && !new_genre_params.blank?)
    create_new_informant if (!@film.informant && !new_informant_params.blank?)

    respond_to do |format|
      if @film.save
        format.html { redirect_to @film, notice: 'Film was successfully created.' }
        format.json { render :show, status: :created, location: @film }
      else
        format.html { render :new }
        format.json { render json: @film.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /films/1
  # PATCH/PUT /films/1.json
  def update
    create_new_genre if !new_genre_params.blank?
    create_new_informant if !new_genre_params.blank?

    respond_to do |format|
      if @film.update(update_params)
        format.html { redirect_to @film, notice: 'Film was successfully updated.' }
        format.json { render :show, status: :ok, location: @film }
      else
        format.html { render :edit }
        format.json { render json: @film.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /films/1
  # DELETE /films/1.json
  def destroy
    @film.destroy
    respond_to do |format|
      format.html { redirect_to films_url, notice: 'Film was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_film
      @film ||= Film.find(params[:id])
    end

    def create_new_genre
      @film.genre = Genre.create(new_genre_params)
    end

    def create_new_informant
      @film.informant = Informant.create(new_informant_params)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def create_params
      params.require(:film).permit(%i[title note informant_id genre_id])
    end

    def update_params
      params.require(:film)
            .permit(%i[title note informant_id genre_id last_watched])
    end

    def new_genre_params
       { name: params.require(:film).permit(:new_genre_name)[:new_genre_name] }
    end
    def new_informant_params
      { name: params.require(:film)
                    .permit(:new_informant_name)[:new_informant_name] }
    end
end
