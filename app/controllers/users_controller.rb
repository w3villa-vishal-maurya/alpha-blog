class UsersController < ApplicationController
  # before_action :set_user, only: [:edit, :show]
  before_action :set_ransack, only: %i[ home new show edit update destroy ]

  def new
    @user = User.new
  end

  def home
    # @articles = Article.all
  end

  def index
    @user = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_index_path
    else
      render :new
    end
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
    # @student = Student.find(params[:id])
  end

  # def update
  #     if @user.update(student_params)
  #         redirect_to student_show_path
  #     else
  #         # debugger
  #         # puts(@student.errors.full_messages)
  #         flash[:notice] = @student.errors.full_messages
  #         redirect_to student_edit_path
  #         # render plain: "student not found!"
  #     end
  # end

  # def destroy
  #     @student.destroy
  #     redirect_to student_index_path
  # end

  # def student_courses
  #     @all_courses = @student.courses
  # end

  # def student_delete_course
  #     @student = Student.find(params[:student_id])
  #     @course = Course.find(params[:course_id])
  #     @student.courses.delete(@course.id)

  #     redirect_to student_courses_path
  # end

  # def filter_course(req_course = "Python")
  #     @course = Course.all
  #     @newCourse = Array.new();
  #     @course.each do |course|
  #         if course.courseTitle.downcase.include? req_course.downcase
  #             @newCourse.push(course);
  #         end
  #     end

  #     return @newCourse;
  # end

  private

  def user_params
    params.require(:user).permit(:username)
  end

  # def set_user
  #   @user = User.find(params[:id])
  # end

  def set_ransack
    @q = Article.ransack(params[:q])
    @articles = @q.result(distnict: true)
    # @articles = Article.all
  end
end
