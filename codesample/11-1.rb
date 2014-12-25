# coding: utf-8
require 'thread'

queue = Queue.new

# ワーカースレッドを３つ用意
workers = 3.times.map {|t|
   Thread.fork {
	  while req = queue.deq
		 puts "Worker#{t} processing.."
		 req.call
	  end
   }
}

# 10個のリクエスストをenqueueする
10.times do |t|
   queue.enq -> {
	  sleep 1 # 何らかの処理
   }
end

# すべてのキューが処理されるまで待つ
sleep 1 until queue.empty?

# キューが空になったので全スレッドがqueueを持っている
p workers.map(&:status)

3.times do |t|
   queue.enq -> {
	  sleep 1 # 何らかの処理
   }
end

# キューを処理している最中の状態を確認
p workers.map(&:status)

# すべてのキューが処理されるまで待つ
sleep 1 until queue.empty?
