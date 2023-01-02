class WorkersController < ApplicationController
  def index
    @workers = Worker.all
  end

  def show
    @user = User.find(params[:user_id])
    @worker = @user.worker
  end

  def new
    @user = User.find(params[:user_id])
    @worker = @user.build_worker
  end

  def create
    @user = User.find(params[:user_id])
    @worker = @user.build_worker(worker_params)

    if @worker.save
        redirect_to user_worker_url(@user, @worker),
            notice: "Welcome! worker enrolled successfully"                 
    else
      render :new, status: :unprocessable_entity 
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @worker = @user.worker
  end

  def update
    @user = User.find(params[:user_id])
    @worker = @user.worker
    
    if @worker.update(worker_params)
          redirect_to user_worker_url(@user, @worker),
              notice: "record updated successfully"      
    else
      render :edit, status: :unprocessable_entity
    end
  end


  private

  def set_worker
    
  end

  def worker_params
    params.require(:worker).permit(:title, :dept)
  end
end
