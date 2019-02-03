class ProjectsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy, :edit]
	before_action :correct_user, only: [:destroy, :edit]

	def new
		@project = Project.new
	end

	def create
		@project = current_user.projects.build(project_params)
    if @project.save
      flash[:success] = "Project created!"
      redirect_to root_url
    else
    	@feed_items = []
      render '/projects/new'
    end
	end

	def destroy 
		@project.destroy
		flash[:success] = "Project deleted"
		redirect_to request.referrer || root_url
	end

	def edit
		@project = Project.find(params[:id])
	end

	def update
		@project = Project.find(params[:id])
		@project.update(project_params)
		redirect_to home_path
	end

	private

    def project_params
      params.require(:project).permit(:title, :content, :send_for_approval, :approved, pictures: [])
    end

    def correct_user
    	@project = current_user.projects.find_by(id: params[:id])
    	redirect_to root_url if @project.nil?
    end
end
