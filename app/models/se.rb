class Se < ActiveRecord::Base

    named_scope :all
    #named_scope :hundred,      :conditions => { :se_order    => "Carnivora"}
    #named_scope :thousand,     :conditions => { :se_bioclass => "Mammalia"}


 def to_param
   se_uid
 end
end
