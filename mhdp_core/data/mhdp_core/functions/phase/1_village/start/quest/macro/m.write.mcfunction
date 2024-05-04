#> mhdp_core:phase/1_village/start/quest/macro/m.write
#
# クエスト内容の出力
#
# @within function mhdp_core:phase/1_village/start/quest/put_to_book

# 非表示の場合、スキップ


# 記入
    # $data modify storage mhdp_core:temp BookPages.Lower append value '[{"text":$(Name)},{"text":"\\n制限時間：$(ID)"}]'
    # $tellraw @a $(Name)
    # $say $(Name)

    # data modify storage mhdp_core:temp BookPages.Lower append value '{"nbt":"QuestList[{ID:0}].Name","storage":"mhdp_core:game_data","interpret":true}'
    # tellraw @a {"interpret":true,"nbt":"TargetQuest.Name","storage":"mhdp_core:temp"}

    $data modify storage mhdp_core:temp Page set value '[\
        {"text":"$(State)\\n","bold":true,"color":$(Color)},\
        {"text":"$(Name)\\n\\n","bold":true,"color":black},\
        {"text":"難易度：","bold":false,"color":black},\
        {"text":"$(Level)\\n","bold":false,"color":gold},\
        {"text":"ターゲット：\\n\\n","bold":false,"color":black},\
        {"text":"報酬金：$(Reward)エメラルド\\n","bold":false,"color":black},\
        {"text":"目的地：$(Field)\\n","bold":false,"color":black},\
        {"text":"制限時間：$(TimeLimit)分\\n","bold":false,"color":black},\
        {"text":"失敗条件：$(DeathCount)回力尽きる\\n\\n\\n","bold":false,"color":black},\
        {"text":"                    [受注]","bold":false,"color":red,"clickEvent":{"action":"run_command","value":"/trigger Ply.Ope.AcceptedQuestId set $(ID)"}}\
    ]'

    # $data modify storage mhdp_core:temp Page set value '[\
    #     {"text":"$(State)\\n","bold":true,"color":$(Color)},\
    #     {"text":"$(Name)\\n\\n","bold":true,"color":black},\
    #     {"text":"難易度：","bold":false,"color":black},\
    #     {"text":"$(Level)\\n","bold":false,"color":gold},\
    #     {"text":"ターゲット：\\n\\n","bold":false,"color":black},\
    #     {"text":"報酬金：$(Reward)エメラルド\\n","bold":false,"color":black},\
    #     {"text":"目的地：$(Field)\\n","bold":false,"color":black},\
    #     {"text":"制限時間：$(TimeLimit)分\\n","bold":false,"color":black},\
    #     {"text":"失敗条件：$(DeathCount)回力尽きる\\n\\n\\n","bold":false,"color":black},\
    #     {"text":"                    [受注]","bold":false,"color":red,"clickEvent":{"action":"run_command","value":"/trigger Ply.Ope.AcceptedQuestId set $(ID)"}}\
    # ]'

    # {"text":"                    [受注$(ID)]","bold":false,"color":red,"clickEvent":{"action":"run_command","value":"/function mhdp_core:phase/1_village/quest_book/click_accept"}}\ 
    
    data modify storage mhdp_core:temp BookPages.Lower append from storage mhdp_core:temp Page
    data remove storage mhdp_core:temp Page
