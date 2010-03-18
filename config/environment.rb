# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  # Settings in config/environments/* take precedence over those specified here.
  # Application configuration should go into files in config/initializers
  # -- all .rb files in that directory are automatically loaded.

  # Add additional load paths for your own custom dirs
  # config.load_paths += %W( #{RAILS_ROOT}/extras )

  # Specify gems that this application depends on and have them installed with rake gems:install
  # config.gem "bj"
  # config.gem "hpricot", :version => '0.6', :source => "http://code.whytheluckystiff.net"
  # config.gem "sqlite3-ruby", :lib => "sqlite3"
  # config.gem "aws-s3", :lib => "aws/s3"

  # Only load the plugins named here, in the order given (default is alphabetical).
  # :all can be used as a placeholder for all plugins not explicitly named
  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

  # Skip frameworks you're not going to use. To use Rails without a database,
  # you must remove the Active Record framework.
  # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]

  # Activate observers that should always be running
  # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

  # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
  # Run "rake -D time" for a list of tasks for finding time zone names.
  config.time_zone = 'UTC'

  # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
  # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}')]
  # config.i18n.default_locale = :de
end
# Constants for RDF Header INFO
PUBLISHER                                            = "TaxonConcept Knowledge Base"
SITE_NAME                                            = "TaxonConcept Knowledge Base"
PUBLISHER_URI                                        = "http://lod.taxonconcept.org/ontology/txn.owl#TaxonConcept_Knowledge_Base_Project"
DATASET_URI                                          = "http://lod.taxonconcept.org/ontology/void#this"
CREATOR1                                             = "Peter J. DeVries"
CREATOR1_URI                                         = "http://lod.taxonconcept.org/ontology/people.owl#Peter_J_DeVries"
CREATOR2                                             = "Dimtry Mozzherin"
CREATOR2_URI                                         = "http://lod.taxonconcept.org/ontology/people.owl#Dimtry_Mozzherin"
LICENSE_URI                                          = "http://creativecommons.org/publicdomain/"
ATTRIBUTION_URL                                      = "http://lod.taxonconcept.org"
ATTRIBUTION_NAME                                     = 'Peter J. DeVries'
SITE                                                 = "http://lod.taxonconcept.org"
WEBSITE_DESCRIPTION                                  = "The GeoSpecies Knowledge Base Occurrence records site provides occurrence records for species following Linked Data standards"
SPECIES_ID_PREFIX                                    = "urn:lsid:globalnames.org:taxon:"
RDF_DUMP_URL                                         = SITE + "/taxonconcept.rdf"


# Constants for ONTOLOGY's
ONTOLOGY                                             = "http://lod.taxonconcept.org/ontology/txn.owl#"
GNI_ONTOLOGY                                         = "http://www.globalnames.org/ontology/gni.owl#"
GEOSPECIES_ONTOLOGY                                  = "http://rdf.geospecies.org/ont/geospecies#"
BBC_SPECIES_PREFIX                                   = "http://www.bbc.co.uk/nature/species/"
SPECIES_DOCUMENTATION_PREFIX                         = "http://lod.taxonconcept.org/se_owl/"
SEO_ONTOLOGY                                         = "http://www.taxonconcept.org/ont/se_v01/seo.owl#"
SEO_ONTOLOGY_URL                                     = "http://www.taxonconcept.org/ont/se_v01/seo.owl"
GS_ONTOLOGY                                          = "http://rdf.geospecies.org/ont/geospecies#"
GS_ONTOLOGY_URL                                      = "http://rdf.geospecies.org/ont/geospecies.owl"
PHYLO_ONTOLOGY                                       = "http://www.taxonconcept.org/ont/phylo_v01/phylo.owl#"
PHYLO_ONTOLOGY_FUNGI_PREFIX                          = "http://www.taxonconcept.org/ont/phylo_v01/phylo.owl#Kingdom_Fungi"
PHYLO_ONTOLOGY_ANIMALIA_PREFIX                       = "http://www.taxonconcept.org/ont/phylo_v01/phylo.owl#Kingdom_Animalia"
PHYLO_ONTOLOGY_PLANTAE_PREFIX                        = "http://www.taxonconcept.org/ont/phylo_v01/phylo.owl#Kingdom_Plantae"
RDF_ONTOLOGY                                         = "http://www.w3.org/1999/02/22-rdf-syntax-ns#"
RDFS_ONTOLOGY                                        = "http://www.w3.org/2000/01/rdf-schema#"
OWL_ONTOLOGY                                         = "http://www.w3.org/2002/07/owl#"
DC_ONTOLOGY                                          = "http://purl.org/dc/elements/1.1/"
DCTERMS_ONTOLOGY                                     = "http://purl.org/dc/terms/"
TIME_ONTOLOGY                                        = "http://www.w3.org/2006/time#"
DWC_ONTOLOGY                                         = "http://rs.tdwg.org/dwc/terms/"
TDWG_CORE_ONTOLOGY                                   = "http://rs.tdwg.org/ontology/Core"
TDWG_VOC_ONTOLOGY                                    = "http://rs.tdwg.org/ontology/voc/"
GEONAMES_ONTOLOGY                                    = "http://www.geonames.org/ontology#"
GEO_ONTOLOGY                                         = "http://www.w3.org/2003/01/geo/wgs84_pos#"
FOAF_ONTOLOGY                                        = "http://xmlns.com/foaf/0.1/"
BIBO_ONTOLOGY                                        = "http://purl.org/ontology/bibo/"
BIBO_DEGREES_ONTOLOGY                                = "http://purl.org/ontology/bibo/degrees/"
BIBO_STATUS_ONTOLOGY                                 = "http://purl.org/ontology/bibo/status/"
DBPEDIA_OWL                                          = "http://dbpedia.org/ontology/"
DBPEDIA_PROPERTY                                     = "http://dbpedia.org/property/"
SKOS_ONTOLOGY                                        = "http://www.w3.org/2004/02/skos/core#"
UMBEL_ONTOLOGY                                       = "http://umbel.org/umbel#"
UMBEL_SC_ONTOLOGY                                    = "http://umbel.org/umbel/sc/"
UMBEL_AC_ONTOLOGY                                    = "http://umbel.org/umbel/ac/"
UMBEL_NE_ONTOLOGY                                    = "http://umbel.org/umbel/ne/"
DOAP_ONTOLOGY                                        = "http://usefulinc.com/ns/doap#"
BIO2RDF_ONTOLOGY                                     = "http://bio2rdf.org/ns/bio2rdf#" 
UNIPROT_ONTOLOGY                                     = "http://purl.uniprot.org/core/" 
EVENT_ONTOLOGY                                       = "http://purl.org/NET/c4dm/event.owl#"
VANN_ONTOLOGY                                        = "http://purl.org/vocab/vann/"
CTAG_ONTOLOGY                                        = "http://commontag.org/ns#"
V_ONTOLOGY                                           = "http://rdf.data-vocabulary.org/"
CC_ONTOLOGY                                          = "http://creativecommons.org/ns#"
UNIPROT_CORE                                         = "http://purl.uniprot.org/core/"
WGS84_URI                                            = "http://rdf.geospecies.org/ont/geospecies#GeodeticDatum_WGS84"

# Constants for External Links
GNA_RDF_PREFIX                                       = 'http://globalnames.org/name_strings/'
BBC_PREFIX                                           = 'http://www.bbc.co.uk/nature/species/'
BHL_PREFIX                                           = 'http://www.biodiversitylibrary.org/name/'
BIO2RDF_TAXON_URL_PREFIX                             = 'http://bio2rdf.org/taxon:'
BIOLIB_URL_PREFIX                                    = 'http://www.biolib.cz/en/taxon/'
BUGGUIDE_PREFIX                                      = 'http://bugguide.net/node/view/'
CANADIANARACHNOLOGY_PREFIX                           = 'http://www.canadianarachnology.org/data/spiders/'
COL_PREFIX                                           = 'http://www.catalogueoflife.org/browse_taxa.php?selected_taxon='
DBPEDIA_PREFIX                                       = 'http://dbpedia.org/resource/'
EOL_PREFIX                                           = 'http://www.eol.org/pages/'
FLICKRWRAPPR_PREFIX                                  = 'http://www4.wiwiss.fu-berlin.de/flickrwrappr/photos/'
GBIF_PREFIX                                          = 'http://data.gbif.org/species/'
GNI_SEARCH_STRING                                    = 'http://globalnames.org/?search_term=id:'
GS_SPECIES_PREFIX                                    = 'http://species.geospecies.org/ses/'
ITIS_RDF_URL_PREFIX                                  = 'http://www.itis.gov/servlet/SingleRpt/SingleRpt?search_topic=TSN&search_value='
ITIS_URL_PREFIX                                      = 'http://www.itis.gov/servlet/SingleRpt/SingleRpt?search_topic=TSN&amp;search_value='
NCBI_PREFIX                                          = 'http://www.ncbi.nlm.nih.gov/Taxonomy/Browser/wwwtax.cgi?id='
NCBI_SUFFIX                                          = '&lvl=0'
PUBMED_PREFIX                                        = 'http://www.ncbi.nlm.nih.gov/sites/entrez?EntrezSystem2.PEntrez.Pubmed.SearchBar.Term='
UBIO_PREFIX                                          = 'urn:lsid:ubio.org:namebank:'
UBIO_URL_PREFIX                                      = 'http://www.ubio.org/browser/details.php?namebankID='
UNIPROT_TAXON_URL_PREFIX                             = 'http://www.uniprot.org/taxonomy/'
COL_ID_PREFIX                                        = 'http://www.catalogueoflife.org/'
#UNIPROT_TAXON_URL_PREFIX                            = 'http://purl.uniprot.org/taxonomy/' #note change

USDA_PLANTS_PREFIX                                   = 'http://plants.usda.gov/java/profile?symbol='
UW_HERBARIUM_PREFIX_FAMILY                           = 'http://www.botany.wisc.edu/wisflora/scripts/SearchResults.asp?Family='
UW_HERBARIUM_PREFIX_SPECIES                          = 'http://www.botany.wisc.edu/cgi-bin/detail.cgi?SpCode='
UUID_PREFIX                                          = 'urn:uuid:'
ORGNAMES_PREFIX                                      = 'http://www.organismnames.com/lsidmetadata.htm?lsid='
WORDNET_PREFIX                                       = 'http://wordnet.rkbexplorer.com/id/'

# CONSTANTS for TYPES
UNIPROT_KINGDOM_URI                                  = "http://purl.uniprot.org/core/Kingdom"
UNIPROT_PHYLUM_URI                                   = "http://purl.uniprot.org/core/Phylum"
UNIPROT_CLASS_URI                                    = "http://purl.uniprot.org/core/Class"
UNIPROT_ORDER_URI                                    = "http://purl.uniprot.org/core/Order"
UNIPROT_FAMILY_URI                                   = "http://purl.uniprot.org/core/Family"
UNIPROT_SPECIES_URI                                  = "http://purl.uniprot.org/core/Species"
UNIPROT_SUBSPECIES_URI                               = "http://purl.uniprot.org/core/Subspecies"
UMBEL_SPECIES                                        = "http://umbel.org/umbel/sc/BiologicalSpecies"
TAXON_TYPE                                           = "http://rs.tdwg.org/dwc/terms/Taxon"
DCTERMS_INTERACTIVE_RESOURCE                         = "http://purl.org/dc/dcmitype/InteractiveResource"

# Timezone
TIMEZONE                                             = "Central Time (US & Canada)"
START_TIME                                           = Time.now.strftime('%Y-%m-%dT%H:%M:%S%z')
CREATED_TIME                                         = "2010-02-24T12:00:00-0500"

# Constants for SKOS Schemes
TAXON_CONCEPT_SCHEME                                 =  ONTOLOGY + "TaxonConcept_Scheme"
GEOSPECIES_SCHEME                                    =  ONTOLOGY + "GeoSpecies_Scheme"
DBPEDIA_SCHEME                                       =  ONTOLOGY + "DBpedia_Scheme"
FREEBASE_SCHEME                                      =  ONTOLOGY + "Freebase_Scheme"
BIO2RDF_SCHEME                                       =  ONTOLOGY + "Bio2RDF_Scheme"
ITIS_SCHEME                                          =  ONTOLOGY + "ITIS_Scheme"
UBIO_SCHEME                                          =  ONTOLOGY + "UBIO_Scheme"
GNI_SCHEME                                           =  ONTOLOGY + "GNI_Scheme"
GBIF_SCHEME                                          =  ONTOLOGY + "GBIF_Scheme"
BHL_SCHEME                                           =  ONTOLOGY + "BHL_Scheme"


# STATE GEONAME URI's
GEONAMES_AB_URI    =        "http://sws.geonames.org/5883102/"
GEONAMES_BC_URI    =        "http://sws.geonames.org/5909050/"
GEONAMES_MB_URI    =        "http://sws.geonames.org/6065171/"
GEONAMES_NB_URI    =        "http://sws.geonames.org/6087430/"
GEONAMES_NL_URI    =        "http://sws.geonames.org/6354959/"
GEONAMES_NS_URI    =        "http://sws.geonames.org/6091530/"
GEONAMES_NT_URI    =        "http://sws.geonames.org/6091069/"
GEONAMES_NU_URI    =        "http://sws.geonames.org/6091732/"
GEONAMES_ON_URI    =        "http://sws.geonames.org/6093943/"
GEONAMES_PE_URI    =        "http://sws.geonames.org/6113358/"
GEONAMES_QC_URI    =        "http://sws.geonames.org/6115047/"
GEONAMES_SK_URI    =        "http://sws.geonames.org/6141242/"
GEONAMES_YT_URI    =        "http://sws.geonames.org/6185811/"
GEONAMES_AK_URI    =        "http://sws.geonames.org/5879092/"
GEONAMES_AL_URI    =        "http://sws.geonames.org/4829764/"
GEONAMES_AR_URI    =        "http://sws.geonames.org/4099753/"
GEONAMES_AZ_URI    =        "http://sws.geonames.org/5551752/"
GEONAMES_CA_URI    =        "http://sws.geonames.org/5332921/"
GEONAMES_CO_URI    =        "http://sws.geonames.org/5417618/"
GEONAMES_CT_URI    =        "http://sws.geonames.org/4831725/"
GEONAMES_DE_URI    =        "http://sws.geonames.org/4142224/"
GEONAMES_FL_URI    =        "http://sws.geonames.org/4155751/"
GEONAMES_GA_URI    =        "http://sws.geonames.org/4197000/"
GEONAMES_HI_URI    =        "http://sws.geonames.org/5855797/"
GEONAMES_IA_URI    =        "http://sws.geonames.org/4862182/"
GEONAMES_ID_URI    =        "http://sws.geonames.org/5596512/"
GEONAMES_IL_URI    =        "http://sws.geonames.org/4896861/"
GEONAMES_IN_URI    =        "http://sws.geonames.org/4921868/"
GEONAMES_KS_URI    =        "http://sws.geonames.org/4273857/"
GEONAMES_KY_URI    =        "http://sws.geonames.org/6254925/"
GEONAMES_LA_URI    =        "http://sws.geonames.org/4331987/"
GEONAMES_MA_URI    =        "http://sws.geonames.org/6254926/"
GEONAMES_MD_URI    =        "http://sws.geonames.org/4361885/"
GEONAMES_ME_URI    =        "http://sws.geonames.org/4971068/"
GEONAMES_MI_URI    =        "http://sws.geonames.org/5001836/"
GEONAMES_MN_URI    =        "http://sws.geonames.org/5037779/"
GEONAMES_MO_URI    =        "http://sws.geonames.org/4398678/"
GEONAMES_MS_URI    =        "http://sws.geonames.org/4436296/"
GEONAMES_MT_URI    =        "http://sws.geonames.org/5667009/"
GEONAMES_NC_URI    =        "http://sws.geonames.org/4482348/"
GEONAMES_ND_URI    =        "http://sws.geonames.org/5690763/"
GEONAMES_NE_URI    =        "http://sws.geonames.org/5073708/"
GEONAMES_NH_URI    =        "http://sws.geonames.org/5090174/"
GEONAMES_NJ_URI    =        "http://sws.geonames.org/5101760/"
GEONAMES_NM_URI    =        "http://sws.geonames.org/5481136/"
GEONAMES_NV_URI    =        "http://sws.geonames.org/5509151/"
GEONAMES_NY_URI    =        "http://sws.geonames.org/5128638/"
GEONAMES_OH_URI    =        "http://sws.geonames.org/5165418/"
GEONAMES_OK_URI    =        "http://sws.geonames.org/4544379/"
GEONAMES_OR_URI    =        "http://sws.geonames.org/5744337/"
GEONAMES_PA_URI    =        "http://sws.geonames.org/6254927/"
GEONAMES_RI_URI    =        "http://sws.geonames.org/5224323/"
GEONAMES_SC_URI    =        "http://sws.geonames.org/4597040/"
GEONAMES_SD_URI    =        "http://sws.geonames.org/5769223/"
GEONAMES_TN_URI    =        "http://sws.geonames.org/4662168/"
GEONAMES_TX_URI    =        "http://sws.geonames.org/4736286/"
GEONAMES_UT_URI    =        "http://sws.geonames.org/5549030/"
GEONAMES_VA_URI    =        "http://sws.geonames.org/6254928/"
GEONAMES_VT_URI    =        "http://sws.geonames.org/5242283/"
GEONAMES_WA_URI    =        "http://sws.geonames.org/5815135/"
GEONAMES_WI_URI    =        "http://sws.geonames.org/5279468/"
GEONAMES_WV_URI    =        "http://sws.geonames.org/4826850/"
GEONAMES_WY_URI    =        "http://sws.geonames.org/5843591/"
#
# Country GEONAME URI's
GEONAMES_US_URI             =  "http://sws.geonames.org/6252001/"
GEONAMES_CANADA_URI         =  "http://sws.geonames.org/6251999/"
GEONAMES_MEXICO_URI         =  "http://sws.geonames.org/3996063/"
GEONAMES_NORTH_AMERICA_URI  =  "http://sws.geonames.org/6255149/"
GEONAMES_UK_URI             =  "http://sws.geonames.org/2635167/"

unless defined? ENV_CONSTANTS_ARE_DEFINED
  ENV_CONSTANTS_ARE_DEFINED = true
  APP_VERSION = "N/A" #version info is changed to deployment tag by capistrano script
  PER_PAGE_MAX = 1000
  PROGRAM_NAME = "Taxon Concept Index"
  GOOGLE_ANALYTICS = '' 
  NOREPLY_EMAIL = "noreply@example.org"
  FEEDBACK_EMAIL = 'customer_service@example.com'
  LSID_PREFIX = "urn:lsid:taxonconcept.org:index:"
  GNA_NAMESPACE = UUID.create_v5("globalnames.org", UUID::NameSpace_DNS)
end
