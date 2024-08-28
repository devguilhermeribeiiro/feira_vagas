class EmployersController < ApplicationController
  before_action :set_employer, only: %i[ show edit update destroy ]
  before_action :authenticate_employer!

  def show; end

  def edit; end

  def update
    if @employer.update(employer_params)
      redirect_to employer_url(@employer), notice: 'Perfil atualizado com sucesso'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy 
    @employer.destroy
    redirect_to root_path
  end
  
  private

  def set_employer
    @employer = Employer.find(params[:id])
  end
  
  def employer_params 
    params.require(:employer).permit(%i[ company_name email location ])
  end
end
