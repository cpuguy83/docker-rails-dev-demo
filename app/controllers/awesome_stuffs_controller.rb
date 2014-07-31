class AwesomeStuffsController < ApplicationController
  before_action :set_awesome_stuff, only: [:show, :edit, :update, :destroy]

  # GET /awesome_stuffs
  # GET /awesome_stuffs.json
  def index
    @awesome_stuffs = AwesomeStuff.all
  end

  # GET /awesome_stuffs/1
  # GET /awesome_stuffs/1.json
  def show
  end

  # GET /awesome_stuffs/new
  def new
    @awesome_stuff = AwesomeStuff.new
  end

  # GET /awesome_stuffs/1/edit
  def edit
  end

  # POST /awesome_stuffs
  # POST /awesome_stuffs.json
  def create
    @awesome_stuff = AwesomeStuff.new(awesome_stuff_params)

    respond_to do |format|
      if @awesome_stuff.save
        format.html { redirect_to @awesome_stuff, notice: 'Awesome stuff was successfully created.' }
        format.json { render :show, status: :created, location: @awesome_stuff }
      else
        format.html { render :new }
        format.json { render json: @awesome_stuff.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /awesome_stuffs/1
  # PATCH/PUT /awesome_stuffs/1.json
  def update
    respond_to do |format|
      if @awesome_stuff.update(awesome_stuff_params)
        format.html { redirect_to @awesome_stuff, notice: 'Awesome stuff was successfully updated.' }
        format.json { render :show, status: :ok, location: @awesome_stuff }
      else
        format.html { render :edit }
        format.json { render json: @awesome_stuff.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /awesome_stuffs/1
  # DELETE /awesome_stuffs/1.json
  def destroy
    @awesome_stuff.destroy
    respond_to do |format|
      format.html { redirect_to awesome_stuffs_url, notice: 'Awesome stuff was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_awesome_stuff
      @awesome_stuff = AwesomeStuff.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def awesome_stuff_params
      params.require(:awesome_stuff).permit(:name)
    end
end
