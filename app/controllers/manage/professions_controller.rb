class Manage::ProfessionsController < ApplicationController
  before_action :set_manage_profession, only: [:show, :edit, :update, :destroy]

  # GET /manage/professions
  # GET /manage/professions.json
  def index
    @manage_professions = Manage::Profession.all
  end

  # GET /manage/professions/1
  # GET /manage/professions/1.json
  def show
  end

  # GET /manage/professions/new
  def new
    @manage_profession = Manage::Profession.new
  end

  # GET /manage/professions/1/edit
  def edit
  end

  # POST /manage/professions
  # POST /manage/professions.json
  def create
    @manage_profession = Manage::Profession.new(manage_profession_params)

    respond_to do |format|
      if @manage_profession.save
        format.html { redirect_to @manage_profession, notice: 'Profession was successfully created.' }
        format.json { render :show, status: :created, location: @manage_profession }
      else
        format.html { render :new }
        format.json { render json: @manage_profession.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manage/professions/1
  # PATCH/PUT /manage/professions/1.json
  def update
    respond_to do |format|
      if @manage_profession.update(manage_profession_params)
        format.html { redirect_to @manage_profession, notice: 'Profession was successfully updated.' }
        format.json { render :show, status: :ok, location: @manage_profession }
      else
        format.html { render :edit }
        format.json { render json: @manage_profession.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manage/professions/1
  # DELETE /manage/professions/1.json
  def destroy
    @manage_profession.destroy
    respond_to do |format|
      format.html { redirect_to manage_professions_url, notice: 'Profession was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manage_profession
      @manage_profession = Manage::Profession.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manage_profession_params
      params.require(:manage_profession).permit(:name)
    end
end