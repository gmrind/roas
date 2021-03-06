class MakeassignsController < ApplicationController
  before_action :set_makeassign, only: [:show, :edit, :update, :destroy]
  before_filter :unautherized_for_student,   only: [:index, :new, :edit, :update, :destroy]
  before_filter :unautherized_for_all,   only: [:index, :edit, :update, :destroy]

  def index
    @makeassigns = Makeassign.all
    @user = current_user
  end

  def show
    @course = Course.find(params[:course_id])
    @coursesemester = Coursesemester.find(params[:coursesemester_id])
    @subject = Subject.find(params[:subject_id])
    @submission = Submission.new
  end

  def new
    @user = current_user
    @course = Course.find(params[:course_id])
    @coursesemester = Coursesemester.find(params[:coursesemester_id])
    @subject = Subject.find(params[:subject_id])
    @makeassign = @subject.makeassigns.build
  end

  def edit
    @course = Course.find(params[:course_id])
    @coursesemester = Coursesemester.find(params[:coursesemester_id])
    @subject = Subject.find(params[:subject_id])
  end

  def create
    @user = current_user
    @course = Course.find(params[:course_id])
    @coursesemester = Coursesemester.find(params[:coursesemester_id])
    @subject = Subject.find(params[:subject_id])
    @makeassign = @subject.makeassigns.create(makeassign_params)

    respond_to do |format|
      if @makeassign.save
        format.html { redirect_to course_coursesemester_subject_url(@course, @coursesemester, @subject), notice: 'Makeassign was successfully created.' }
        format.json { render :show, status: :created, location: @makeassign }
      else
        format.html { render :new }
        format.json { render json: :back.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @makeassign.update(makeassign_params)
        format.html { redirect_to :back, notice: 'Makeassign was successfully updated.' }
        format.json { render :show, status: :ok, location: @makeassign }
      else
        format.html { render :edit }
        format.json { render json: :back.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @makeassign.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Makeassign was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_makeassign
      @makeassign = Makeassign.find(params[:id])
      @course = Course.find(params[:course_id])
      @coursesemester = Coursesemester.find(params[:coursesemester_id])
      @subject = Subject.find(params[:subject_id])
      @user = current_user
    end

    def makeassign_params
      params.require(:makeassign).permit(:subject_id, :user_id, :start_date, :end_date, :coursesemester_id, :coursesession_id, :body, :assign_no)
    end

  def unautherized_for_student
    @user = current_user
    if current_user && User.find_by(email: "admin@roas.com") == current_user
    elsif 
      current_user && @user.role == "teacher"
    else
      flash[:alert] = "You are not authorized to view this page"
      redirect_to @user
    end
  end
end
