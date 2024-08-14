#> mhdp_monster_dino:core/tick/animation/event/breath_move_l/main
#
# アニメーションイベントハンドラ ブレス
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 弱めの軸合わせ
    execute if score @s aj.breath_move_l.frame matches 1..62 run tag @n[tag=Mns.Target.Dino] add Temp.Rotate.Target
    execute if score @s aj.breath_move_l.frame matches 1..62 at @s run function mhdp_monsters:core/util/other/turn_to_target_accurate

# 移動
    execute if score @s aj.breath_move_l.frame matches 12..19 at @s run tp @s ^0.1 ^ ^
    execute if score @s aj.breath_move_l.frame matches 20..35 at @s run tp @s ^0.4 ^ ^0.3
    execute if score @s aj.breath_move_l.frame matches 36..45 at @s run tp @s ^0.8 ^ ^0.4
    execute if score @s aj.breath_move_l.frame matches 46..55 at @s run tp @s ^0.2 ^ ^
    execute if score @s aj.breath_move_l.frame matches 56..62 at @s run tp @s ^0.1 ^ ^

# 効果音
    execute if score @s aj.breath_move_l.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.breath_move_l.frame matches 20..37 on passengers if entity @s[tag=aj.data] run function mhdp_monster_dino:core/tick/animation/event/breath_move_l/m.particle_head with entity @s data.locators.pos_head
    execute if score @s aj.breath_move_l.frame matches 38..42 run playsound minecraft:entity.ravager.attack master @a[tag=!Ply.State.IsSilent,distance=..48] ~ ~ ~ 1 0.8 0.4
    execute if score @s aj.breath_move_l.frame matches 38..42 run playsound minecraft:entity.hoglin.attack master @a[tag=!Ply.State.IsSilent,distance=..48] ~ ~ ~ 1 0.65 0.4
    execute if score @s aj.breath_move_l.frame matches 38..49 run playsound minecraft:item.mace.smash_ground master @a[tag=!Ply.State.IsSilent,distance=..48] ~ ~ ~ 1 0.8 0.4
    execute if score @s aj.breath_move_l.frame matches 38..49 run playsound minecraft:item.mace.smash_ground master @a[tag=!Ply.State.IsSilent,distance=..48] ~ ~ ~ 1 0.6 0.4

    execute if score @s aj.breath_move_l.frame matches 13 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.breath_move_l.frame matches 34 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.breath_move_l.frame matches 44 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.breath_move_l.frame matches 47 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.breath_move_l.frame matches 64 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    
    execute if score @s aj.breath_move_l.frame matches 35 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1.8 0.1 1.8 0 30
    execute if score @s aj.breath_move_l.frame matches 44 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1.8 0.1 1.8 0 30

# 攻撃
    execute if score @s aj.breath_move_l.frame matches 33 positioned as @n[tag=Mns.Target.Dino] run summon area_effect_cloud ~ ~0.1 ~ {Duration:10,DurationOnUse:0,Tags:["Mns.ShotPos.Dino"]}
    execute if score @s aj.breath_move_l.frame matches 38 on passengers if entity @s[tag=aj.data] run function mhdp_monster_dino:core/tick/animation/event/breath_move_l/shot with entity @s data.locators.pos_head

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.breath_move_l.frame matches 85 run function mhdp_monster_dino:core/tick/animation/event/breath_move_l/end
