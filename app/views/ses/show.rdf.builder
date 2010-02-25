xml = Builder::XmlMarkup.new(:indent => 2)
xml.instruct!
xml.rdf(:RDF,
  "xmlns:geospecies"              =>  GS_ONTOLOGY,
  "xmlns:txn"                     =>  ONTOLOGY,
  "xmlns:rdfs"                    =>  RDFS_ONTOLOGY,
  "xmlns:rdf"                     =>  RDF_ONTOLOGY,
  "xmlns:owl"                     =>  OWL_ONTOLOGY,
  "xmlns:skos"                    =>  SKOS_ONTOLOGY,
  "xmlns:dc"                      =>  DC_ONTOLOGY,
  "xmlns:dcterms"                 =>  DCTERMS_ONTOLOGY,
  "xmlns:cc"                      =>  CC_ONTOLOGY,
  "xmlns:uniprot"                 =>  UNIPROT_ONTOLOGY,
  "xmlns:umbel"                   =>  UMBEL_ONTOLOGY,
  "xmlns:dbpedia-owl"             =>  DBPEDIA_OWL, 
  "xmlns:dbpprop"                 =>  DBPEDIA_PROPERTY,
  "xmlns:doap"                    =>  DOAP_ONTOLOGY, 
  "xmlns:bibo"                    =>  BIBO_ONTOLOGY, 
  "xmlns:geo"                     =>  GEO_ONTOLOGY, 
  "xmlns:foaf"                    =>  FOAF_ONTOLOGY, 
  "xmlns:time"                    =>  TIME_ONTOLOGY, 
  "xmlns:dwc"                     =>  DWC_ONTOLOGY, 
  "xmlns:geonames"                =>  GEONAMES_ONTOLOGY) do

xml.rdf(:Description, "rdf:about" => @se_rdf) do
  xml.dcterms(:title, "About: Species " + @se_concept_name)
  xml.dcterms(:publisher, "rdf:resource" => PUBLISHER_URI)
  xml.dcterms(:creator, "rdf:resource"   => CREATOR1_URI)
  xml.dcterms(:creator, "rdf:resource"   => CREATOR2_URI)
  xml.dcterms(:description, 'TaxonConcept Knowledge Base RDF: ' +  @se_concept_name)
  xml.dcterms(:identifier, @se_rdf)
  xml.dcterms(:language, 'en')
  xml.dcterms(:isPartOf, "rdf:resource" => DATASET_URI )
  xml.dcterms(:modified, @se.updated_at.strftime('%Y-%m-%dT%H:%M:%S%z'))
  xml.cc(:license, "rdf:resource" => LICENSE_URI)
  xml.cc(:attributionURL, "rdf:resource" => ATTRIBUTION_URL)
  xml.foaf(:primaryTopic,  "rdf:resource" => @se_uri)
  xml.foaf(:topic,         "rdf:resource" => @se_url)
  xml.foaf(:topic,         "rdf:resource" => @se_rdf)
end

 xml.owl(:Class, "rdf:about"    => @se_uri) do
  xml.rdfs(:subClassOf,  "rdf:resource" => "http://rdf.taxonconcept.org/ont/txn.owl#SpeciesConcept")
  xml.dcterms(:title, @se_concept_name)
  xml.dcterms(:modified, @se.updated_at.strftime('%Y-%m-%dT%H:%M:%S%z'))
  xml.dcterms(:identifier, @se_uri)
  xml.txn(:hasSpeciesConceptID, @se_concept_id)
  xml.dcterms(:isPartOf, "rdf:resource" => DATASET_URI)
  xml.skos(:scopeNote, "An OWL class for the species concept " + @se_concept_name)
  xml.skos(:inScheme, "rdf:resource" =>  "http://rdf.taxonconcept.org/ont/txn.owl#TaxonConceptScheme")
  xml.txn(:kingdom, @se.se_kingdom)
  xml.txn(:phylum, @se.se_phylum)
  xml.txn(:class, @se.se_class)
  xml.txn(:order, @se.se_order)
  xml.txn(:family, @se.se_family)
  xml.txn(:genus, @se.se_genus)
  xml.txn(:epithet, @se.se_epithet)
  if !@se.se_author_year.nil?
    xml.txn(:author_year, @se.se_author_year)
  end
  xml.comment!("Link to Species Documentation Ontology")
  xml.txn(:speciesAsDocumentedBy, "rdf:resource" =>  "http://rdf.taxonconcept.org/ses_owl/" + @se.se_uid)
  xml.comment!("URI's to Publications")
  xml.txn(:speciesHasTaxonomicDescription, "rdf:resource" => "http://www.example.org/publication1.rdf")
  xml.txn(:speciesHasTaxonomicDescription, "rdf:resource" => "http://www.example.org/publication2.rdf")
  xml.comment!("Tags records based on various 'perspectives' on this species")
  xml.txn(:speciesHasTopicTag,      "rdf:resource" => @se_uri + "#Topic")
  xml.txn(:speciesHasOccurrenceTag, "rdf:resource" => @se_uri + "#Occurrence")
  xml.txn(:speciesHasIndividualTag, "rdf:resource" => @se_uri + "#Individual")
  xml.comment!("A species concept is some combination of objective, phylogenetic, biological")
  xml.comment!("GNA UUID Synonyms")
  if !@se_name_uuid.nil?
    xml.txn(:hasGNASynonym, "rdf:resource" => GNA_RDF_PREFIX + @se_name_uuid)
  end
  if @se.se_type_objective?
    xml.rdf(:type, "rdf:resource" => "http://rdf.taxonconcept.org/ont/txn.owl#SpeciesConcept_Objective")
  end
  if @se.se_type_phylogenetic?
    xml.rdf(:type, "rdf:resource" => "http://rdf.taxonconcept.org/ont/txn.owl#SpeciesConcept_Phylogenetic")
  end
  if @se.se_type_biological?
    xml.rdf(:type, "rdf:resource" => "http://rdf.taxonconcept.org/ont/txn.owl#SpeciesConcept_Biological")
  end
  xml.comment!("This Class is the primary topic of the related HTML and RDF descriptions")
  xml.foaf(:isPrimaryTopicOf, "rdf:resource" => @se_url)
  xml.foaf(:isPrimaryTopicOf, "rdf:resource" => @se_rdf)
  xml.comment!("Links to External Integer Database Keys")
  if !@se.se_gbif.nil?
    xml.txn(:hasGBIF, @se.se_gbif)
  end
  if !@se.se_itis.nil?
    xml.txn(:hasITIS, @se.se_itis)
  end
  if !@se.se_eol.nil?
    xml.txn(:hasEOL,  @se.se_eol)
  end
  if !@se.se_ncbi.nil?
    xml.txn(:hasNCBI, @se.se_ncbi)
  end
  if !@se.se_bold.nil?
    xml.txn(:hasBOLD, @se.se_bold)
  end
  xml.comment!("Mapping to other URI's for this species")
  if !@se_umbel_url.nil?
    xml.umbel(:isAligned, "rdf:resource"   => @se_umbel_url)
  end
  xml.comment!("uBio LSID, could be many")
  if !@se_ubio_url.nil?
     xml.skos(:relatedMatch, "rdf:resource" => @se_ubio_url)
  end
  xml.comment!("Catalog of Life LSID")
  if !@se_col_url.nil?
    xml.skos(:relatedMatch, "rdf:resource"=> @se_col_url)
  end
  xml.comment!("Uniprot")
  if !@se_uniprot_url.nil?
    xml.skos(:closeMatch, "rdf:resource"=> @se_uniprot_url)
  end
  xml.comment!("Bio2RDF")
  if !@se_bio2rdf_url.nil?
    xml.skos(:closeMatch, "rdf:resource"=> @se_bio2rdf_url)
  end
  xml.comment!("DBpedia")
  if !@se_dbpedia_url.nil?
    xml.skos(:closeMatch, "rdf:resource"=> @se_dbpedia_url)
  end
  xml.comment!("Freebase")
  if !@se_freebase_url.nil?
    xml.skos(:closeMatch, "rdf:resource"=> @se_freebase_url)
  end
  xml.comment!("OpenCyc")
  if !@se_opencyc_url.nil?
    xml.skos(:closeMatch, "rdf:resource"=> @se_opencyc_url)
  end
  xml.comment!("GeoSpecies")
  if !@se_geospecies_url.nil?
    xml.skos(:closeMatch, "rdf:resource"=> @se_geospecies_url)
  end
 end #class

xml.comment!("Linked Data Linkouts")

  if !@se_ubio_url.nil?
    xml.txn(:Ubio_LSID,   "rdf:about"      => @se_ubio_url) do
      xml.skos(:relatedMatch,   "rdf:resource"    => @se_uri)
    end  
  end

  if !@se_col_url.nil?
    xml.txn(:CoL_LSID,   "rdf:about"      => @se_col_url) do
      xml.skos(:closeMatch,   "rdf:resource"     => @se_uri)
    end  
  end

  if !@se_uniprot_url.nil?
    xml.txn(:UniprotTaxon, "rdf:about"    => @se_uniprot_url) do
       xml.skos(:closeMatch,      "rdf:resource" => @se_uri)
    end  
  end  

  if !@se_bio2rdf_url.nil?
    xml.txn(:Bio2RDFtaxon, "rdf:about"    => @se_bio2rdf_url) do
       xml.skos(:closeMatch,      "rdf:resource" => @se_uri)
    end  
  end  

  if !@se_dbpedia_url.nil?
    xml.txn(:DBpediaResource, "rdf:about" => @se_dbpedia_url) do
      xml.skos(:closeMatch,       "rdf:resource" => @se_uri)
    end  
  end

  if !@se_freebase_url.nil?
    xml.txn(:FreebaseGUID, "rdf:about"    =>  @se_freebase_url ) do
      xml.skos(:closeMatch,    "rdf:resource"    =>  @se_uri)
    end  
  end  

  if !@se_opencyc_url.nil?
    xml.txn(:OpenCycConcept, "rdf:about"  =>  @se_opencyc_url ) do
      xml.skos(:closeMatch,    "rdf:resource"    => @se_uri)
    end  
  end  

  if !@se_geospecies_url.nil?
    xml.txn(:GeoSpeciesConcept, "rdf:about"  =>  @se_geospecies_url ) do
      xml.skos(:closeMatch,    "rdf:resource"    => @se_uri)
    end  
  end  

  if ! @se_name_uuid.nil?
    xml.txn(:GNASynonym, "rdf:about"  =>  GNA_RDF_PREFIX + @se_name_uuid ) do
    xml.skos(:prefLabel, @se_name)
    xml.rdfs(:seeAlso,  "rdf:resource" => GNA_RDF_PREFIX + @se_name_uuid)
    xml.txn(:hasSpeciesTaxonConcept,    "rdf:resource"    => @se_uri)
    end  
  end  


xml.bibo(:Webpage, "rdf:about" =>  @se_url) do
  xml.dcterms(:title, @se_concept_name)
  xml.dcterms(:publisher, "rdf:resource" => PUBLISHER_URI)
  xml.dcterms(:creator, "rdf:resource"   => CREATOR1_URI)
  xml.dcterms(:creator, "rdf:resource"   => CREATOR2_URI)
  xml.dcterms(:description, ('TaxonConcept Knowledge Base Page: Species ' + @se_concept_name))
  xml.dcterms(:identifier,  @se_url)
  xml.dcterms(:language, 'en')
  xml.dcterms(:isPartOf, "rdf:resource" => DATASET_URI )
  xml.dcterms(:modified, @se.updated_at.strftime('%Y-%m-%dT%H:%M:%S%z'))
  xml.cc(:license,        "rdf:resource" => LICENSE_URI)
  xml.cc(:attributionURL, "rdf:resource" => ATTRIBUTION_URL)
  xml.foaf(:primaryTopic,  "rdf:resource" => @se_uri)
  xml.foaf(:topic, "rdf:resource" =>  @se_url)
  xml.foaf(:topic, "rdf:resource" =>  @se_rdf)
end #webpage

end #RDF
