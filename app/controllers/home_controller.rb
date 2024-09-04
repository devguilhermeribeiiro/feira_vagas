# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :authenticate_job_seeker!, except: :welcome
  before_action :verify_profile, only: :apply
  
  def welcome; end

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
  
  private
  
  def verify_profile
    if current_job_seeker.full_name == nil 
      redirect_to edit_job_seeker_path(current_job_seeker), notice: 'Complete seu perfil antes de continuar'
    end
  end
end
