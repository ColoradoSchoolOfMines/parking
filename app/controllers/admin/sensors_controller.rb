class Admin::SensorsController < ApplicationController
  # GET /admin/sensors
  # GET /admin/sensors.json
  def index
    @admin_sensors = Admin::Sensor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_sensors }
    end
  end

  # GET /admin/sensors/1
  # GET /admin/sensors/1.json
  def show
    @admin_sensor = Admin::Sensor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_sensor }
    end
  end

  # GET /admin/sensors/new
  # GET /admin/sensors/new.json
  def new
    @admin_sensor = Admin::Sensor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_sensor }
    end
  end

  # GET /admin/sensors/1/edit
  def edit
    @admin_sensor = Admin::Sensor.find(params[:id])
  end

  # POST /admin/sensors
  # POST /admin/sensors.json
  def create
    @admin_sensor = Admin::Sensor.new(params[:admin_sensor])

    respond_to do |format|
      if @admin_sensor.save
        format.html { redirect_to @admin_sensor, notice: 'Sensor was successfully created.' }
        format.json { render json: @admin_sensor, status: :created, location: @admin_sensor }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_sensor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/sensors/1
  # PUT /admin/sensors/1.json
  def update
    @admin_sensor = Admin::Sensor.find(params[:id])

    respond_to do |format|
      if @admin_sensor.update_attributes(params[:admin_sensor])
        format.html { redirect_to @admin_sensor, notice: 'Sensor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_sensor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/sensors/1
  # DELETE /admin/sensors/1.json
  def destroy
    @admin_sensor = Admin::Sensor.find(params[:id])
    @admin_sensor.destroy

    respond_to do |format|
      format.html { redirect_to admin_sensors_url }
      format.json { head :no_content }
    end
  end
end
