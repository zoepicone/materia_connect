class ModsController < ApplicationController
  def index
    @mods = Mod.order(created_at: :desc)
    # @pagy, @mods = pagy_countless(Mod.order(created_at: :desc), items: 16)
    #
    # respond_to do |format|
    #   format.html # GET
    #   format.turbo_stream # POST
    # end
  end

  def show
    @mod = Mod.find(params[:id])
  end

  def new
    @mod = Mod.new
  end

  def create
    fix_checkbox_params
    @mod = Mod.new(mod_params)

    if @mod.save
      redirect_to @mod
    else
      render :new, status: :unprocessable_entity, error: @mod.errors
    end
  end

  def edit
    @mod = Mod.find(params[:id])
  end

  def update
    @mod = Mod.find(params[:id])

    if @mod.update(mod_params)
      redirect_to @mod
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @mod = Mod.find(params[:id])
    @mod.destroy

    redirect_to mods_path, status: :see_other
  end

  def with_tag
    @tag = params[:tag]
    # @pagy, @mods = pagy_countless(tagged_with(@tag), items: 16)
    @mods = tagged_with(@tag).order(created_at: :desc)
    render :index
  end

  private
  def fix_checkbox_params
    %i[nsfw unlisted premium].each do |param|
      params[:mod][param] = false unless params[:mod][param]
    end
  end

  def mod_params
    params.require(:mod).permit(:title,
                                :description,
                                :tag_string,
                                :download_url,
                                :nsfw,
                                :user_id,
                                :unlisted,
                                :premium,
                                images: [])
  end

  def tagged_with(tag)
    Mod.where("'{#{tag}}' <@ tags")
  end
end
