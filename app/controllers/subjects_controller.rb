class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy]

  def index
    @subjects = Subject.all
    @user = current_user
  end

  def show
  end

  def new
    @subject = Subject.new
    @user = current_user
  end

  def edit
    @course = Course.find(params[:course_id])
    @coursesemester = Coursesemester.find(params[:coursesemester_id])
  end

  def create
    @course = Course.find(params[:course_id])
    @coursesemester = Coursesemester.find(params[:coursesemester_id])
    @subject = @coursesemester.subjects.create(subject_params)

    respond_to do |format|
      if @subject.save
        format.html { redirect_to :back, notice: 'Subject was successfully created.' }
        format.json { render :show, status: :created, location: @subject }
      else
        format.html { render :new }
        format.json { render json: :back.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @subject.update(subject_params)
        format.html { redirect_to :back, notice: 'Subject was successfully updated.' }
        format.json { render :show, status: :ok, location: @subject }
      else
        format.html { render :edit }
        format.json { render json: :back.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @subject.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Subject was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_subject
      @subject = Subject.find(params[:id])
      @user = current_user
    end

    def subject_params
      params.require(:subject).permit(:name, :user_id, :coursesemester_id)
    end
end
