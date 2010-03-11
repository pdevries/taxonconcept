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

xml.rdf(:Description, "rdf:about" => 'http://lod.taxonconcept.org/ses/index.rdf') do
  xml.dcterms(:title, ("About: TaxonConcept Index RDF"))
  xml.dcterms(:publisher, "rdf:resource" => PUBLISHER_URI)
  xml.dcterms(:creator,   "rdf:resource" => CREATOR1_URI)
  xml.dcterms(:creator,   "rdf:resource" => CREATOR2_URI)
  xml.dcterms(:description, "This is an RDF collection of species in the TaxonConcept Knowledge Base")
  xml.dcterms(:identifier, 'http://lod.taxonconcept.org/ses/index.rdf')
  xml.dcterms(:language, 'en')
  xml.dcterms(:isPartOf, "rdf:resource" => DATASET_URI)
  xml.dcterms(:modified, Time.now.strftime('%Y-%m-%dT%H:%M:%S%z'))
  xml.cc(:license, "rdf:resource" => LICENSE_URI)
  xml.cc(:attributionURL, "rdf:resource" => ATTRIBUTION_URL)
  xml.foaf(:topic,   "rdf:resource" => 'http://lod.taxonconcept.org/ses/index.rdf')
  xml.rdfs(:seeAlso, "rdf:resource" => 'http://ocs.geospecies.org/index.rdf')
   for se in @ses
    xml.rdfs(:seeAlso, "rdf:resource" => 'http://lod.taxonconcept.org/ses/'  +  se.se_uid + ".rdf")
  end #for se
end

# for se in @ses
# xml.txn(:SpeciesEntityConcept, "rdf:about"  => 'http://lod.taxonconcept.org/ses/'  +  se.se_uid) do
#    xml.rdfs(:seeAlso, "rdf:resource" => 'http://lod.taxonconcept.org/ses/'  +  se.se_uid + ".rdf")
#  end
# end #ses

end #RDF
