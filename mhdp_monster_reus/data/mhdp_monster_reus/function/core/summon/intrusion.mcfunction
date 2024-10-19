#> mhdp_monster_reus:core/summon/intrusion
#
# 乱入処理を行う
#
# @within function 

# モデル召喚
    function animated_java:reus_aj/summon

# アニメーション種別を召喚に設定
    tag @e[type=item_display,tag=Mns.Root.Reus] add Mns.Temp.IsSummonAnimation

# Rootエンティティ対象に初期化処理を実行
    execute as @e[type=item_display,tag=Mns.Root.Reus] at @s run function mhdp_monster_reus:core/summon/summon_init

# say モンスター処理：ドスランポス乱入処理