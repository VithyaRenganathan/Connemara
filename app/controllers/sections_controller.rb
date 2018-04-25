class SectionsController < ApplicationController
  before_action :set_book, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :set_chapter, only: [:index, :show, :new, :edit, :create, :update, :destroy]
  before_action :set_section, only: [:show, :edit, :update, :destroy]

  # GET /sections
  # GET /sections.json
  def index
    #render :text => Chapter.find(@chapter.id).sections.count
    @sections = Section.where(:chapter_id => @chapter.id)
  end

  # GET /sections/1
  # GET /sections/1.json
  def show
  end

  # GET /sections/new
  def new
    @section = Section.new
  end

  # GET /sections/1/edit
  def edit
  end

  # POST /sections
  # POST /sections.json
  def create
    @section = Section.new(section_params)
    @section.chapter = Chapter.find(@chapter.id)

    respond_to do |format|
      if @section.save
        format.html { redirect_to book_chapter_sections_path(@book, @chapter), notice: 'Section was successfully created.' }
        format.json { render :show, status: :created, location: @section }
      else
        format.html { render :new }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sections/1
  # PATCH/PUT /sections/1.json
  def update
    respond_to do |format|
      if @section.update(section_params)
        format.html { redirect_to book_chapter_section_path(@book, @chapter, @section), notice: 'Section was successfully updated.' }
        format.json { render :show, status: :ok, location: @section }
      else
        format.html { render :edit }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sections/1
  # DELETE /sections/1.json
  def destroy
    @section.destroy
    respond_to do |format|
      format.html { redirect_to book_chapter_sections_path(@book, @chapter), notice: 'Section was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_book
      @book = Book.find(params[:book_id])
    end
    def set_chapter
      @chapter = Chapter.find(params[:chapter_id])
    end
    def set_section
      @section = Section.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def section_params
      params.require(:section).permit(:chapter_id, :title)
    end
end
