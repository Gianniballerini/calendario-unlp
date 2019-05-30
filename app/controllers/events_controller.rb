class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
    @subject = Subject.find(params[:subject_id])
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @subject = Subject.find(params[:subject][:id])
    @event.subject_id= @subject.id
    @event.user_id=current_user.id
    puts @event.inspect
    if @event.save
      redirect_to root_path, notice: 'Event was successfully created.'
    else
      # render plain: @event.inspect
      render :new
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    redirect_to proc {root_path + "#userEvents"}, notice: 'Event was successfully deleted.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    # params.fetch(:event, {})
    params.require(:event).permit(:name, :description, :start_time, :end_time, :date, :start_date, :end_date, :recurrent)
  end
end
