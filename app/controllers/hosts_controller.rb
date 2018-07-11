class HostsController < ApplicationController
  before_action :set_host, only: [:show, :edit, :update, :destroy]

  # GET /hosts
  # GET /hosts.json
  def index
    @hosts = Host.all
    render json: @hosts
  end

  def create
    @host = Host.new(host_params)

    if @host.save
      head(200)
    else
      head(400)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_host
      @host = Host.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def host_params
      params.require(:host).permit(:first_name, :last_name)
    end
end
