# coding: utf-8
require 'date'

# 年月日から日付オブジェクトを得る
date = Date.new(2011,4,1)		# => #<Date: 2011-04-01 ((2455653j,0s,0n),+0s,2299161j)>

# 日付を指定した書式の文字列で表現する
date.strftime('%Y/%m/%d')		# => "2011/04/01"
date.strftime('%Y/%m/%d %H:%M:%S') # => "2011/04/01 00:00:00"

# 妥当な日付かどうかを真偽値で得る
Date.valid_date?(2011,2,31)		# => false

# うるう年か否かを真偽値で得る
Date.leap?(2004)				# => true
Date.today.leap?				# => false

# 与えられたユリウス日に相当する日付オブジェクトを得る
Date.jd(2456107)				# => #<Date: 2012-06-28 ((2456107j,0s,0n),+0s,2299161j)>

# 現在の日付オブジェクトを得る
today = Date.today				# => #<Date: 2014-12-24 ((2457016j,0s,0n),+0s,2299161j)>

# ユリウス日・修正ユリウス日を得る
today.jd						# => 2457016
today.mjd						# => 57015

# 改暦日設定しなおした新しい日付オブジェクトを返す
today.new_start(Date::JULIAN)	# => #<Date: 2014-12-11 ((2457016j,0s,0n),+0s,Infj)>

# DateオブジェクトはTimeオブジェクトと同様のメソッドも提供

date = Date.new(2011,4,1)

date.year 						# => 2011
date.month						# => 4
date.day						# => 1

date.wday						# => 5
date.yday						# => 91

date.friday?					# => true
date.saturday?					# => false

today = Date.today				# => #<Date: 2014-12-24 ((2457016j,0s,0n),+0s,2299161j)>

# 翌日
today + 1						# => #<Date: 2014-12-25 ((2457017j,0s,0n),+0s,2299161j)> # !> possibly useless use of + in void context
today.succ						# => #<Date: 2014-12-25 ((2457017j,0s,0n),+0s,2299161j)>
today.next						# => #<Date: 2014-12-25 ((2457017j,0s,0n),+0s,2299161j)>

# 昨日
today -1 						# => #<Date: 2014-12-23 ((2457015j,0s,0n),+0s,2299161j)> # !> possibly useless use of - in void context

# 1ヶ月前
today << 1						# => #<Date: 2014-11-24 ((2456986j,0s,0n),+0s,2299161j)>

# 1ヶ月後
today >> 1		                # => #<Date: 2015-01-24 ((2457047j,0s,0n),+0s,2299161j)>

# n日後（引数のデフォルトは１。以下同）
today.next_day(3)				# => #<Date: 2014-12-27 ((2457019j,0s,0n),+0s,2299161j)>

# n日前
today.prev_day(3)				# => #<Date: 2014-12-21 ((2457013j,0s,0n),+0s,2299161j)>

# nヶ月後
today.next_month(3)				# => #<Date: 2015-03-24 ((2457106j,0s,0n),+0s,2299161j)>

# nヶ月前
today.prev_month				# => #<Date: 2014-11-24 ((2456986j,0s,0n),+0s,2299161j)>

# n年後
today.next_year(3)				# => #<Date: 2017-12-24 ((2458112j,0s,0n),+0s,2299161j)>

# n年前
today.prev_year(3)				# => #<Date: 2011-12-24 ((2455920j,0s,0n),+0s,2299161j)>

# 日付を表す文字列から日付オブジェクトを得る
Date.parse('Sun, 29 Jan 2012 14:14:09 +0900') # => #<Date: 2012-01-29 ((2455956j,0s,0n),+0s,2299161j)>
Date.parse('2012-06-28')					  # => #<Date: 2012-06-28 ((2456107j,0s,0n),+0s,2299161j)>
Date.parse('2012/06/28')					  # => #<Date: 2012-06-28 ((2456107j,0s,0n),+0s,2299161j)>
Date.parse('121212')						  # => #<Date: 2012-12-12 ((2456274j,0s,0n),+0s,2299161j)>
Date.parse('friday')						  # => #<Date: 2014-12-26 ((2457018j,0s,0n),+0s,2299161j)>

day = Date.new(2012,6,28)		# => #<Date: 2012-06-28 ((2456107j,0s,0n),+0s,2299161j)>
day.to_s						# => "2012-06-28"

# 各種フォーマットで表現された文字列を返す
day.iso8601						# => "2012-06-28"
day.httpdate					# => "Thu, 28 Jun 2012 00:00:00 GMT"
day.rfc2822						# => "Thu, 28 Jun 2012 00:00:00 +0000"
day.rfc3339						# => "2012-06-28T00:00:00+00:00"

# 各種フォーマットの文字列をパーズする（戻り値はdayオブジェクトと同じ）
Date.httpdate('Thu, 28 Jun 2012 00:00:00 GMT') # => #<Date: 2012-06-28 ((2456107j,0s,0n),+0s,2299161j)>
Date.iso8601('2012-06-28')					   # => #<Date: 2012-06-28 ((2456107j,0s,0n),+0s,2299161j)>
Date.rfc2822('Thu, 28 Jun 2012 00:00:00 +0000') # => #<Date: 2012-06-28 ((2456107j,0s,0n),+0s,2299161j)>
Date.rfc3339('2012-06-28T00:00:00+00:00')		# => #<Date: 2012-06-28 ((2456107j,0s,0n),+0s,2299161j)>

Date.strptime('2011年01月01日', '%Y年%m月%d日') # => #<Date: 2011-01-01 ((2455563j,0s,0n),+0s,2299161j)>
Date.strptime('20110101', '%Y年%m月%d日')		# ArgumentError: invalid date
