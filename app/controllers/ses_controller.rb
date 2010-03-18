class SesController < ApplicationController
  # GET /ses
  # GET /ses.xml
  def index
    @ses = Se.all
    @ses_rdf    = SITE + '/ses/index.rdf'
    @ses_html   = SITE + '/ses/index.html'
    @ses_prefix = SITE + '/ses/'
    @time_now   = Time.now.strftime('%Y-%m-%dT%H:%M:%S%z')
    
    respond_to do |format|
      format.html # index.html.erb
      #format.xml  { render :xml => @ses }
      format.rdf  {render :template => 'ses/index.rdf'}
    end
  end

  # GET /ses/1
  # GET /ses/1.xml
  def show
#   begin
    @se = Se.find_by_se_uid(params[:id])
    if (@se.nil?)
      respond_to do |format|
        format.html {render :template => 'ses/no_se.html'}
        format.rdf  {render :template => 'ses/no_se.rdf'}
      end #do
    else
      se_epithet = @se.se_epithet
      se_uid     = @se.se_uid
      se_uuid    = @se.se_uuid
      @se_name   = scientificname(@se.se_genus,@se.se_epithet,@se.se_author_year)

    # create GNI UUIDs for synonyms
     @se_name_uuid              =  UUID.create_v5((@se.se_genus + " " + @se.se_epithet),GNA_NAMESPACE).guid
     if !@se.se_synonym_one.nil? then @se_synonym_one_uuid = UUID.create_v5(@se.se_synonym_one,GNA_NAMESPACE).guid else @se_synonym_one_uuid = nil end
  #  @se_synonym_one_uuid       =  UUID.create_v5(@se.se_synonym_one,GNA_NAMESPACE).guid
  #  @se_synonym_two_uuid       =  UUID.create_v5(@se.se_synonym_two,GNA_NAMESPACE).guid
  #  @se_synonym_three_uuid     =  UUID.create_v5(@se.se_synonym_three,GNA_NAMESPACE).guid
  #  @se_synonym_four_uuid      =  UUID.create_v5(@se.se_synonym_four,GNA_NAMESPACE).guid
  #  @se_synonym_five_uuid      =  UUID.create_v5(@se.se_synonym_five,GNA_NAMESPACE).guid
  #  @se_basionym_uuid          =  UUID.create_v5(@se.se_basionym,GNA_NAMESPACE).guid
  #
      @se_concept_name       =  concept_name(@se.se_genus,@se.se_epithet,@se.se_uid)
      @se_concept_id         =  concept_id(@se.se_uuid)
      @se_ncbi_url           =  ncbi_url(@se.se_ncbi)
      @se_bio2rdf            =  bio2rdf_url(@se.se_ncbi)
      @se_uniprot            =  uniprot_url(@se.se_ncbi)
      @se_ubio_lsid          =  ubio_lsid(@se.se_ubio)
      @se_itis_url           =  itis_url(@se.se_itis)
      @se_gbif_url           =  gbif_url(@se.se_gbif)
      @se_eol_url            =  eol_url(@se.se_eol)
      @se_bold_url           =  bold_url(@se.se_bold)
      @se_col_url            =  col_url(@se.se_col)
      @se_col_id_url         =  col_id_url(@se.se_col_id)
      @se_geospecies_url     =  geospecies_url(@se.se_uid)
      @se_dbpedia_url        =  dbpedia_url(@se.se_dbpedia)
      @se_dbpedia_resource   =  dbpedia_resource(@se.se_dbpedia)
      @se_freebase_url       =  freebase_url(@se.se_freebase)
      @se_opencyc_url        =  opencyc_url(@se.se_opencyc)
      @se_umbel_url          =  umbel_url(@se.se_umbel)
      @se_lc_url             =  lc_url(@se.se_lc)
      @se_bbc_url            =  bbc_url(@se.se_bbc)
      @se_wikispecies        =  wikispecies_url(@se.se_wikispecies)
      @se_wikipedia          =  wikipedia_url(@se.se_wikipedia)
      @se_prefix             =  'http://lod.taxonconcept.org/ses/'     +  @se.se_uid
      @se_uri                =  'http://lod.taxonconcept.org/ses/'     +  @se.se_uid  + '#species'
      @se_url                =  'http://lod.taxonconcept.org/ses/'     +  @se.se_uid + '.html'
      @se_rdf                =  'http://lod.taxonconcept.org/ses/'     +  @se.se_uid + ".rdf"

      if params[:format]
       # either the html or rdf representation has been asked for directly, so provide it
        respond_to do |format|
          format.html {render :template => 'ses/show.html'}
          format.rdf  {render :template => 'ses/show.rdf'} 
          # an alternative here is to call your own method to output the required RDF as a string
          # format.rdf {render  :text => my_method_to_make_rdf }
        end #do
      else
        # no format (file extension) specified, so the resource identifier has been requested. respond_to will look at HTTP Accept header
        # and do the appropriate redirect
        respond_to do |format|
          format.html {redirect_to :status=>303, :controller=>'ses', :action=>'show', :id=>params[:id], :format=>'html'}
          format.rdf  {redirect_to :status=>303, :controller=>'ses', :action=>'show', :id=>params[:id], :format=>'rdf'}   
        end #do
      end #if
    end #if se empty
  end

  # GET /ses/new
  # GET /ses/new.xml
 # def new
 #   @se = Se.new
#
 #   respond_to do |format|
#      format.html # new.html.erb
#      format.xml  { render :xml => @se }
#    end
#  end

  # GET /ses/1/edit
#  def edit
#    @se = Se.find(params[:id])
#  end

  # POST /ses
  # POST /ses.xml
#  def create
#    @se = Se.new(params[:se])
#
#    respond_to do |format|
#      if @se.save
#       flash[:notice] = 'Se was successfully created.'
#        format.html { redirect_to(@se) }
#        format.xml  { render :xml => @se, :status => :created, :location => @se }
#      else
#        format.html { render :action => "new" }
#        format.xml  { render :xml => @se.errors, :status => :unprocessable_entity }
#      end
#    end
#  end

  # PUT /ses/1
  # PUT /ses/1.xml
#  def update
#    @se = Se.find(params[:id])
#
#    respond_to do |format|
#      if @se.update_attributes(params[:se])
#        flash[:notice] = 'Se was successfully updated.'
#        format.html { redirect_to(@se) }
#        format.xml  { head :ok }
#     else
#        format.html { render :action => "edit" }
#        format.xml  { render :xml => @se.errors, :status => :unprocessable_entity }
#      end
#    end
#  end

  # DELETE /ses/1
  # DELETE /ses/1.xml
#  def destroy
#    @se = Se.find(params[:id])
#    @se.destroy

#    respond_to do |format|
#      format.html { redirect_to(ses_url) }
#      format.xml  { head :ok }
#    end
#  end
end
