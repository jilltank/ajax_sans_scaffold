class TasksController < ApplicationController


	def new
		@task = Task.new
	end

	def create
		@task = Task.create(task_params)
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
