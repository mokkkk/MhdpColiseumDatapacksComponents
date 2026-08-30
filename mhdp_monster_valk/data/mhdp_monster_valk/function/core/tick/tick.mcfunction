#> mhdp_monster_valk:core/tick/tick
#
# tick処理
#
# @within function mhdp_monsters:core/switch/macro/m.tick

# メイン処理
    function mhdp_monster_valk:core/tick/main

# 怒り中、Mns.Anger.Speed ごとにメイン処理を再度実行 (行動高速化)
    execute if entity @s[tag=Mns.State.IsAnger] run scoreboard players add @s Mns.Temp.AngerSpeed.Timer 1
    execute if entity @s[tag=!Mns.State.IsDisableAngerSpeed] if score @s Mns.Temp.AngerSpeed.Timer >= @s Mns.Anger.Speed at @s run function mhdp_monster_valk:core/tick/main
    execute if score @s Mns.Temp.AngerSpeed.Timer >= @s Mns.Anger.Speed run scoreboard players set @s Mns.Temp.AngerSpeed.Timer 0

#TODO: 弾処理は valk 固有ではなく assets(mhdp_core:assets/object) 側で行う。
#      弾の召喚は dino と同様に api:object/summon.m {ObjectId:...} を使う形に Stage 6 で再構築する。
