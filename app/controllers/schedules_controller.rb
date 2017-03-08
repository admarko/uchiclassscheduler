class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all

    render("schedules/index.html.erb")
  end

  def show
    @schedule = Schedule.find(params[:id])

    render("schedules/show.html.erb")
  end

  def new
    @schedule = Schedule.new

    render("schedules/new.html.erb")
  end

  def create
    @schedule = Schedule.new

    @schedule.user_id = params[:user_id]

    save_status = @schedule.save

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
