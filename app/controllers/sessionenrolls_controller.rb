class SessionenrollsController < ApplicationController
  before_action :set_sessionenroll, only: [:show, :edit, :update, :destroy]
  before_filter :unautherized_for_all, only: [:show, :edit, :update, :destroy]
  
  def index
    @sessionenrolls = Sessionenroll.all
    @user = current_user
  end

  def show
  end

  def new
    @sessionenroll = Sessionenroll.new
    @user = current_user
  end

  def edit
  end

  def create
    @user = current_user
    @sessionenroll = current_user.sessionenrolls.build(sessionenroll_params)

    respond_to do |format|
      if @sessionenroll.save
        format.html { redirect_to sessionenrolls_url, notice: 'Sessionenroll was successfully created.' }
        format.json { render :show, status: :created, location: @sessionenroll }
      else
        format.html { render :new }
        format.json { render json: sessionenrolls_url.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @sessionenroll.update(sessionenroll_params)
        format.html { redirect_to sessionenrolls_url, notice: 'Sessionenroll was successfully updated.' }
        format.json { render :show, status: :ok, location: @sessionenroll }
      else
        format.html { render :edit }
        format.json { render json: sessionenrolls_url.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @sessionenroll.destroy
    respond_to do |format|
      format.html { redirect_to sessionenrolls_url, notice: 'Sessionenroll was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_sessionenroll
      @sessionenroll = Sessionenroll.find(params[:id])
      @user = current_user
    end

    def sessionenroll_params
      params.require(:sessionenroll).permit(:coursesession_id, :user_id)
    end
end
