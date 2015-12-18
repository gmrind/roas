class CoursesessionsController < ApplicationController
  before_action :set_coursesession, only: [:show, :edit, :update, :destroy]
  before_filter :unautherized_for_all
  def index
    @coursesessions = Coursesession.all
    @user = current_user
  end

  def show
  end

  def new
    @coursesession = Coursesession.new
    @user = current_user
  end

  def edit
  end

  def create
    @coursesession = Coursesession.new(coursesession_params)

    respond_to do |format|
      if @coursesession.save
        format.html { redirect_to coursesessions_url, notice: 'Coursesession was successfully created.' }
        format.json { render :show, status: :created, location: @coursesession }
      else
        format.html { render :new }
        format.json { render json: coursesessions_url.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @coursesession.update(coursesession_params)
        format.html { redirect_to coursesessions_url, notice: 'Coursesession was successfully updated.' }
        format.json { render :show, status: :ok, location: @coursesession }
      else
        format.html { render :edit }
        format.json { render json: coursesessions_url.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @coursesession.destroy
    respond_to do |format|
      format.html { redirect_to coursesessions_url, notice: 'Coursesession was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_coursesession
      @coursesession = Coursesession.find(params[:id])
      @user = current_user
    end

    def coursesession_params
      params.require(:coursesession).permit(:name, :user_id)
    end
end
