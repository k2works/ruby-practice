# coding: utf-8
require 'date'

# 年月日からDateTimeオブジェクトを得る
date = DateTime.new(2011,4,1,4,4,23)
# => #<DateTime: 2011-04-01T04:04:23+00:00 ((2455653j,14663s,0n),+0s,2299161j)>

# 日時を指定した書式の文字列で表現する
date.strftime('%Y%m%d %H:%M:%S') # => "20110401 04:04:23"

# 現在時刻を表すDateTimeオブジェクトを得る
now = DateTime.now
# => #<DateTime: 2014-12-24T14:39:22+09:00 ((2457016j,20362s,297787000n),+32400s,2299161j)>

# ユリウス日・修正ユリウス日を得る
today.jd						# => 2457016
today.mjd						# => 57015

# 改暦日設定しなおした新しい日付オブジェクトを返す
now.new_start(Date::JULIAN)
=> #<DateTime: 2014-12-11T14:39:22+09:00 ((2457016j,20362s,297787000n),+32400s,Infj)>

# オフセット（時差）
offset = Rational(16,24)
datetime = DateTime.new(2011,9,30,13,13,59,offset)
# => #<DateTime: 2011-09-30T13:13:59+16:00 ((2455834j,76439s,0n),+57600s,2299161j)>
datetime.zone					# => "+16:00"

now = DateTime.now
# => #<DateTime: 2014-12-24T14:45:02+09:00 ((2457016j,20702s,669059000n),+32400s,2299161j)>
now.to_s						# => "2014-12-24T14:45:02+09:00"

# 様々な書式で出力する
now.httpdate					# => "Wed, 24 Dec 2014 05:45:02 GMT"
now.iso8601						# => "2014-12-24T14:45:02+09:00"
now.rfc2822						# => "Wed, 24 Dec 2014 14:45:02 +0900"
now.rfc3339						# => "2014-12-24T14:45:02+09:00"

# 様々な書式でパーズする
DateTime.httpdate('Tue, 03 Jul 2012 13:09:44 GMT')
# => #<DateTime: 2012-07-03T13:09:44+00:00 ((2456112j,47384s,0n),+0s,2299161j)>
DateTime.iso8601('2012-07-03T22:09:44+09:00')
# => #<DateTime: 2012-07-03T22:09:44+09:00 ((2456112j,47384s,0n),+32400s,2299161j)>
DateTime.rfc2822('Tue, 3 Jul 2012 22:09:44 +0900')
# => #<DateTime: 2012-07-03T22:09:44+09:00 ((2456112j,47384s,0n),+32400s,2299161j)>
DateTime.rfc3339('2012-07-03T22:09:44+09:00')
# => #<DateTime: 2012-07-03T22:09:44+09:00 ((2456112j,47384s,0n),+32400s,2299161j)>
