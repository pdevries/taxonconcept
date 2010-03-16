xml = Builder::XmlMarkup.new(:indent => 2)
xml.instruct!
xml.rdf(:RDF,
  "xmlns:gni"                     =>  GNI_ONTOLOGY,
  "xmlns:txn"                     =>  ONTOLOGY,
  "xmlns:rdfs"                    =>  RDFS_ONTOLOGY ,
  "xmlns:rdf"                     =>  RDF_ONTOLOGY,
  "xmlns:owl"                     =>  OWL_ONTOLOGY,
  "xmlns:skos"                    =>  SKOS_ONTOLOGY,
  "xmlns:dc"                      =>  DC_ONTOLOGY,
  "xmlns:dcterms"                 =>  DCTERMS_ONTOLOGY,
  "xmlns:cc"                      =>  CC_ONTOLOGY,
  "xmlns:foaf"                    =>  FOAF_ONTOLOGY) do


xml.rdf(:Description, "rdf:about" => @home_rdf ) do
     xml.dcterms(:title, @site_title_rdf)
     xml.dcterms(:publisher, "rdf:resource" => PUBLISHER_URI)
     xml.dcterms(:creator,   "rdf:resource" => CREATOR_URI)
     xml.dcterms(:description, "GeoSpecies Knowledge Base Homepage RDF version")
     xml.dcterms(:identifier, @home_rdf )
     xml.dcterms(:language, 'en')
     xml.dcterms(:isPartOf, "rdf:resource" => DATASET_URI)
     xml.dcterms(:created, CREATED_TIME)
     xml.dcterms(:modified, START_TIME)
     xml.cc(:license, "rdf:resource" => LICENSE_URI)
     xml.cc(:attributionURL, "rdf:resource" => SITE)
     xml.cc(:attributionName, ATTRIBUTION_NAME)
     xml.foaf(:topic, 'rdf:resource'   =>  SITE)
     xml.foaf(:topic, 'rdf:resource'   =>  @home_rdf )
     xml.foaf(:topic, 'rdf:resource'   =>  @home_html)
     xml.rdfs(:seeAlso, 'rdf:resource' =>  'http://ocs.geospecies.org/index.rdf')
     xml.rdfs(:seeAlso, 'rdf:resource' =>  SITE +'/ses/index.rdf')
end

xml.rdf(:Description, "rdf:about" => @home_html) do
     xml.dcterms(:title, @site_title_html)
     xml.dcterms(:publisher, "rdf:resource" => PUBLISHER_URI)
     xml.dcterms(:creator,   "rdf:resource" => CREATOR_URI)
     xml.dcterms(:description, @site_description_html)
     xml.dcterms(:identifier, @home_html)
     xml.dcterms(:language, 'en')
     xml.dcterms(:isPartOf, "rdf:resource" => DATASET_URI)
     xml.dcterms(:created, CREATED_TIME)
     xml.dcterms(:modified, START_TIME)
     xml.cc(:license, "rdf:resource" => LICENSE_URI)
     xml.cc(:attributionURL, "rdf:resource" => SITE)
     xml.cc(:attributionName, ATTRIBUTION_NAME)
     xml.foaf(:topic, 'rdf:resource'   =>  SITE)
     xml.foaf(:topic, 'rdf:resource'   =>  @home_rdf)
     xml.foaf(:topic, 'rdf:resource'   =>  @home_html)
     xml.rdfs(:seeAlso, 'rdf:resource' =>  'http://ocs.geospecies.org/index.rdf')
     xml.rdfs(:seeAlso, 'rdf:resource' =>  SITE +'/ses/index.rdf')
end

xml.bibo(:Website, "rdf:about" => SITE do
     xml.dcterms(:title, SITE_NAME)
     xml.dcterms(:publisher, "rdf:resource" => PUBLISHER_URI)
     xml.dcterms(:creator,  "rdf:resource"  => CREATOR_URI)
     xml.dcterms(:description, WEBSITE_DESCRIPTION)
     xml.dcterms(:type,  "rdf:resource" => DCTERMS_INTERACTIVE_RESOURCE)
     xml.dcterms(:identifier, SITE)
     xml.dcterms(:language, 'en')
     xml.dcterms(:isPartOf, "rdf:resource" => DATASET_URI)
     xml.cc(:license, "rdf:resource" => LICENSE_URI)
     xml.cc(:attributionURL, "rdf:resource" => SITE)
     xml.cc(:attributionName, ATTRIBUTION_NAME)
     xml.dcterms(:created, CREATED_TIME)
     xml.dcterms(:modified, START_TIME)
     xml.foaf(:topic, 'rdf:resource'   =>  SITE)
     xml.foaf(:topic, 'rdf:resource'   =>  @home_rdf)
     xml.foaf(:topic, 'rdf:resource'   =>  @home_html)
 end

end #RDF