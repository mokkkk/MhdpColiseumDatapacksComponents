#> mhdp_core:phase/1_village/start/quest/main
#
# 村Phase開始・更新処理 クエスト受注書の更新
#
# @within function mhdp_core:phase/1_village/start/main

# クエスト一覧をコピー
    data modify storage mhdp_core:temp TempQuestList set from storage mhdp_core:game_data QuestList

# 書見台をリセット
    # 下位 241 64 215
        # data modify block 241 64 215 Book.components."minecraft:written_book_content" set value {"title": "クエスト一覧書","author": "コハク","resolved":false,"pages": []}
        data modify block 241 64 215 Book.components."minecraft:written_book_content" set value {"title": "クエスト一覧書","author": "","resolved":false,"pages": [{raw:'[{"text":""}]'}]}
        data modify storage mhdp_core:temp BookPages.Lower set value []
    # 上位
    # 特殊

# クエスト受注書を作成する
    execute if data storage mhdp_core:temp TempQuestList[0] run function mhdp_core:phase/1_village/start/quest/put_to_book

# 適用
    # data modify block 241 64 215 Book.components."minecraft:written_book_content".pages set from storage mhdp_core:temp BookPages.Lower
    data remove block 241 64 215 Book.components."minecraft:written_book_content".pages[0]
    data modify block 241 64 215 Book.components."minecraft:written_book_content".resolved set value 0b

# 終了
    data remove storage mhdp_core:temp BookPages
    data remove storage mhdp_core:temp TempQuestList
