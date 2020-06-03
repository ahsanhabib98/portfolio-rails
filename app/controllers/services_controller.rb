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
end
