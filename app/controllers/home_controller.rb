class HomeController < ApplicationController


  def index
    @home_rdf     = SITE + '/index.rdf'
    @home_html    = SITE + '/index.html'
    @site_title_rdf    = SITE_NAME + " RDF Data"
    @site_title_html   = SITE_NAME
    @site_description_rdf   = "TaxonConcept Knowledge Base Homepage RDF"
    @site_description_html  = "TaxonConcept Knowledge Base Homepage HTML"

    respond_to do |format|
      format.html # index.html.erb
      #format.xml  { render :xml => @ses }
      format.rdf  {render :template => 'home/index.rdf'}
    end
  end

  def sitemap
    @ses = Se.all
    @ses_url_prefix    = SITE + '/ses/' 
    @dataset_label     = SITE_NAME + 'RDF Data'
    @dataset_uri       = SITE + '/index.rdf'
    @linkeddata_prefix = SITE + '/'
    @sample_uri        = SITE + '/ses/' + 'iuCXz.rdf'
 
    respond_to do |format|
      format.xml  {render :template => 'home/sitemap.xml'}
    end
  end

end
