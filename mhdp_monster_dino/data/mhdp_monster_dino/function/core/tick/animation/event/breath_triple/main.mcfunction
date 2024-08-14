#> mhdp_monster_dino:core/tick/animation/event/breath_triple/main
#
# アニメーションイベントハンドラ ブレス
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 弱めの軸合わせ
    execute if score @s aj.breath_triple.frame matches 1 run function mhdp_monster_dino:core/tick/animation/event/breath_triple/turn_start
    execute if score @s aj.breath_triple.frame matches 12 run function mhdp_monster_dino:core/tick/animation/event/breath_triple/turn_start
    execute if score @s aj.breath_triple.frame matches 1..23 at @s run function mhdp_monsters:core/util/other/turn_to_target_rotate

# 移動
    # execute if score @s aj.breath_triple.frame matches 1..5 if entity @n[tag=Mns.Target.Dino,distance=..9] at @s run tp @s ^ ^ ^-0.3
    # execute if score @s aj.breath_triple.frame matches 6..10 at @s run tp @s ^ ^ ^-0.1
    # execute if score @s aj.breath_triple.frame matches 20..25 unless entity @n[tag=Mns.Target.Dino,distance=..7] at @s run tp @s ^ ^ ^0.5
    # execute if score @s aj.breath_triple.frame matches 43..58 at @s run tp @s ^ ^ ^-0.1

# 効果音
    execute if score @s aj.breath_triple.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.breath_triple.frame matches 2..24 on passengers if entity @s[tag=aj.data] run function mhdp_monster_dino:core/tick/animation/event/breath_triple/m.particle_head with entity @s data.locators.pos_head
    execute if score @s aj.breath_triple.frame matches 27..31 run playsound minecraft:entity.ravager.attack master @a[tag=!Ply.State.IsSilent,distance=..48] ~ ~ ~ 1 0.8 0.4
    execute if score @s aj.breath_triple.frame matches 27..31 run playsound minecraft:entity.hoglin.attack master @a[tag=!Ply.State.IsSilent,distance=..48] ~ ~ ~ 1 0.65 0.4
    execute if score @s aj.breath_triple.frame matches 27..28 run playsound minecraft:item.mace.smash_ground master @a[tag=!Ply.State.IsSilent,distance=..48] ~ ~ ~ 1 0.8 0.4
    execute if score @s aj.breath_triple.frame matches 27..28 run playsound minecraft:item.mace.smash_ground master @a[tag=!Ply.State.IsSilent,distance=..48] ~ ~ ~ 1 0.6 0.4

# 攻撃
    execute if score @s aj.breath_triple.frame matches 23 positioned as @n[tag=Mns.Target.Dino] run summon area_effect_cloud ~ ~0.1 ~ {Duration:25,DurationOnUse:0,Tags:["Mns.ShotPos.Dino.0"]}
    execute if score @s aj.breath_triple.frame matches 23 positioned as @n[tag=Mns.ShotPos.Dino.0] facing entity @s feet rotated ~ 0 run summon area_effect_cloud ^-8 ^ ^3 {Duration:10,DurationOnUse:0,Tags:["Mns.ShotPos.Dino.1"]}
    execute if score @s aj.breath_triple.frame matches 23 positioned as @n[tag=Mns.ShotPos.Dino.0] facing entity @s feet rotated ~ 0 run summon area_effect_cloud ^8 ^ ^3 {Duration:43,DurationOnUse:0,Tags:["Mns.ShotPos.Dino.2"]}
    execute if score @s aj.breath_triple.frame matches 30 on passengers if entity @s[tag=aj.data] run function mhdp_monster_dino:core/tick/animation/event/breath_triple/shot_0 with entity @s data.locators.pos_head
    execute if score @s aj.breath_triple.frame matches 47 on passengers if entity @s[tag=aj.data] run function mhdp_monster_dino:core/tick/animation/event/breath_triple/shot_1 with entity @s data.locators.pos_head
    execute if score @s aj.breath_triple.frame matches 64 on passengers if entity @s[tag=aj.data] run function mhdp_monster_dino:core/tick/animation/event/breath_triple/shot_2 with entity @s data.locators.pos_head

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.breath_triple.frame matches 112 run function mhdp_monster_dino:core/tick/animation/event/breath_triple/end
