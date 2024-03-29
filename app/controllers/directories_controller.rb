class DirectoriesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show, :newest, :popular]
  
  # GET /directories
  # GET /directories.json
  def index
    @page_title = "All Directories"
    @directories = Directory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @directories }
    end
  end
  
  def newest
    @page_title = "Newest Directories"
    @directories = Directory.all(:joins => :content, :order => "contents.created_at DESC")

    respond_to do |format|
      format.html {render "index" }
      format.json { render json: @directories }
    end
  end
  
  def popular
    @page_title = "Popular Directories"
    @directories = Directory.find_by_sql "SELECT * FROM popular_directories();"

    respond_to do |format|
      format.html {render "index" }
      format.json { render json: @directories }
    end
  end

  def my
    @page_title = "My Directories"
    @directories = Directory.all(:joins => :content, conditions: ["contents.user_id = ?", current_user.id])

    respond_to do |format|
      format.html {render "index" }
      format.json { render json: @directories }
    end
  end

  # GET /directories/1
  # GET /directories/1.json
  def show
    @directory = Directory.find(params[:id])
    @entries = Entry.joins(:content => :parent_mappings).all(conditions: ["parent_id = ?", @directory.content.id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @directory }
    end
  end

  # GET /directories/new
  # GET /directories/new.json
  def new
    @directory = Directory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @directory }
    end
  end

  # GET /directories/1/edit
  def edit
    @directory = Directory.find(params[:id])
  end

  # POST /directories
  # POST /directories.json
  def create
    @directory = Directory.new(params[:directory])

    respond_to do |format|
      if @directory.valid?
        content = get_content(@directory)
        @directory.content = content
        
        format.html { redirect_to @directory, notice: 'Directory was successfully created.' }
        format.json { render json: @directory, status: :created, location: @directory }
      else
        format.html { render action: "new" }
        format.json { render json: @directory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /directories/1
  # PUT /directories/1.json
  def update
    @directory = Directory.find(params[:id])

    respond_to do |format|
      if @directory.update_attributes(params[:directory])
        format.html { redirect_to @directory, notice: 'Directory was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @directory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /directories/1
  # DELETE /directories/1.json
  def destroy
    @directory = Directory.find(params[:id])
    @directory.destroy

    respond_to do |format|
      format.html { redirect_to directories_url }
      format.json { head :no_content }
    end
  end
end
