#> mhdp_monster_tutorial_01:core/summon/intrusion
#
# 乱入処理を行う
#
# @within function 

# モデル召喚
    summon item_display ~ ~ ~ {Tags:["Mns.Root","Mns.Root.Tutorial01"]}

# アニメーション種別を召喚に設定
    tag @e[type=item_display,tag=Mns.Root.Tutorial01] add Mns.Temp.IsSummonAnimation

# Rootエンティティ対象に初期化処理を実行
    execute as @e[type=item_display,tag=Mns.Root.Tutorial01] at @s run function mhdp_monster_tutorial_01:core/summon/summon_init

say チュートリアル01乱入処理