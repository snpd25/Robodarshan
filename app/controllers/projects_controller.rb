class ProjectsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy, :edit]

	def create
		@project = current_user.projects.build(project_params)
    if @project.save
      flash[:success] = "Project created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
	end

	def destroy
	end

	def edit
	end

	private

    def project_params
      params.require(:project).permit(:content)
    end
end
