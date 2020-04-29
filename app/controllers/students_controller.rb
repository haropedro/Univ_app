class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end


  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:success] = "You have successfully signed up."
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @student.update(student_params)
      flash[:success] = "Your account was updated successfully"
      redirect_to root_path
    else
      render 'edit'
    end
  end






  private

  def student_params
    params.require(:student).permit(:name, :email)
  end
end
