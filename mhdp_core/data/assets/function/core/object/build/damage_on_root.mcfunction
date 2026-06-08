#> assets:core/object/build/damage_on_root
#
# 紐づけ

# インターバル中は処理を実行しない
    execute if score @s Build.Stats.DamageInterval matches 1.. run data modify storage api: Return.IsSkipped set value true
    execute if score @s Build.Stats.DamageInterval matches 1.. run return run tag @s remove Asset.Build.Target

# 処理実行
    data modify storage api: Return.IsSkipped set value false

# 計算
    scoreboard players operation @s Build.Stats.Hp -= #mhdp_temp_object_damage MhdpCore

# 演出
    particle block{block_state:"minecraft:oak_planks"} ~ ~2 ~ 1.5 1.5 1.5 0 25
    playsound entity.zombie.attack_wooden_door master @a ~ ~ ~ 1 1.2

# 破壊
    execute if score @s Build.Stats.Hp matches ..0 run playsound entity.zombie.break_wooden_door master @a ~ ~ ~ 1 1.2
    execute if score @s Build.Stats.Hp matches ..0 run function assets:core/object/remove

# インターバル設定
    scoreboard players set @s Build.Stats.DamageInterval 10

# 建築のHPが残っている場合
    data modify storage api: Return.IsRemainObject set value true

# タイプ取得
    execute if entity @s[tag=Asset.Build.Type.Wall] run data modify storage api: Return.IsWall set value true
    execute if entity @s[tag=Asset.Build.Type.Tower] run data modify storage api: Return.IsTower set value true

# 終了
    tag @s remove Asset.Build.Target
