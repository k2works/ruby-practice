p 'hello'.class
p String.ancestors

p 10.class
p Fixnum.ancestors

p true.class
p TrueClass.ancestors

p nil.class
p NilClass.ancestors
# >> String
# >> [String, Comparable, Object, Kernel, BasicObject]

# >> Fixnum
# >> [Fixnum, Integer, Numeric, Comparable, Object, Kernel, BasicObject]

# >> TrueClass
# >> [TrueClass, Object, Kernel, BasicObject]

# >> NilClass
# >> [NilClass, Object, Kernel, BasicObject]
