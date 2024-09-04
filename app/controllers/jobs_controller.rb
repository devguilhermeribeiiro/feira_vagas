# frozen_string_literal: true

class JobsController < ApplicationController
  before_action :set_job, only: %i[ show edit update destroy]
  before_action :set_applyers, only: %i[ applyers applyer ]
  before_action :authenticate_employer!
  before_action :verify_profile, only: %i[ create new ]

  def index
    jobs = current_employer.jobs
    @jobs = jobs.sort_by(&:created_at).reverse
  end

  def new
    @job = Job.new
  end

  def applyers; end
  
  def applyer
    @applyer = @applyers.find(params[:job_seeker_id])
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
  
  def set_applyers
    @job = Job.find(params[:id])
    @applyers = @job.job_seekers
  end
  
  def job_params
    params.require(:job).permit(:title, :description, :location, :mode, :salary, :requirements, :skills, :benefits)
  end
  
  def verify_profile
    if current_employer.company_name == nil
      redirect_to edit_employer_path(current_employer)
    end
  end
end
