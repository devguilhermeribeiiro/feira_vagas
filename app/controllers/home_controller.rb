# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :authenticate_job_seeker!, except: :welcome

  def welcome
    if employer_signed_in?
      redirect_to jobs_path
    elsif job_seeker_signed_in?
      redirect_to start_path
    end
  end

  def index
    jobs = Job.all
    @jobs = jobs.sort_by(&:created_at).reverse
  end

  def show
    @job = Job.find(params[:id])
    @application = @job.applications.find_by(job_seeker_id: current_job_seeker.id)
  end

  def apply
    @job = Job.find(params[:id])
    @apply = @job.applications.create(job_seeker: current_job_seeker)

    if @apply.save
      redirect_to home_path(@job), notice: 'Candidatura enviada com sucesso!'
    else
      redirect_to home_path(@job), notice: 'Não foi possivel enviar sua candidatura'
    end
  end
end
