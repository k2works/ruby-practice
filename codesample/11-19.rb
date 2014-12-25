require 'set'

a = %w(Alice Bob Charlie).to_set
b = %w(Alice Bob).to_set

p a.superset?(b) # >> true
p b.subset?(a) # >> true
p a.proper_superset?(b) # >> true
p b.proper_subset?(a) # >> true

p b.superset?(a) # >> false
p a.subset?(b) # >> false

p a.subset?(a) # >> true
p a.superset?(a) # >> true

p a.proper_superset?(a) # >> false
p a.proper_subset?(a) # >> false
