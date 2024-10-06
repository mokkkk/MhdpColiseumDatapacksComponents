#> mhdp_monster_valk:core/tick/animation/event/lance_flytackle_repeat/main
#
# アニメーションイベントハンドラ 滑空突進折り返し
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

## 停止
# 移動
    execute if score @s aj.lance_flytackle_repeat.frame matches 1..7 at @s run tp @s ^ ^ ^2 ~-3 ~
    execute if score @s aj.lance_flytackle_repeat.frame matches 8..16 at @s run tp @s ^ ^ ^ ~21 ~
    execute if score @s aj.lance_flytackle_repeat.frame matches 20..24 at @s run tp @s ^ ^ ^-0.1 ~1 ~
    execute if score @s aj.lance_flytackle_repeat.frame matches 8 at @s run function mhdp_monster_valk:core/tick/animation/event/lance_flytackle_repeat/move_start
    execute if score @s aj.lance_flytackle_repeat.frame matches 8..19 at @s run function mhdp_monsters:core/util/other/move_to_target_move

# 演出
    execute if score @s aj.lance_flytackle_repeat.frame matches 2..8 run particle dust{color:[1.000,0.112,0.312],scale:4} ^ ^2 ^-3 0.5 0.5 0.5 0.15 3
    execute if score @s aj.lance_flytackle_repeat.frame matches 2..8 run particle dust{color:[1.000,0.112,0.312],scale:4} ^ ^2 ^-2 0.5 0.5 0.5 0.15 3
    # execute if score @s aj.lance_flytackle_repeat.frame matches 2..8 run particle dust{color:[1.000,0.369,0.369],scale:4} ^ ^2 ^-3 0.5 0.5 0.5 0.15 3
    # execute if score @s aj.lance_flytackle_repeat.frame matches 2..8 run particle dust{color:[1.000,0.369,0.369],scale:4} ^ ^2 ^-2 0.5 0.5 0.5 0.15 3
    execute if score @s aj.lance_flytackle_repeat.frame matches 2..31 run function mhdp_monster_valk:core/tick/animation/event/lance_flytackle_repeat/particle_end
    execute if score @s aj.lance_flytackle_repeat.frame matches 2..6 run tp @n[type=text_display,tag=Mns.Shot.Valk.Vfx.RedFlash,tag=Mns.Shot.Valk.Vfx.RedFlash.Long] ^ ^3 ^
    execute if score @s aj.lance_flytackle_repeat.frame matches 7.. run kill @n[type=text_display,tag=Mns.Shot.Valk.Vfx.RedFlash,tag=Mns.Shot.Valk.Vfx.RedFlash.Long]

# 効果音
    execute if score @s aj.lance_flytackle_repeat.frame matches 8 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_flytackle_repeat.frame matches 8 run playsound item.mace.smash_air master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_flytackle_repeat.frame matches 8..20 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_flytackle_repeat.frame matches 8..20 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_flytackle_repeat.frame matches 8 run particle explosion ^ ^0.5 ^ 2 0.8 2 0 10
    execute if score @s aj.lance_flytackle_repeat.frame matches 8..26 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 10

# 攻撃
    execute if score @s aj.lance_flytackle_repeat.frame matches 2..8 run function mhdp_monster_valk:core/tick/animation/event/lance_flytackle_repeat/attack

# モデル演出
    execute if score @s aj.lance_flytackle_repeat.frame matches 20 run function mhdp_monster_valk:core/util/models/ignite_end

## 折り返し
# 軸合わせ
    execute if score @s aj.lance_flytackle_repeat.frame matches 26..42 run tag @n[tag=Mns.Target.Valk] add Temp.Rotate.Target
    execute if score @s aj.lance_flytackle_repeat.frame matches 26..42 run function mhdp_monsters:core/util/other/turn_to_target_accurate

# 移動
    execute if score @s aj.lance_flytackle_repeat.frame matches 26..45 at @s run tp @s ^ ^ ^0.6
    execute if score @s aj.lance_flytackle_repeat.frame matches 46..53 at @s run tp @s ^ ^ ^2

# 効果音
    execute if score @s aj.lance_flytackle_repeat.frame matches 40 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_flytackle_repeat.frame matches 45 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_flytackle_repeat.frame matches 47 run playsound entity.breeze.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.5
    execute if score @s aj.lance_flytackle_repeat.frame matches 47 run playsound entity.breeze.jump master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.5
    execute if score @s aj.lance_flytackle_repeat.frame matches 47 run playsound entity.breeze.jump master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.6
    execute if score @s aj.lance_flytackle_repeat.frame matches 45 run playsound entity.blaze.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.5
    execute if score @s aj.lance_flytackle_repeat.frame matches 45 run playsound entity.blaze.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.6

    execute if score @s aj.lance_flytackle_repeat.frame matches 26..38 run function mhdp_monster_valk:core/tick/animation/event/lance_flytackle_repeat/particle
    execute if score @s aj.lance_flytackle_repeat.frame matches 47 run function mhdp_monster_valk:core/tick/animation/event/lance_flytackle_repeat/particle_launch

# 移動位置決定
    execute if score @s aj.lance_flytackle_repeat.frame matches 42 positioned as @n[tag=Mns.Target.Valk] rotated ~ 0 positioned ^ ^0.5 ^ run summon area_effect_cloud ^ ^ ^ {Duration:200,DurationOnUse:0,Tags:["Mns.MovePos.Valk"]}
    execute if score @s aj.lance_flytackle_repeat.frame matches 42 as @n[type=area_effect_cloud,tag=Mns.MovePos.Valk] at @s run function mhdp_monsters:core/util/other/on_ground
    execute if score @s aj.lance_flytackle_repeat.frame matches 42 as @n[type=area_effect_cloud,tag=Mns.MovePos.Valk] at @s run tp @s ~ ~0.5 ~ ~ ~
    execute if score @s aj.lance_flytackle_repeat.frame matches 42 as @n[type=area_effect_cloud,tag=Mns.MovePos.Valk] positioned as @s if block ^ ^ ^5 #mhdp_core:no_collision run tp @s ^ ^ ^5
    execute if score @s aj.lance_flytackle_repeat.frame matches 42..53 if entity @n[type=area_effect_cloud,tag=Mns.MovePos.Valk,distance=..4] as @n[type=area_effect_cloud,tag=Mns.MovePos.Valk] run kill @s

# 攻撃
    execute if score @s aj.lance_flytackle_repeat.frame matches 48..53 run function mhdp_monster_valk:core/tick/animation/event/lance_flytackle_repeat/attack

# 演出
    execute if score @s aj.lance_flytackle_repeat.frame matches 42 positioned ^ ^3 ^ run summon text_display ^-1 ^ ^ {Tags:["Mns.Shot.Valk","Mns.Shot.Valk.Vfx.RedFlash","Mns.Shot.Valk.Vfx.RedFlash.Long"],default_background:0b,brightness:{sky:15,block:15},text:'{"text":"0","font":"vfx/valstrax"}',transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[12f,12f,12f]},background:16777215,text_opacity:255,interpolation_duration:1,teleport_duration:2,text_opacity:255,billboard:"center",alignment:"left"}
    execute if score @s aj.lance_flytackle_repeat.frame matches 42.. run tp @n[type=text_display,tag=Mns.Shot.Valk.Vfx.RedFlash,tag=Mns.Shot.Valk.Vfx.RedFlash.Long] ^ ^3 ^

# モデル演出
    execute if score @s aj.lance_flytackle_repeat.frame matches 43 run function mhdp_monster_valk:core/util/models/ignite_start

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 状態
    execute if score @s aj.lance_flytackle_repeat.frame matches 8 run tag @s remove Mns.State.IsFlying
    execute if score @s aj.lance_flytackle_repeat.frame matches 47 run tag @s add Mns.State.IsFlying

# 終了
    execute if score @s aj.lance_flytackle_repeat.frame matches 53 run function mhdp_monster_valk:core/tick/animation/event/lance_flytackle_repeat/end
