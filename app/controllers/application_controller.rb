# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

#TODO This needs logic to deal with missing epithet etc.
  def scientificname(genus,epithet,author_year)
     if genus.nil? or epithet.nil?
       scientificname = nil
     else #
       if author_year.nil?
          scientificname = (genus + " " + epithet)
       else
         scientificname = (genus + " " + epithet  + " " + author_year) 
       end #end if has at least partial name
     end #if  
  end # scientificname


  def concept_name(se_genus,se_epithet,se_uid)
     concept_name = (se_genus + " " + se_epithet + " se:" + se_uid)
  end

  def concept_id(se_uuid)
     concept_id = (SPECIES_ID_PREFIX + se_uuid)
  end


  def ncbi_url(ncbi)
        if ncbi.nil?
           ncbi_url = nil
        else
        ncbi_url = (NCBI_PREFIX + ncbi.to_s + NCBI_SUFFIX)
    end
  end

  def bio2rdf_url(ncbi)
        if ncbi.nil?
           bio2rdf_url = nil
        else
        bio2rdf_url = (BIO2RDF_TAXON_URL_PREFIX + ncbi.to_s)
    end
  end

  def uniprot_url(ncbi)
        if ncbi.nil?
           uniprot_url = nil
        else
        uniprot_url = (UNIPROT_TAXON_URL_PREFIX + ncbi.to_s)
    end
  end


  def ubio_lsid(namebankid)
        if namebankid.nil?
          ubio_lsid = nil
        else
    	ubio_lsid = (UBIO_PREFIX + namebankid.to_s)
    end
   end

  def itis_url(itis)
        if itis.nil?
           itis_url = nil
        else
        itis_url = (ITIS_RDF_URL_PREFIX  + itis.to_s)
    end
  end

  def gbif_url(gbif)
        if gbif.nil?
           gbif_url =  nil
        else
        gbif_url = (GBIF_PREFIX  + gbif.to_s)
    end
  end

  def eol_url(eol)
        if eol.nil? | eol = ''
           eol_url = nil
        else
          eol_url = (EOL_PREFIX  + eol.to_s)
        end
  end

  def bold_url(bold)
        if bold.nil? | eol = ''
           bold_url = nil
        else
          bold_url = (BOLD_PREFIX  + bold.to_s)
        end
  end

  def col_url(col)
        if col.nil?
           col_url = nil
        else
        col_url = (COL_PREFIX + col.to_s)
    end
  end

  def col_id_url(col_id)
        if col_id.nil?
           col_id_url = nil
        else
        col_id_url = (COL_ID_PREFIX + col_id.to_s)
    end
  end


  def geospecies_url(se_uid)
        if se_uid.nil?
          geospecies_url = nil
        else
        geospecies_url = "http://lod.geospecies.org/ses/" + se_uid
    end
   end

  def dbpedia_url(dbpedia)
        if dbpedia.nil?
          dbpedia_url = nil
        else
        dbpedia_url = "http://dbpedia.org/resource/" + dbpedia
    end
   end

  def freebase_url(freebase)
        if freebase.nil?
          freebase_url = nil
        else
        freebase_url = "http://rdf.freebase.com/ns/" + freebase
    end
   end

  def opencyc_url(opencyc)
        if opencyc.nil?
          opencyc_url = nil
        else
        opencyc_url = "http://sw.opencyc.org/concept/" + opencyc
    end
   end

  def umbel_url(umbel)
        if umbel.nil?
          umbel_url = nil
        else
        umbel_url = "http://umbel.org/umbel/sc/" + umbel
    end
   end

  def lc_url(lc)
        if lc.nil?
          lc_url = nil
        else
        lc_url = "http://" + lc
    end
   end


  def bbc_url(bbc)
        if bbc.nil?
           bbc_url = nil
        else
        bbc_url = (BBC_SPECIES_PREFIX  + bbc)
    end
  end


  def wikipedia_url(wikipedia)
        if wikipedia.nil?
          wikipedia_url = nil
        else
        wikipedia_url = "http://en.wikipedia.org/wiki/" + wikipedia
    end
   end

  def wikispecies_url(wikispecies)
        if wikispecies.nil?
          wikispecies_url = nil
        else
        wikispecies_url = "http://species.wikimedia.org/wiki/" + wikispecies
    end
   end


  def dbpedia_data(dbpedia)
        if dbpedia.nil?
          dbpedia_data = nil
        else
        dbpedia_data = "http://dbpedia/data/" + dbpedia.chomp("http://dbpedia.org/resource/") + ".xml"
    end
   end
end
