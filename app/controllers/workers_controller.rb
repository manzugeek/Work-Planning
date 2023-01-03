class WorkersController < ApplicationController
  before_action :set_worker, except: [:index]
  
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
              notice: "record updated successfully"      
    else
      render :edit, status: :unprocessable_entity
    end
  end


  private

  def set_worker
    @user = User.find(params[:user_id])
  end

  def worker_params
    params.require(:worker).permit(:title, :dept)
  end
end
