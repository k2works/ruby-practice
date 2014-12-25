# coding: utf-8
require 'csv'

data = <<EOS
name,age,gender
alice,14,female
bob,32,male
carol,17,female
EOS

CSV.parse(data, headers: :first_row) do |row|
   # ヘッダ名をキーにしてハッシュのようにアクセスできる
   name = row['name']
   age,gender = row.values_at('age','gender') 

   puts "#{name} is #{gender} {#age}"
end
# >> alice is female {#age}
# >> bob is male {#age}
# >> carol is female {#age}
