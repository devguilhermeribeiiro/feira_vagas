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

end
