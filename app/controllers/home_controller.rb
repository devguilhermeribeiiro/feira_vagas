class HomeController < ApplicationController
  before_action :authenticate_job_seeker!, except: :welcome

  def welcome; end

  def index
    jobs = Job.all
    @jobs = jobs.sort_by(&:created_at).reverse
  end

  def show
    @job = Job.find(params[:id])
  end

  def apply
    @job = Job.find(params[:id])
    @application = @job.applications.create(job_seeker: current_job_seeker)

    if @application.save
      redirect_to home_path(@job), alert: 'Candidatura enviada com sucesso!'
    else
      redirect_to home_path(@job), alert: 'Não foi possivel enviar sua candidatura'
    end
  end
end
