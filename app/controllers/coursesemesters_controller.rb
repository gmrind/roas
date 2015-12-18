class CoursesemestersController < ApplicationController
  before_action :set_coursesemester, only: [:show, :edit, :update, :destroy]
  before_filter :unautherized_for_all
  
  def index
    @coursesemesters = Coursesemester.all
    @user = current_user
  end

  def show
    @subject = Subject.new
    # @subject = Subject.find(params[:id])
    @course = Course.find(params[:course_id])
  end

  def new
    @coursesemester = Coursesemester.new
    @user = current_user
  end

  def edit
    @coursesemester = Coursesemester.new
    @course = Course.find(params[:course_id]) 
  end

  def create
    @course = Course.find(params[:course_id])
    @coursesemester = @course.coursesemesters.create(coursesemester_params)

    respond_to do |format|
      if @coursesemester.save
        format.html { redirect_to course_path(@course), notice: 'Coursesemester was successfully created.' }
        format.json { render :show, status: :created, location: @coursesemester }
      else
        format.html { render :new }
        format.json { render json: course_path(@course).errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @coursesemester.update(coursesemester_params)
        format.html { redirect_to course_path(@course), notice: 'Coursesemester was successfully updated.' }
        format.json { render :show, status: :ok, location: @coursesemester }
      else
        format.html { render :edit }
        format.json { render json: course_path(@course).errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @coursesemester.destroy
    respond_to do |format|
      format.html { redirect_to course_path(@coursesemester), notice: 'Coursesemester was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_coursesemester
      @coursesemester = Coursesemester.find(params[:id])
      @user = current_user
    end

    def coursesemester_params
      params.require(:coursesemester).permit(:name, :course_id, :user_id)
    end
end
