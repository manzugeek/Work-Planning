class ShiftsController < ApplicationController
  def index
    @shifts = Shift.all
  end

  def new
    @worker = Worker.find(params[:worker_id])
    @shift = @worker.shifts.new
  end

  def create
    @worker = Worker.find(params[:worker_id])
    @shift = @worker.shifts.new(shift_params)

    if @shift.save
      redirect_to worker_shifts_url(@worker),
               notice: "Shift created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def shift_params
    params.require(:shift).permit(:slot, :start_at, :end_at)
  end
end
