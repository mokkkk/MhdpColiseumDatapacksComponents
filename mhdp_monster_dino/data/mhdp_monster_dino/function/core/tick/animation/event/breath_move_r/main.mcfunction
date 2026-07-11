#> mhdp_monster_dino:core/tick/animation/event/breath_move_r/main
#
# アニメーションイベントハンドラ ブレス
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 弱めの軸合わせ
    execute if score @s aj.breath_move_r.frame matches 1..62 run tag @n[tag=Mns.Target.Dino] add Temp.Rotate.Target
    execute if score @s aj.breath_move_r.frame matches 1..62 at @s run function mhdp_monsters:core/util/other/turn_to_target_accurate

# 移動
    execute if score @s aj.breath_move_r.frame matches 12..19 at @s run tp @s ^-0.1 ^ ^
    execute if score @s aj.breath_move_r.frame matches 20..35 at @s run tp @s ^-0.4 ^ ^0.3
    execute if score @s aj.breath_move_r.frame matches 36..45 at @s run tp @s ^-1.2 ^ ^0.6
    execute if score @s aj.breath_move_r.frame matches 46..55 at @s run tp @s ^-0.2 ^ ^
    execute if score @s aj.breath_move_r.frame matches 56..62 at @s run tp @s ^-0.1 ^ ^

# 効果音
    execute if score @s aj.breath_move_r.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.breath.frame matches 20..37 run function animated_java_dino:dino/at_locator {name:"pos_head",command:"function mhdp_monster_dino:core/tick/animation/event/breath_move_r/particle_head"} 
    execute if score @s aj.breath_move_r.frame matches 38..42 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.ravager.attack master @s ^ ^1 ^1 0.4 0.8 0.4
    execute if score @s aj.breath_move_r.frame matches 38..42 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.hoglin.attack master @s ^ ^1 ^1 0.4 0.65 0.4
    execute if score @s aj.breath_move_r.frame matches 38..49 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:item.mace.smash_ground master @s ^ ^1 ^1 0.4 0.8 0.4
    execute if score @s aj.breath_move_r.frame matches 38..49 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:item.mace.smash_ground master @s ^ ^1 ^1 0.4 0.6 0.4
    execute if score @s aj.breath_move_r.frame matches 13 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.breath_move_r.frame matches 34 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.breath_move_r.frame matches 44 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.breath_move_r.frame matches 47 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.breath_move_r.frame matches 64 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.breath_move_r.frame matches 13 run particle block{block_state:"minecraft:sand"} ^ ^0.1 ^2 1.8 0.1 1.8 0 30
    execute if score @s aj.breath_move_r.frame matches 35 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1.8 0.1 1.8 0 30
    execute if score @s aj.breath_move_r.frame matches 44 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1.8 0.1 1.8 0 30

# 攻撃
    execute if score @s aj.breath_move_r.frame matches 33 positioned as @n[tag=Mns.Target.Dino] run summon area_effect_cloud ~ ~0.1 ~ {Duration:10,DurationOnUse:0,Tags:["Mns.ShotPos.Dino"],custom_particle:{type:"block",block_state:"minecraft:air"}}
    execute if score @s aj.breath_move_r.frame matches 38 run function animated_java_dino:dino/at_locator {name:"pos_head",command:"function mhdp_monster_dino:core/tick/animation/event/breath_move_r/attack"} 

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    execute if score @s aj.breath_move_r.frame matches 85 run function mhdp_monster_dino:core/tick/animation/event/breath_move_r/end
