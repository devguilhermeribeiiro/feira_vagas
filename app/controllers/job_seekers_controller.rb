class JobSeekersController < ApplicationController
  before_action :set_job_seeker, only: %i[show edit update destroy]

  def applys
    @applications = current_job_seeker.jobs
  end

  def show; end

  def edit; end

  def update
    if @job_seeker.update(job_seeker_params)
      redirect_to job_seeker_url(@job_seeker), notice: 'Perfil atualizado com sucesso'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @job_seeker.destroy
    redirect_to root_url
  end

  private

  def set_job_seeker
    @job_seeker = JobSeeker.find(current_job_seeker.id)
  end

  def job_seeker_params
    params.require(:job_seeker).permit(%i[full_name phone email degree courses experiences profile_img])
  end
end
