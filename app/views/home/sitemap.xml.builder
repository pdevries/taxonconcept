xml = Builder::XmlMarkup.new(:indent => 2)
xml.instruct!
  xml.urlset(:xmlns       => "http://www.sitemaps.org/schemas/sitemap/0.9",
    "xmlns:sc"            => "http://sw.deri.org/2007/07/sitemapextension/scschema.xsd") do

@ses.each do |s|
 xml.url() do
   xml.loc(@ses_url_prefix + s.se_uid + '.html')
   xml.changefreq("weekly")
   xml.changefreq("priority")
 end #url
end # each order

xml.sc(:dataset) do
  xml.sc(:datasetLabel, @dataset_label)
  xml.sc(:datasetURI, @dataset_uri)
  xml.sc(:linkedDataPrefix,  @linkeddata_prefix)
  # add each RDF URI for virtuoso crawler
  xml.sc(:sampleURI , 'http://lod.taxonconcept.org/index.rdf')
  xml.sc(:sampleURI , 'http://lod.taxonconcept.org/ses/index.rdf')
  xml.sc(:sampleURI , 'http://lod.taxonconcept.org/ontology/void.rdf')
  @ses.each do |s|
    xml.sc(:sampleURI , @ses_url_prefix + s.se_uid + '.rdf')
  end #sampleURI
  #  Removed data dump location since data dump always lags behind actual data, frequency daily during demo development.
  #  xml.sc(:dataDumpLocation, RDF_DUMP_URL)
  xml.changefreq("daily")
end #dataset

end #XML



