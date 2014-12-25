Ruby再入門
===
# 目的
パーフェクトRuby再入門
# 前提
| ソフトウェア     | バージョン    | 備考         |
|:---------------|:-------------|:------------|
| OS X           |10.8.5        |             |
| rvm       　　　|1.26.3        |             |
| ruby      　　　|2.1.5        |             |

# 構成
+ [コマンドラインアプリケーション開発](#1)
+ [パート２](#2)
+ [パート３](#3)

# 詳細
## <a name="1">コマンドラインアプリケーション開発</a>
### Todo管理アプリケーションを作成する前に
#### Bundlerのインストール
```bash
$ gem install bundler
$ bundle gem todo -b
```
#### YARDによるドキュメント生成
_todo/todo.gemspec_

```bash
$ bundle exec rake -T
$ bundle exec rake yard
```

#### YARDをRakeタスクに追加する
_todo/Rakefile_

### CLIアプリケーションの作成
#### ファイル構成
| ファイルパス | クラス・モジュール名 | 概要 |
|:----------|:-----------------|:-----|
|lib/todo/command/options.rb | Todo::Command::Options | 入力されたコマンドライン引数を解析する |
|lib/todo/command.rb | Todo::Command | コマンドラインアプリケーションの処理全体を取り扱う |
|lib/todo/db.rb | Todo::DB | データベースの接続やテーブル作成に関わる処理を取り扱う |
|lib/todo/task.rb | Todo::Task | tasksテーブルに関わる処理を行う |

#### 実行ファイル
_todo/bin/todo_

#### Todo::Commandクラスの定義
_todo/lib/todo/command.rb_  
_todo/lib/todo.rb_  

### データベースアクセス処理とCommandクラス
#### データベースへのアクセス処理
+ ActiveRecordのインストール
+ データベースの接続とテーブル定義

#### モデルクラスの作成

#### タスクの登録とデータベースの接続処理

#### タスク操作の残りの処理

#### データの入力チェック

### コマンドラインからの引数解析

#### コマンドライン引数をCommandクラスに渡す

#### コマンドライン引数の仕様と解析処理

+ 引数解析用モジュールの作成
+ OptionParserで引数の解析を行う
+ OptionParserでサブコマンド形式の引数を解析する
+ ヘルプの表示を作成する

## <a name="2">パート２</a>
## <a name="3">パート３</a>

# 参照
