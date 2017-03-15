class SchedulesController < ApplicationController
  before_action :current_user_must_be_schedule_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_schedule_user
    schedule = Schedule.find(params[:id])

    unless current_user == schedule.student
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = Schedule.ransack(params[:q])
    @schedules = @q.result(:distinct => true).includes(:student, :slots, :courses).page(params[:page]).per(10)

    render("schedules/index.html.erb")
  end

  def show
    @slot = Slot.new
    @schedule = Schedule.find(params[:id])

    render("schedules/show.html.erb")
  end

  def new
    @schedule = Schedule.new
    @array = [1,2,3,4]
    render("schedules/new.html.erb")
  end

  def create
    @schedule = Schedule.new
    @schedule.user_id = params[:user_id]

    save_status = @schedule.save

    quarters = ["f", "w", "s"]
    @y = 1
    while @y < 5
      @q = 0
      while @q < 3
        @s = 1
        while @s < 5
          @d = @y.to_s << quarters[@q] << @s.to_s << "d"
          @c = @y.to_s << quarters[@q] << @s.to_s << "c"
          if params[@d].present? && params[@c].present?
            @slot = Slot.new
            @slot.year = params[:year]
            @slot.quarter = params[:quarter]
            @slot.schedule_id = @schedule.id
            @slot.course = Course.find_by({:department => params[@d], :dept_code => params[@c]})
            if @slot.course
              @slot.save
            end
          end
          @s += 1
        end
        @q += 1
      end
      @y += 1
    end


    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/schedules/new", "/create_schedule"
        redirect_to("/schedules")
      else
        redirect_back(:fallback_location => "/", :notice => "Schedule created successfully.")
      end
    else
      render("schedules/new.html.erb")
    end
  end

  def edit
    @schedule = Schedule.find(params[:id])

    render("schedules/edit.html.erb")
  end

  def update
    @schedule = Schedule.find(params[:id])

    save_status = @schedule.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/schedules/#{@schedule.id}/edit", "/update_schedule"
        redirect_to("/schedules/#{@schedule.id}", :notice => "Schedule updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Schedule updated successfully.")
      end
    else
      render("schedules/edit.html.erb")
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])

    @schedule.destroy

    if URI(request.referer).path == "/schedules/#{@schedule.id}"
      redirect_to("/", :notice => "Schedule deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Schedule deleted.")
    end
  end
end
