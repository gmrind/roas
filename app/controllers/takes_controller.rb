class TakesController < ApplicationController
  before_action :set_take, only: [:show, :edit, :update, :destroy]

  def index
    @takes = Take.all
    @user = current_user
  end

  def show
  end

  def new
    @take = Take.new
    @user = current_user
  end

  def edit
  end

  def create
    @user = current_user
    @take = current_user.takes.build(take_params)

    if @take.save
      flash[:notice] = "Course added successfully."
      redirect_to takes_url
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @take.update(take_params)
        format.html { redirect_to takes_url, notice: 'Course successfully updated.' }
        format.json { render :show, status: :ok, location: @take }
      else
        format.html { render :edit }
        format.json { render json: @take.errors, status: :unprocessable_entity }
      end
    end
  end

  # def destroy
  #   @take.destroy
  #   respond_to do |format|
  #     format.html { redirect_to takes_url, notice: 'Course successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private

    def set_take
      @take = Take.find(params[:id])
      @user = current_user
    end

    def take_params
      params.require(:take).permit(:course_id, :user_id)
    end
end
