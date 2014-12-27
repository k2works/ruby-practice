# coding: utf-8
module Todo

   # コマンドラインベースの処理を行うクラスです
   # @author k2works
   class Command
	  def self.run(argv)
		 new(argv).execute
	  end

	  def initialize(argv)
		 @argv = argv
	  end
	  # コマンドを実行する
	  # @retrun [void]
	  def execute
		 options = Options.parse!(@argv)
		 sub_command = options.delete(:command)

		 # rackupして自前のWebインターフェースを立ち上げる
		 if sub_command == 'server'
			puts 'Start server process..'
			port_option = options[:port].nil? ? '' : "-p #{options[:port]}"

			config = File.expand_path(File.join(File.dirname(__FILE__), '..','..','config.ru'))
			exec "cd #{File.dirname(config)} && rackup -E production #{port_option} #{config}"
		 end
		 
		 DB.prepare

		 tasks = case sub_command
				 when 'create'
					create_task(options[:name], options[:content])
				 when 'delete'
					delete_task(options[:id])
				 when 'update'
					update_task(options.delete(:id), options)
				 when 'list'
					find_tasks(options[:status])
				 end
		 display_tasks tasks

	  rescue => e
		 abort "Error: #{e.message}"
	  end
	  # タスクを作成する
	  # @param name [String] 名前
	  # @param content [Sgtring] 内容
	  # @return [void]
	  def create_task(name, content)
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

	  private

	  # Taskのレコードを整形して出力する
	  # @param [Todo::Task, ActiveRecord::Relation] tasks 出力するレコード
	  # @return [void]
	  def display_tasks(tasks)
		 header = display_format('ID','Name','Content','Status')

		 puts header
		 Array(tasks).each do |task|
			puts display_format(task.id, task.name,task.content, task.status_name)
		 end		 
	  end

	  # Taskのレコードを整形する
	  # @param [Fixnum, String] id       レコードのid
	  # @param [String]         name     レコードのname
	  # @param [String]         content  レコードのcontent
	  # @param [String]         status   レコードのstatus
	  # @return [string] 表示用に整形された文字列
	  def display_format(id,name,content,status)
		 name_length    = 20 - full_width_count(name)
		 content_length = 40 - full_width_count(content)		 
		 [id.to_s.rjust(4), name.ljust(name_length), content.ljust(content_length),status.center(10)].join(' | ')
	  end

	  def full_width_count(string)
		 string.each_char.select{ |char| !(/[ -~。-゜]/.match(char))}.count
	  end
   end
end
