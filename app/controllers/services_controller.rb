class ServicesController < ApplicationController
  def index
    @service_items = Service.all
  end
end
