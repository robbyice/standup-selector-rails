class HostsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_host, only: [:show, :edit, :update, :destroy]

  # GET /hosts
  # GET /hosts.json
  def index
    @hosts = Host.all
    render json: @hosts
  end

  def create
    @host = @host.nil? ? Host.new(host_params) : @host

        if @host.save
      head(200)
    else
      head(400)
    end
  end

  def update
    # if @host.nil?
    #   head(404)
    # end

    @host.update(host_params)
    head(200)
  end

  def show
    render json: @host
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_host
      @host = Host.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def host_params
      params.require(:first_name)
      params.require(:last_name)

      params.permit(:first_name, :last_name)
    end
end
