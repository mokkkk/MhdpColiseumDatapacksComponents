#> mhdp_monster_ranposu:core/summon/summon
#
# 召喚処理を行う
#
# @within function 

# モデル召喚
    function animated_java:ranposu_aj/summon

# アニメーション種別を待機に設定
    tag @e[type=item_display,tag=Mns.Root.Ranposu] add Mns.Temp.IsIdleAnimation

# Rootエンティティ対象に初期化処理を実行
    execute as @e[type=item_display,tag=Mns.Root.Ranposu] at @s run function mhdp_monster_ranposu:core/summon/summon_init

say ドスランポス召喚処理