class ServicesController < ApplicationController
  before_action :set_service_item, only: [:edit, :show, :update, :destroy]
  layout "service"

  def index
    @service_items = Service.all
  end

  def new
    @service_item = Service.new
    3.times { @service_item.technologies.build }
  end

  def create
    @service_item = Service.new(service_params)

    respond_to do |format|
      if @service_item.save
        format.html { redirect_to services_path, notice: 'Service item was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @service_item.update(service_params)
        format.html { redirect_to services_path, notice: 'Service item was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
  end

  def destroy
    @service_item.destroy
    respond_to do |format|
      format.html { redirect_to services_url, notice: 'Service item was successfully destroyed.' }
    end
  end

  private

    def service_params
      params.require(:service).permit(:title,
                                      :subtitle,
                                      :body,
                                      technologies_attributes: [:name]
                                    )
    end

    def set_service_item
      @service_item = Service.find(params[:id])
    end
end
