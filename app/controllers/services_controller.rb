class ServicesController < ApplicationController
  def index
    @service_items = Service.all
  end

  def new
    @service_item = Service.new
  end

  def create
    @service_item = Service.new(params.require(:service).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @service_item.save
        format.html { redirect_to services_path, notice: 'Service item was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @service_item = Service.find(params[:id])
  end

  def update
    @service_item = Service.find(params[:id])

    respond_to do |format|
      if @service_item.update(params.require(:service).permit(:title, :subtitle, :body))
        format.html { redirect_to services_path, notice: 'Service item was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @service_item = Service.find(params[:id])
  end

end
