class CoursesController < ApplicationController
  def index
    @q = Course.ransack(params[:q])
    @courses = @q.result(:distinct => true).includes(:slots, :schedules).page(params[:page]).per(10)

    render("courses/index.html.erb")
  end

  def show
    @slot = Slot.new
    @course = Course.find(params[:id])

    render("courses/show.html.erb")
  end

  def new
    @course = Course.new

    render("courses/new.html.erb")
  end

  def create
    @course = Course.new

    @course.name = params[:name]
    @course.dept_code = params[:dept_code]
    @course.department = params[:department]

    save_status = @course.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/courses/new", "/create_course"
        redirect_to("/courses")
      else
        redirect_back(:fallback_location => "/", :notice => "Course created successfully.")
      end
    else
      render("courses/new.html.erb")
    end
  end

  def edit
    @course = Course.find(params[:id])

    render("courses/edit.html.erb")
  end

  def update
    @course = Course.find(params[:id])

    @course.name = params[:name]
    @course.dept_code = params[:dept_code]
    @course.department = params[:department]

    save_status = @course.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/courses/#{@course.id}/edit", "/update_course"
        redirect_to("/courses/#{@course.id}", :notice => "Course updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Course updated successfully.")
      end
    else
      render("courses/edit.html.erb")
    end
  end

  def destroy
    @course = Course.find(params[:id])

    @course.destroy

    if URI(request.referer).path == "/courses/#{@course.id}"
      redirect_to("/", :notice => "Course deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Course deleted.")
    end
  end
end
