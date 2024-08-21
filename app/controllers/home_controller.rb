class HomeController < ApplicationController
  before_action :authenticate_job_seeker!, except: :welcome

  def welcome; end

  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def profile
    @job_seeker = current_job_seeker
  end
end
