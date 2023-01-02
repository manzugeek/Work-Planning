class WorkersController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @worker = @user.build_worker
  end

  def create
    @user = User.find(params[:user_id])
    @worker = @user.build_worker(worker_params)

    if @worker.save
      redirect_to @worker, 
                flash[:notice] = "Welcome! You're now eligible worker"
    else
      render :new 
  end

  def edit
    @user = User.find(params[:user_id])
    @worker = @user.worker
  end

  def update
    @user = User.find(params[:user_id])
    @worker = @user.worker
    
    if @worker.update(worker_params)
         notice: "record updated successfully"
            redirect_to user_worker_path(@worker)
    else
      render :edit, status: :unprocessable_entity
  end


  private

  def set_worker
    
  end

  def workers_params
    params.require(:worker).permit(:title, :dept)
  end

  # before_action :ensure_profile_ownership, only: [:edit, :update, :destroy]
  def ensure_profile_ownership
    if current_user.profile_id != params[:id]
      redirect_to profile_path(params[:id]), notice: 'Some message about not having access to perform that action'
    end
  end
end
