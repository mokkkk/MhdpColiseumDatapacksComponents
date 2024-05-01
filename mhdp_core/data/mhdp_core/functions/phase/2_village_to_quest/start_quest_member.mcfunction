#> mhdp_core:phase/2_village_to_quest/start_quest_member
#
# 村→クエスト移行時の開始処理 クエスト参加者に対しての実行
#
# @within function mhdp_core:phase/2_village_to_quest/start

# 移動を禁止
    effect give @s resistance 10 10 true
    effect give @s slowness 10 10 true
    attribute @s generic.jump_strength modifier add f-f-f-f-1 "クエスト出発前移動禁止" -10 add_value

# TODO:武器データを取得し、武器を外す

# TODO:防具の固定
