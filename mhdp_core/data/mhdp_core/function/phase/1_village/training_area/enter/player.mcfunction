#> mhdp_core:phase/1_village/training_area/enter/player
#
# 訓練所に移動する プレイヤー初期化処理
#
# @within function 

# チェック：クエスト参加中は利用不可
    execute if entity @s[tag=Ply.State.QuestHost] run return run tellraw @s {"text":"【クエスト受注中は訓練所を利用できません】"}
    execute if entity @s[tag=Ply.State.QuestMember] run return run tellraw @s {"text":"【クエスト参加中は訓練所を利用できません】"}

# 武器の使用開始処理
# 村→クエストPhaseでの処理を流用する
    function mhdp_core:phase/2_village_to_quest/start/quest_member
    function mhdp_core:phase/2_village_to_quest/change_phase/setup/player/main
    tag @s remove Ply.State.PlayingQuest

# 訓練所利用タグを付与
    tag @s add Ply.State.IsTraining

# 訓練所に移動
# TODO:マップの適用が終わったら座標を更新する
    tp @s 139 58 -10 -90 ~
