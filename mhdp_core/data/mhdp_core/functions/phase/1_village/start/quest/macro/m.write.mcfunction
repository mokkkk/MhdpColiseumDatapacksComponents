#> mhdp_core:phase/1_village/start/quest/macro/m.write
#
# クエスト内容の出力
#
# @within function mhdp_core:phase/1_village/start/quest/put_to_book

# 非表示の場合、スキップ


# 記入
    $data modify block 241 64 215 Book.components."minecraft:written_book_content".pages append value {raw:'[\
        {"text":"$(State)\\n","bold":true,"color":$(Color)},\
        {"text":"$(Name)\\n\\n","bold":true,"color":black},\
        {"text":"難易度：","bold":false,"color":black},\
        {"text":"$(Level)\\n","bold":false,"color":gold},\
        {"text":"ターゲット：\\n","bold":false,"color":black},\
        $(Monster1),\
        {"text":" "},\
        $(Monster2),\
        {"text":" "},\
        $(Monster3),\
        {"text":" "},\
        $(Monster4),\
        {"text":" "},\
        $(Monster5),\
        {"text":"\\n\\n"},\
        {"text":"報酬金：$(Reward)エメラルド\\n","bold":false,"color":black},\
        {"text":"目的地：$(Field)\\n","bold":false,"color":black},\
        {"text":"制限時間：$(TimeLimit)分\\n","bold":false,"color":black},\
        {"text":"失敗条件：$(DeathCount)回力尽きる\\n\\n","bold":false,"color":black},\
        {"text":"                    [受注]","bold":false,"color":red,"clickEvent":{"action":"run_command","value":"/trigger Ply.Ope.AcceptedQuestId set $(ID)"}}\
    ]'}

# 終了
    data modify storage mhdp_core:temp BookPages.Lower append from storage mhdp_core:temp Page
    data remove storage mhdp_core:temp Page
    data modify block 241 64 215 Book.components."minecraft:written_book_content".resolved set value 0b
