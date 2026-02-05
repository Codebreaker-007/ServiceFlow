class JobsController < ApplicationController
  def create
    @job = current_user.jobs.build(job_params)
    if current_user.is_premium?
      @job.is_featured = true  # Premium perk
    end
    if @job.save
      render json: @job, status: :created
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  private
  def job_params
    params.require(:job).permit(:title, :description, :location)
  end
end