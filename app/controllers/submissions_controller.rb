class SubmissionsController < ApplicationController
  before_action :set_submission, only: [:show, :edit, :update, :destroy]

  def index
    @submissions = Submission.all
  end

  def show
      @makeassign = Makeassign.find(params[:id])
      @course = Course.find(params[:course_id])
      @coursesemester = Coursesemester.find(params[:coursesemester_id])
      @subject = Subject.find(params[:subject_id])
      @user = current_user
  end

  def new
    @submission = Submission.new
    @makeassign = Makeassign.find(params[:id])
    @course = Course.find(params[:course_id])
    @coursesemester = Coursesemester.find(params[:coursesemester_id])
    @subject = Subject.find(params[:subject_id])
    @user = current_user
  end

  def edit
  end

  def create
    # @makeassign = Makeassign.find(params[:id])
    @user = current_user
    @course = Course.find(params[:course_id])
    @coursesemester = Coursesemester.find(params[:coursesemester_id])
    @makeassign = Makeassign.find(params[:makeassign_id])
    @submission = @makeassign.submissions.create(submission_params)
    @submission.user = current_user
    respond_to do |format|
      if @submission.save
        format.html { redirect_to :back, notice: 'Assignment Submission was successfully.' }
        format.json { render :show, status: :created, location: @submission }
      else
        format.html { render :new }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @submission.update(submission_params)
        format.html { redirect_to @submission, notice: 'Submission was successfully updated.' }
        format.json { render :show, status: :ok, location: @submission }
      else
        format.html { render :edit }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @submission.destroy
    respond_to do |format|
      format.html { redirect_to submissions_url, notice: 'Submission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_submission
      @submission = Submission.find(params[:id])
      @makeassign = Makeassign.find(params[:makeassign_id])
      @course = Course.find(params[:course_id])
      @coursesemester = Coursesemester.find(params[:coursesemester_id])
      @subject = Subject.find(params[:subject_id])
      @user = current_user
    end

    def submission_params
      params.require(:submission).permit(:user_id, :roll_no, :sub_body, :makeassign_id)
    end
end
