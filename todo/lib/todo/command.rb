# coding: utf-8
module Todo

   # コマンドラインベースの処理を行うクラスです
   # @author k2works
   class Command
	  # コマンドを実行する
	  # @retrun [void]
	  def execute
		 DB.prepare
	  end
	  # タスクを作成する
	  # @param name [String] 名前
	  # @param content [Sgtring] 内容
	  # @return [void]
	  def creaete_task(name, content)
		 # タスクの作成時のstatusはデフォルト値が使われてNOT_YETとなる
		 Task.create!(name: name, content: content).reload
	  end
	  # タスクを削除する
	  # @param id [Integer] ID
	  # @return [void]
	  def delete_task(id)
		 task = Task.find(id)
		 task.destroy
	  end
	  # タスクを更新する
	  # @param id [Integer] ID
	  # @param attributes [Hash{symbol => String}] 属性
	  def update_task(id, attributes)
		 if status_name = attributes[:status]
			attributes[:status] = Task::STATUS.fetch(status_name.upcase)
		 end

		 task = Task.find(id)
		 task.update_attributes! attributes

		 task.reload
	  end
	  # ステータスによる一覧取得
	  # @param status_name [String] ステータス
	  # @return all_tasks [Hash{symbol => String}] タスク一覧
	  def find_tasks(status_name)
		 all_tasks = Task.order('created_at DESC')

		 if status_name
			status = Task::STATUS.fetch(status_name.upcase)
			all_tasks.status_is(status)
		 else
			all_tasks
		 end
	  end
   end
end
