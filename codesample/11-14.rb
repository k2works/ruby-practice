# coding: utf-8
CSV.open('people.csv').each do |row|
   # 何かしらの処理
end

CSV.open('people.csv', 'a') do |csv|
   csv.flock(File::LOCK_EX)

   people.each do |person|
	  csv << person
   end
end
