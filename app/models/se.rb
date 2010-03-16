class Se < ActiveRecord::Base

   default_scope :order => 'se_kingdom  ASC'  # TODO Complete Sorting Code

    named_scope :all
    #named_scope :hundred,      :conditions => { :se_order    => "Carnivora"}
    #named_scope :thousand,     :conditions => { :se_bioclass => "Mammalia"}

 def to_param
   se_uid
 end
end
