class SlotsController < ApplicationController
  def index
    @slots = Slot.page(params[:page]).per(10)

    render("slots/index.html.erb")
  end

  def show
    @slot = Slot.find(params[:id])

    render("slots/show.html.erb")
  end

  def new
    @slot = Slot.new

    render("slots/new.html.erb")
  end

  def create
    @slot = Slot.new

    @slot.schedule_id = params[:schedule_id]
    @slot.course_id = params[:course_id]
    @slot.year = params[:year]
    @slot.quarter = params[:quarter]
    @slot.completed = params[:completed]
    @slot.grade = params[:grade]

    save_status = @slot.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/slots/new", "/create_slot"
        redirect_to("/slots")
      else
        redirect_back(:fallback_location => "/", :notice => "Slot created successfully.")
      end
    else
      render("slots/new.html.erb")
    end
  end

  def edit
    @slot = Slot.find(params[:id])

    render("slots/edit.html.erb")
  end

  def update
    @slot = Slot.find(params[:id])

    @slot.schedule_id = params[:schedule_id]
    @slot.course_id = params[:course_id]
    @slot.year = params[:year]
    @slot.quarter = params[:quarter]
    @slot.completed = params[:completed]
    @slot.grade = params[:grade]

    save_status = @slot.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/slots/#{@slot.id}/edit", "/update_slot"
        redirect_to("/slots/#{@slot.id}", :notice => "Slot updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Slot updated successfully.")
      end
    else
      render("slots/edit.html.erb")
    end
  end

  def destroy
    @slot = Slot.find(params[:id])

    @slot.destroy

    if URI(request.referer).path == "/slots/#{@slot.id}"
      redirect_to("/", :notice => "Slot deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Slot deleted.")
    end
  end
end
