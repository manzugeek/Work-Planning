class WorkersController < ApplicationController
  before_action :set_user, only: [:show, :new, :create, :edit, :update, :destroy]
  
  def index
    @workers = Worker.all
  end

  def show
    @worker = @user.worker
  end

  def new
    @worker = @user.build_worker
  end

  def create
    @worker = @user.build_worker(worker_params)

    if @worker.save
        redirect_to user_worker_url(@user, @worker),
            notice: "Welcome! worker enrolled successfully"                 
    else
      render :new, status: :unprocessable_entity 
    end
  end

  def edit
    @worker = @user.worker
  end

  def update
    @worker = @user.worker
    
    if @worker.update(worker_params)
          redirect_to user_worker_url(@user, @worker),
              notice: "Record updated successfully"      
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @worker = @user.worker

    @worker.destroy
      redirect_to user_workers_path(@user),
                                   status: :see_other 
  end


  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def worker_params
    params.require(:worker).permit(:title, :dept)
  end
end
