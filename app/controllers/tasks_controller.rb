class TasksController < ApplicationController
before_action :all_tasks, only: [:index, :create, :update, :destroy]
before_action :set_task, only: [:show, :edit, :update, :destroy]

	def new
		@task = Task.new
	end

	def create
		@task = Task.create(task_params)
		if @task.save
   		redirect_to :root
   	end
	end

	def update
		@task.update(task_params)
	end

	def destroy
		@task = Task.destroy
	end

	private

		def all_tasks
			@tasks = Task.all
		end

		def set_task
			@task = Task.find(params[:id])
		end

		def task_params
			params.require(:task).permit(:description, :deadline)
		end

end
