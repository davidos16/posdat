class WidgetsController < ApplicationController
  before_action :set_widget, except: %i[ new create index ]
  before_action :authenticate_user!, except: [:widget_show]
  before_action :load_user 
  protect_from_forgery except: [:widget_show]
  

  # GET /widgets or /widgets.json
  def index
    @widgets = @user.widgets.all
  end

  # GET /widgets/1 or /widgets/1.json
  def show
  end
  
  def widget_show
  end

  # GET /widgets/new
  def new
    @widget = Widget.new
  end

  # GET /widgets/1/edit
  def edit
  end

  # POST /widgets or /widgets.json
  def create
    @widget = current_user.widgets.new(widget_params)
    respond_to do |format|
      if @widget.save
        format.html { redirect_to widget_url(@widget), notice: "Widget was successfully created." }
        format.json { render :show, status: :created, location: @widget }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @widget.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /widgets/1 or /widgets/1.json
  def update
    respond_to do |format|
      if @widget.update(widget_params)
        format.html { redirect_to widget_url(@widget), notice: "Widget was successfully updated." }
        format.json { render :show, status: :ok, location: @widget }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @widget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /widgets/1 or /widgets/1.json
  def destroy
    @widget.destroy

    respond_to do |format|
      format.html { redirect_to widgets_url, notice: "Widget was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  
    def load_user
      @user = current_user
    end
  
    # Use callbacks to share common setup or constraints between actions.
    def set_widget
      @widget = Widget.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def widget_params
        params.require(:widget).permit(:name, :count_down, :message, :button, :widget_type, :design, :expire, :cookie_track, :user_id)
    end
end
