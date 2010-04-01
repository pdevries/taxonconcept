xml = Builder::XmlMarkup.new(:indent => 2)
xml.instruct!
xml.rdf(:RDF,
  "xmlns:txn"                     =>  ONTOLOGY,
  "xmlns:gni"                     =>  GNI_ONTOLOGY,
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
  "xmlns:po"                      =>  BBC_PO,
  "xmlns:wo"                      =>  BBC_WO,
  "xmlns:geonames"                =>  GEONAMES_ONTOLOGY) do

xml.rdf(:Description, "rdf:about" => @se_rdf) do
  xml.dcterms(:title, "About: Species " + @se_concept_name)
  xml.dcterms(:publisher, "rdf:resource" => PUBLISHER_URI)
  xml.dcterms(:creator, "rdf:resource"   => CREATOR1_URI)
  xml.dcterms(:creator, "rdf:resource"   => CREATOR2_URI)
  xml.dcterms(:description, 'TaxonConcept Knowledge Base RDF ' +  @se_concept_name)
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
  xml.rdf(:type, "rdf:resource" => ONTOLOGY + "SpeciesConcept")
  xml.dcterms(:title, @se_concept_name)
  xml.dcterms(:modified, @se.updated_at.strftime('%Y-%m-%dT%H:%M:%S%z'))
  xml.dcterms(:identifier, @se_uri)
  xml.txn(:hasSpeciesConceptID, @se_concept_id)
  xml.dcterms(:isPartOf, "rdf:resource" => DATASET_URI)
  xml.skos(:scopeNote, "An OWL class for the species concept " + @se_concept_name)
  xml.skos(:inScheme, "rdf:resource" =>  ONTOLOGY + "TaxonConceptScheme")
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
  if !@se.se_cname.nil?
    xml.txn(:commonName, @se.se_cname)
  end
  xml.comment!("Link to Species Documentation Ontology")
  xml.txn(:speciesConceptIsDocumentedByTaxonOntology, "rdf:resource" =>  SPECIES_DOCUMENTATION_PREFIX + @se.se_uid)
  xml.comment!("Tags records based on various 'perspectives' on this species")
  xml.txn(:speciesConceptHasSpeciesTopicTag,      "rdf:resource" => @se_species_topic_tag)
  xml.txn(:speciesConceptHasSpeciesOccurrenceTag, "rdf:resource" => @se_species_occurrence_tag)
  xml.txn(:speciesConceptHasSpeciesIndividualTag, "rdf:resource" => @se_species_individual_tag)
  xml.comment!("URI's to Publications")
  xml.txn(:speciesConceptHasTaxonomicDescription, "rdf:resource" => "http://www.example.org/publication1.rdf")
  xml.txn(:speciesConceptHasTaxonomicDescription, "rdf:resource" => "http://www.example.org/publication2.rdf")
  xml.comment!("A species concept is some combination of objective, phylogenetic, biological")
  xml.comment!("GNA UUID Synonyms")
  if !@se_name_uuid.nil?
    xml.txn(:speciesConceptHasSpeciesNameString, "rdf:resource" => GNA_RDF_PREFIX + @se_name_uuid)
  end
  if !@se_synonym_one_uuid.nil?
    xml.txn(:speciesConceptHasSpeciesNameString, "rdf:resource" => GNA_RDF_PREFIX + @se_synonym_one_uuid)
  end
  if !@se_synonym_two_uuid.nil?
    xml.txn(:speciesConceptHasSpeciesNameString, "rdf:resource" => GNA_RDF_PREFIX + @se_synonym_two_uuid)
  end

  if @se.se_type_objective?
    xml.rdf(:type, "rdf:resource" => ONTOLOGY + "SpeciesConceptTypeIsObjective")
  end
  if @se.se_type_phylogenetic?
    xml.rdf(:type, "rdf:resource" => ONTOLOGY + "SpeciesConceptTypeIsPhylogenetic")
  end
  if @se.se_type_biological?
    xml.rdf(:type, "rdf:resource" => ONTOLOGY + "SpeciesConceptTypeIsBiological")
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
    xml.comment!("Umbel Subject URI")
    xml.umbel(:isAligned, "rdf:resource"   => @se_umbel_url)
  end
  if !@se_ubio_url.nil?
     xml.comment!("uBio LSID, could be many")
     xml.skos(:relatedMatch, "rdf:resource" => @se_ubio_url)
  end
  if !@se_col_uri.nil?
  xml.comment!("Catalog of Life LSID")
    xml.skos(:closeMatch, "rdf:resource"=> @se_col_uri)
  end
  if !@se_uniprot_url.nil?
  xml.comment!("Uniprot URI")
    xml.skos(:closeMatch, "rdf:resource"=> @se_uniprot_url)
  end
  if !@se_bio2rdf_url.nil?
  xml.comment!("Bio2RDF URI")
    xml.skos(:closeMatch, "rdf:resource"=> @se_bio2rdf_url)
  end
  if !@se_dbpedia_url.nil?
    xml.comment!("DBpedia URI")
    xml.skos(:closeMatch, "rdf:resource"=> @se_dbpedia_url)
  end
  if !@se_freebase_url.nil?
  xml.comment!("Freebase URI")
    xml.skos(:closeMatch, "rdf:resource"=> @se_freebase_url)
  end
  if !@se_opencyc_url.nil?
    xml.comment!("OpenCyc URI")
    xml.skos(:closeMatch, "rdf:resource"=> @se_opencyc_url)
  end
  if !@se_bbc_uri.nil?
    xml.comment!("BBC URI")
    xml.skos(:closeMatch, "rdf:resource"=> @se_bbc_uri)
  end
  if !@se_geospecies_url.nil?
    xml.comment!("GeoSpecies URI")
    xml.skos(:closeMatch, "rdf:resource"=> @se_geospecies_url)
  end

 end #class

xml.comment!("Linked Data Linkouts")

  if !@se_ubio_url.nil?
    xml.txn(:UbioTaxon,   "rdf:about"      => @se_ubio_url) do
      xml.skos(:relatedMatch,   "rdf:resource"    => @se_uri)
    end  
  end

  if !@se_col_uri.nil?
    xml.txn(:CoL_Taxon_LSID,   "rdf:about"      => @se_col_uri) do
      xml.skos(:closeMatch,   "rdf:resource"     => @se_uri)
    end  
  end

  if !@se_uniprot_url.nil?
    xml.txn(:UniprotTaxon, "rdf:about"    => @se_uniprot_url) do
       xml.skos(:closeMatch,      "rdf:resource" => @se_uri)
    end  
  end  

  if !@se_bio2rdf_url.nil?
    xml.txn(:Bio2RDFTaxon, "rdf:about"    => @se_bio2rdf_url) do
       xml.skos(:closeMatch,      "rdf:resource" => @se_uri)
    end  
  end  

  if !@se_dbpedia_url.nil?
    xml.txn(:DBpediaTaxon, "rdf:about" => @se_dbpedia_url) do
      xml.skos(:closeMatch,       "rdf:resource" => @se_uri)
    end  
  end

  if !@se_freebase_url.nil?
    xml.txn(:FreebaseTaxon, "rdf:about"    =>  @se_freebase_url ) do
      xml.skos(:closeMatch,    "rdf:resource"    =>  @se_uri)
    end  
  end  

  if !@se_opencyc_url.nil?
    xml.txn(:OpenCycTaxon, "rdf:about"  =>  @se_opencyc_url ) do
      xml.skos(:closeMatch,    "rdf:resource"    => @se_uri)
    end  
  end  

  if !@se_geospecies_url.nil?
    xml.txn(:GeoSpeciesTaxon, "rdf:about"  =>  @se_geospecies_url ) do
      xml.skos(:closeMatch,    "rdf:resource"    => @se_uri)
    end  
  end  

  if !@se_bbc_uri.nil?
    xml.wo(:Species, "rdf:about"  =>  @se_bbc_uri ) do
      xml.skos(:closeMatch,    "rdf:resource"    => @se_uri)
      xml.rdfs(:seeAlso,  "rdf:resource" => @se_bbc_url + ".rdf")
    end  
  end  

  if !@se_name_uuid.nil?
    xml.gni(:NameString, "rdf:about"  =>  GNA_RDF_PREFIX + @se_name_uuid ) do
    xml.skos(:prefLabel, @se_name)
    xml.rdfs(:seeAlso,  "rdf:resource" => GNA_RDF_PREFIX + @se_name_uuid + ".rdf")
    xml.txn(:speciesNameStringHasSpeciesTaxonConcept,    "rdf:resource"    => @se_uri)
    end  
  end  

  if !@se_synonym_one_uuid.nil?
    xml.gni(:NameString, "rdf:about"  =>  GNA_RDF_PREFIX + @se_synonym_one_uuid ) do
    xml.skos(:prefLabel, @se.se_synonym_one)
    xml.rdfs(:seeAlso,  "rdf:resource" => GNA_RDF_PREFIX + @se_synonym_one_uuid + ".rdf")
    xml.txn(:speciesNameStringHasSpeciesTaxonConcept,    "rdf:resource"    => @se_uri)
    end  
  end  

  if !@se_synonym_two_uuid.nil?
    xml.gni(:NameString, "rdf:about"  =>  GNA_RDF_PREFIX + @se_synonym_two_uuid ) do
    xml.skos(:prefLabel, @se.se_synonym_two)
    xml.rdfs(:seeAlso,  "rdf:resource" => GNA_RDF_PREFIX + @se_synonym_two_uuid + ".rdf")
    xml.txn(:speciesNameStringHasSpeciesTaxonConcept,    "rdf:resource"    => @se_uri)
    end  
  end  

xml.txn(:SpeciesOccurrenceTag,  "rdf:about" =>  @se_species_occurrence_tag) do
   xml.skos(:prefLabel, "A Tag-like resource that is used to label occurrences of the species concept " + @se_concept_name)
   xml.txn(:speciesOccurrenceTagHasSpeciesConcept,    "rdf:resource"    => @se_uri)
end

xml.txn(:SpeciesIndividualTag,  "rdf:about" =>  @se_species_individual_tag) do
  xml.skos(:prefLabel, "A Tag-like resource that is used to label individuals of the species concept " + @se_concept_name)
  xml.txn(:speciesIndividualTagHasSpeciesConcept,    "rdf:resource"    => @se_uri)
end

xml.txn(:SpeciesTopicTag,       "rdf:about" =>  @se_species_topic_tag) do
  xml.skos(:prefLabel, "A Tag-like resource that is used to label the topic of species concept " + @se_concept_name)
  xml.txn(:speciesTopicTagHasSpeciesConcept,    "rdf:resource"    => @se_uri)
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
