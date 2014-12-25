# coding: utf-8
require 'time'

# Time#parseはTimeオブジェクトを返す
Time.parse('2011-04-01 16:01').class # => Time

# 様々な形式の時刻を表す文字列をTimeオブジェクトに変換する
Time.parse('2011-04-01 16:01')	# => 2011-04-01 16:01:00 +0900
Time.parse('2011/04/01 16:01')	# => 2011-04-01 16:01:00 +0900
Time.parse('2012-01-29 14:13:08 +900')	# => 2011-04-01 16:01:00 +0900
Time.parse('Sun, 29 Jan 2012 14:14:09 +0900')	# => 2011-04-01 16:01:00 +0900
Time.parse('2012-01-29-T14:14:49+09:00')	# => 2011-04-01 16:01:00 +0900
Time.parse('2012012914144909')	# => 2011-04-01 16:01:00 +0900

time = Time.parse('2011-04-01 16:01') # => 2011-04-01 16:01:00 +0900

# 各種フォーマットで表現された文字列を返す
time.iso8601					# => "2011-04-01T16:01:00+09:00"
time.httpdate					# => "Fri, 01 Apr 2011 07:01:00 GMT"
time.rfc2822					# => "Fri, 01 Apr 2011 16:01:00 +0900"

# 様々なフォーマットの文字列をパーズする
Time.iso8601('2011-04-01T16:01:00+09:00') # => 2011-04-01 07:01:00 UTC
Time.httpdate('Fri, 01 Apr 2011 07:01:00 GMT') # => 2011-04-01 16:01:00 +0900
Time.rfc2822('Fri, 01 Apr 2011 16:01:00 +0900') # => 2011-04-01 16:01:00 +0900

# 第一引数に渡した時刻の文字列を第二引数に指定したフォーマットで解析し、Timeオブジェクトを生成する
Time.strptime('2011年4月01日','%Y年%m月%d日') # => 2011-04-01 00:00:00 +0900
Time.strptime('2011401','%Y年%m月%d日')		  # => `strptime': invalid strptime format - `%Y年%m月%d日' (ArgumentError)