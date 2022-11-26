class RepeatersController < ApplicationController
  before_action :set_repeater, only: %i[show edit update destroy]

  # GET /repeaters
  def index
    # @q = params[:q]&.to_unsafe_h || {}
    # @q = @q.slice(:band_in, :fm_eq, :dstar_eq, :fusion_eq, :dmr_eq, :nxdn_eq, :l)
    # # @q[:l] ||= {d: 5}
    # @repeaters = Repeater.ransack(@q).result(distinct: true).order(:call_sign)

    @search = RepeaterSearch.new
    @repeaters = []
  end

  # GET /repeaters/1
  def show
  end

  # GET /repeaters/new
  def new
    @repeater = Repeater.new
  end

  # GET /repeaters/1/edit
  def edit
  end

  # POST /repeaters
  def create
    @repeater = Repeater.new(repeater_params)

    if @repeater.save
      redirect_to @repeater, notice: "Repeater was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /repeaters/1
  def update
    if @repeater.update(repeater_params)
      redirect_to @repeater, notice: "Repeater was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /repeaters/1
  def destroy
    @repeater.destroy
    redirect_to repeaters_url, notice: "Repeater was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_repeater
    @repeater = Repeater.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def repeater_params
    params.fetch(:repeater, {})
  end
end
