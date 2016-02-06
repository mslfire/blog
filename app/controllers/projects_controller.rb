class ProjectsController < ApplicationController
	before_action :find_project, only: [:show, :edit, :update, :destroy]

	def index
		@projects = Project.all.order('created_at DESC').paginate(page: params[:page], per_page: 5)
	end

	def new
		@project = Project.new
	end

	def show
	end

	def create
		@project = Project.new(project_params)

		if @project.save
			redirect_to @project, notice: "Nice - project post! Nice to see you are getting stuff done!"
		else
			render 'new', notice: "Well that did not save!"
		end
	end

	def edit
	end

	def update

		if @project.update project_params
			redirect_to @project, notice: "Updated and Saved - Cool"
		else
			render 'edit'
		end
	end

	def destroy

		@project.destroy

		redirect_to projects_path
	end

	private

	def project_params
		params.require(:project).permit(:title, :description, :link, :slug)
	end

	def find_project
		@project = Project.friendly.find(params[:id])
	end

end