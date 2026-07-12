#> mhdp_monster_dino:core/tick/animation/event/step_l_to_jumptail_r/main
#
# アニメーションイベントハンドラ ブレス
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 弱めの軸合わせ
    execute if score @s aj.step_l_to_jumptail_r.frame matches 1..35 run tag @n[tag=Mns.Target.Dino] add Temp.Rotate.Target
    execute if score @s aj.step_l_to_jumptail_r.frame matches 1..35 at @s run function mhdp_monsters:core/util/other/turn_to_target_accurate

# 移動
    execute if score @s aj.step_l_to_jumptail_r.frame matches 1..15 at @s run tp @s ^0.1 ^ ^0.1
    execute if score @s aj.step_l_to_jumptail_r.frame matches 16..20 at @s run tp @s ^0.7 ^ ^0.3
    execute if score @s aj.step_l_to_jumptail_r.frame matches 21..28 at @s run tp @s ^0.9 ^ ^0.2
    execute if score @s aj.step_l_to_jumptail_r.frame matches 28..36 at @s run tp @s ^0.2 ^ ^

# 効果音
    execute if score @s aj.step_l_to_jumptail_r.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.step_l_to_jumptail_r.frame matches 38..42 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.ravager.attack master @s ^ ^1 ^1 0.4 0.8 0.4
    execute if score @s aj.step_l_to_jumptail_r.frame matches 38..42 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.hoglin.attack master @s ^ ^1 ^1 0.4 0.65 0.4
    execute if score @s aj.step_l_to_jumptail_r.frame matches 38..49 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:item.mace.smash_ground master @s ^ ^1 ^1 0.4 0.8 0.4
    execute if score @s aj.step_l_to_jumptail_r.frame matches 38..49 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:item.mace.smash_ground master @s ^ ^1 ^1 0.4 0.6 0.4
    execute if score @s aj.step_l_to_jumptail_r.frame matches 13 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.step_l_to_jumptail_r.frame matches 28 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.step_l_to_jumptail_r.frame matches 33 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.step_l_to_jumptail_r.frame matches 13 run particle block{block_state:"minecraft:sand"} ^ ^0.1 ^2 1.8 0.1 1.8 0 30
    execute if score @s aj.step_l_to_jumptail_r.frame matches 28 run particle block{block_state:"minecraft:sand"} ^ ^0.1 ^2 1.8 0.1 1.8 0 30

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    execute if score @s aj.step_l_to_jumptail_r.frame matches 36 run function mhdp_monster_dino:core/tick/animation/event/step_l_to_jumptail_r/end
