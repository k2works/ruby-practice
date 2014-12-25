# coding: utf-8
require 'set'

a = %w(a b c d).to_set
b = %w(c d e f).to_set

# どちらかに含まれる要素の集合（和集合）
p a | b # >> #<Set: {"a", "b", "c", "d", "e", "f"}>
p a.union(b) # >> #<Set: {"a", "b", "c", "d", "e", "f"}>

# 両方に含まれる要素のみの集合（積集合）
p a & b # >> #<Set: {"c", "d"}>
p a.intersection(b) # >> #<Set: {"c", "d"}>

# 片方だけに含まれている集合（対称差）
p a ^ b # >> #<Set: {"e", "f", "a", "b"}>

# aの要素の中でbには含まれない要素の集合（差集合）
p a - b # >> #<Set: {"a", "b"}>
p a.difference(b) # >> #<Set: {"a", "b"}>

# 集合から別の集合を作る
set = %w(Alice Bob Charlie Dave Ellen Frank Eve).to_set

p set.divide {|v| v.length }
# >> #<Set: {#<Set: {"Alice", "Ellen", "Frank"}>, #<Set: {"Bob", "Eve"}>, #<Set: {"Charlie"}>, #<Set: {"Dave"}>}>

set = [4,4.0,2,3.0, 'Alice','Bob','Charlie',4..10,10..12].to_set

p set.classify { |v| v.class }
# >> {Fixnum=>#<Set: {4, 2}>, Float=>#<Set: {4.0, 3.0}>, String=>#<Set: {"Alice", "Bob", "Charlie"}>, Range=>#<Set: {4..10, 10..12}>}
