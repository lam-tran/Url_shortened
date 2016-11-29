class UrlshortenersController < ApplicationController

  before_action :set_urlshortener, only: [:destroy]

  # GET /urlshorteners
  # GET /urlshorteners.json
  def index
    @urlshortener = Urlshortener.new
    @urlshorteners = Urlshortener.all
  end

  # GET /urlshorteners/1
  # GET /urlshorteners/1.json
  def show
  end

  def link
    if params[:shortened]
        @link = Urlshortener.find_by(shortened: params[:shortened])
        if @link.blank?
          redirect_to urlshorteners_path
        else
          if redirect_to @link.url
            @link.clicks += 1
            @link.save
          end
      end
    else
      @link = Urlshortener.find(params[:shortened])
    end
  end

  # GET /urlshorteners/new
  def new
    @urlshortener = Urlshortener.new
  end

  # GET /urlshorteners/1/edit
  def edit
  end

  # POST /urlshorteners
  # POST /urlshorteners.json
  def create
    @urlshortener = Urlshortener.new(urlshortener_params)
    @urlshortener.generate_url()

    respond_to do |format|
      if @urlshortener.save
        format.html { redirect_to urlshorteners_url, notice: 'Urlshortener was successfully created.' }
        #format.json { render :show, status: :created, location: @urlshortener }
      else
        format.html { render :new }
        #format.json { render json: @urlshortener.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /urlshorteners/1
  # PATCH/PUT /urlshorteners/1.json
  def update
  end

  # DELETE /urlshorteners/1
  # DELETE /urlshorteners/1.json
  def destroy
    @urlshortener.destroy
    respond_to do |format|
      format.html { redirect_to urlshorteners_url, notice: 'Urlshortener was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_urlshortener
      @urlshortener = Urlshortener.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def urlshortener_params
      params.require(:urlshortener).permit(:url)
    end
end
