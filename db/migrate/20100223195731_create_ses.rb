class CreateSes < ActiveRecord::Migration
  def self.up
    create_table :ses do |t|
      t.string :se_uid
      t.string :se_uuid
      t.boolean :se_active
      t.string :se_status
      t.string :se_replaced_by
      t.string :se_close_match
      t.string :se_type_objective
      t.string :se_type_phylogenetic
      t.string :se_type_biological
      t.string :se_kingdom
      t.string :se_phylum
      t.string :se_class
      t.string :se_order
      t.string :se_family
      t.string :se_genus
      t.string :se_epithet
      t.string :se_author_year
      t.string :se_rank
      t.string :se_synonym_one
      t.string :se_synonym_two
      t.string :se_synonym_three
      t.string :se_synonym_four
      t.string :se_synonym_five
      t.string :se_basionym
      t.string :se_ontology
      t.integer :se_division_id
      t.integer :se_ncbi
      t.integer :se_ubio
      t.integer :se_itis
      t.integer :se_gbif
      t.integer :se_eol
      t.integer :se_bold
      t.integer :se_col_id
      t.string :se_col
      t.string :se_geospecies
      t.string :se_dbpedia
      t.string :se_freebase
      t.string :se_opencyc
      t.string :se_umbel
      t.string :se_lc
      t.string :se_bbc
      t.string :se_wikipedia
      t.string :se_wikispecies

      t.timestamps
    end
  end

  def self.down
    drop_table :ses
  end
end
