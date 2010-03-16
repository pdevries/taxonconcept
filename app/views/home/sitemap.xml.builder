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
  xml.sc(:sampleURI ,  @sample_uri)
  xml.sc(:dataDumpLocation, RDF_DUMP_URL)
  xml.changefreq("weekly")
end #dataset

end #XML



