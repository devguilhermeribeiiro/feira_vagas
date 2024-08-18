class HomeController < ApplicationController
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(param[:id])
  end
end
