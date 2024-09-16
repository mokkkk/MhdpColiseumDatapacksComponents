#> mhdp_monster_valk:core/tick/animation/event/lance_flytackle_end/main
#
# アニメーションイベントハンドラ 滑空突進終了
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 移動
    execute if score @s aj.lance_flytackle_end.frame matches 1..7 at @s run tp @s ^ ^ ^1 ~-3 ~
    execute if score @s aj.lance_flytackle_end.frame matches 8..16 at @s run tp @s ^ ^ ^ ~21 ~
    execute if score @s aj.lance_flytackle_end.frame matches 20..24 at @s run tp @s ^ ^ ^-0.1 ~1 ~
    execute if score @s aj.lance_flytackle_end.frame matches 25..32 at @s run tp @s ^ ^ ^-0.05
    execute if score @s aj.lance_flytackle_end.frame matches 8 at @s run function mhdp_monster_valk:core/tick/animation/event/lance_flytackle_end/move_start
    execute if score @s aj.lance_flytackle_end.frame matches 8..19 at @s run function mhdp_monsters:core/util/other/move_to_target_move

# 演出
    execute if score @s aj.lance_flytackle_end.frame matches 2..8 run particle dust{color:[1.000,0.412,0.412],scale:4} ^ ^2 ^-3 0.5 0.5 0.5 0.15 3
    execute if score @s aj.lance_flytackle_end.frame matches 2..8 run particle dust{color:[1.000,0.412,0.412],scale:4} ^ ^2 ^-2 0.5 0.5 0.5 0.15 3
    execute if score @s aj.lance_flytackle_end.frame matches 2..8 run particle dust{color:[1.000,0.569,0.569],scale:4} ^ ^2 ^-3 0.5 0.5 0.5 0.15 3
    execute if score @s aj.lance_flytackle_end.frame matches 2..8 run particle dust{color:[1.000,0.569,0.569],scale:4} ^ ^2 ^-2 0.5 0.5 0.5 0.15 3
    execute if score @s aj.lance_flytackle_end.frame matches 2..31 run function mhdp_monster_valk:core/tick/animation/event/lance_flytackle_end/particle

# 効果音
    execute if score @s aj.lance_flytackle_end.frame matches 8 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_flytackle_end.frame matches 8 run playsound item.mace.smash_air master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_flytackle_end.frame matches 8..20 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_flytackle_end.frame matches 8..20 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_flytackle_end.frame matches 8 run particle explosion ^ ^0.5 ^ 2 0.8 2 0 10
    execute if score @s aj.lance_flytackle_end.frame matches 8..26 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 10
    execute if score @s aj.lance_flytackle_end.frame matches 39..41 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 1.1 0.4
    execute if score @s aj.lance_flytackle_end.frame matches 39..41 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 0.9 0.4
    execute if score @s aj.lance_flytackle_end.frame matches 39..41 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 0.7 0.4
    execute if score @s aj.lance_flytackle_end.frame matches 39 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.allay.hurt master @s ^ ^1 ^1 0.4 1.5 0.4
    execute if score @s aj.lance_flytackle_end.frame matches 39 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.allay.hurt master @s ^ ^1 ^1 0.4 1.2 0.4

# 攻撃
    execute if score @s aj.lance_flytackle_end.frame matches 2..8 run function mhdp_monster_valk:core/tick/animation/event/lance_flytackle_end/attack

# モデル演出
    execute if score @s aj.lance_flytackle_end.frame matches 35 run function mhdp_monster_valk:core/util/models/ignite_end

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 状態
    execute if score @s aj.lance_flytackle_end.frame matches 8 run tag @s remove Mns.State.IsFlying

# 終了
    execute if score @s aj.lance_flytackle_end.frame matches 67 run function mhdp_monster_valk:core/tick/animation/event/lance_flytackle_end/end
