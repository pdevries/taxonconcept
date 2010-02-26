xml = Builder::XmlMarkup.new(:indent => 2)
xml.instruct!
xml.rdf(:RDF,
  "xmlns:rdfs"                    =>  RDFS_ONTOLOGY,
  "xmlns:rdf"                     =>  RDF_ONTOLOGY) do

end #RDF