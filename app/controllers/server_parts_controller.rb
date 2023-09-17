class ServerPartsController < ApplicationController
  before_action :set_server_part, only: %i[ show edit update destroy ]

  # GET /server_parts or /server_parts.json
  def index
    @server_parts = ServerPart.all
  end

  # GET /server_parts/1 or /server_parts/1.json
  def show
  end

  # GET /server_parts/new
  def new
    @server_part = ServerPart.new
  end

  # GET /server_parts/1/edit
  def edit
  end

  # POST /server_parts or /server_parts.json
  def create
    @server_part = ServerPart.new(server_part_params)

    respond_to do |format|
      if @server_part.save
        format.html { redirect_to server_part_url(@server_part), notice: "Server part was successfully created." }
        format.json { render :show, status: :created, location: @server_part }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @server_part.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /server_parts/1 or /server_parts/1.json
  def update
    respond_to do |format|
      if @server_part.update(server_part_params)
        format.html { redirect_to server_part_url(@server_part), notice: "Server part was successfully updated." }
        format.json { render :show, status: :ok, location: @server_part }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @server_part.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /server_parts/1 or /server_parts/1.json
  def destroy
    @server_part.destroy

    respond_to do |format|
      format.html { redirect_to server_parts_url, notice: "Server part was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_server_part
      @server_part = ServerPart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def server_part_params
      params.require(:server_part).permit(:name)
    end
end
