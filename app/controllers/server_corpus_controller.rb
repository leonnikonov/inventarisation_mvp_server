class ServerCorpusController < ApplicationController
  require "rqrcode"
  before_action :set_server_corpu, only: %i[ show edit update destroy bind_part ]

  # GET /server_corpus or /server_corpus.json
  def index
    @server_corpus = ServerCorpu.all
  end

  # GET /server_corpus/1 or /server_corpus/1.json
  def show
    respond_to do |format|
      format.html
      format.png { send_data RQRCode::QRCode.new(@server_corpu.id.to_s).as_png(
        bit_depth: 1,
        border_modules: 4,
        color_mode: ChunkyPNG::COLOR_GRAYSCALE,
        color: "black",
        file: nil,
        fill: "white",
        module_px_size: 6,
        resize_exactly_to: false,
        resize_gte_to: false,
        size: 120
      ).to_s }
    end
  end

  # GET /server_corpus/new
  def new
    @server_corpu = ServerCorpu.new
  end

  # GET /server_corpus/1/edit
  def edit
  end

  # POST /server_corpus or /server_corpus.json
  def create
    @server_corpu = ServerCorpu.new(server_corpu_params)

    respond_to do |format|
      if @server_corpu.save
        format.html { redirect_to server_corpu_url(@server_corpu), notice: "Server corpu was successfully created." }
        format.json { render :show, status: :created, location: @server_corpu }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @server_corpu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /server_corpus/1 or /server_corpus/1.json
  def update
    respond_to do |format|
      if @server_corpu.update(server_corpu_params)
        format.html { redirect_to server_corpu_url(@server_corpu), notice: "Server corpu was successfully updated." }
        format.json { render :show, status: :ok, location: @server_corpu }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @server_corpu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /server_corpus/1 or /server_corpus/1.json
  def destroy
    @server_corpu.destroy

    respond_to do |format|
      format.html { redirect_to server_corpus_url, notice: "Server corpu was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def bind_part
    @server_corpu.bind_part(params[:part_id])
    render json: { status: :binded }, status: :ok
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_server_corpu
    @server_corpu = ServerCorpu.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def server_corpu_params
    params.require(:server_corpu).permit(:name)
  end
end
