# frozen_string_literal: true

class JobsController < ApplicationController
  before_action :set_job, only: %i[ applyers show edit update destroy]
  before_action :authenticate_employer!

  def index
    jobs = current_employer.jobs
    @jobs = jobs.sort_by(&:created_at).reverse
  end

  def new
    @job = Job.new
  end

  def applyers
    @applyers = @job.job_seekers
  end
  
  def show; end

  def edit; end

  def create
    @job = current_employer.jobs.new(job_params)

    if @job.save
      redirect_to job_url(@job), notice: 'Vaga publicada com sucesso'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @job.update(job_params)
      redirect_to job_url(@job), notice: 'Vaga atualizada com sucesso'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @job.destroy
    redirect_to jobs_url, notice: 'A vaga foi excluída com sucesso.'
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:title, :description, :location, :mode, :salary, :requirements, :skills, :benefits)
  end
end
