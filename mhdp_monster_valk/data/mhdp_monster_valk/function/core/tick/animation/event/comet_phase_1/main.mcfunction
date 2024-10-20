#> mhdp_monster_valk:core/tick/animation/event/comet_phase_1/main
#
# アニメーションイベントハンドラ 彗星・離陸
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# カウンターリセット
    execute if score @s aj.comet_phase_1.frame matches 2 run scoreboard players set @s Mns.Valk.PhaseCount.Comet 0

# 効果音
    execute if score @s aj.comet_phase_1.frame matches 2..15 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.allay.death master @s ^ ^1 ^1 0.3 1.7 0.3
    execute if score @s aj.comet_phase_1.frame matches 2..15 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.allay.death master @s ^ ^1 ^1 0.3 1.8 0.3
    execute if score @s aj.comet_phase_1.frame matches 2..25 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.3 2 0.3
    execute if score @s aj.comet_phase_1.frame matches 2..25 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.3 1.8 0.3
    execute if score @s aj.comet_phase_1.frame matches 2..35 run playsound entity.player.breath master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 2

    execute if score @s aj.comet_phase_1.frame matches 52 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.comet_phase_1.frame matches 56 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.comet_phase_1.frame matches 56 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 10
    execute if score @s aj.comet_phase_1.frame matches 70 positioned ^ ^16 ^16 run playsound entity.breeze.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.5
    execute if score @s aj.comet_phase_1.frame matches 70 positioned ^ ^16 ^16 run playsound entity.breeze.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.5
    execute if score @s aj.comet_phase_1.frame matches 70 positioned ^ ^16 ^16 run playsound entity.breeze.jump master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.5
    execute if score @s aj.comet_phase_1.frame matches 70 positioned ^ ^16 ^16 run playsound entity.breeze.jump master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.6
    execute if score @s aj.comet_phase_1.frame matches 70 positioned ^ ^16 ^16 run playsound entity.wither.death master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.8
    execute if score @s aj.comet_phase_1.frame matches 70 positioned ^ ^16 ^16 run playsound entity.wither.death master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.65
    execute if score @s aj.comet_phase_1.frame matches 59 positioned ^ ^16 ^16 run playsound entity.blaze.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.5
    execute if score @s aj.comet_phase_1.frame matches 59 positioned ^ ^16 ^16 run playsound entity.blaze.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.6

    execute if score @s aj.comet_phase_1.frame matches 59 run summon text_display ^ ^6 ^4 {Tags:["Mns.Shot.Valk","Mns.Shot.Valk.Vfx.RedFlash"],default_background:0b,brightness:{sky:15,block:15},text:'{"text":"0","font":"vfx/valstrax"}',transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[12f,12f,12f]},background:16777215,text_opacity:255,interpolation_duration:1,teleport_duration:2,text_opacity:255,billboard:"center",alignment:"left"}

    execute if score @s aj.comet_phase_1.frame matches 2..57 run function mhdp_monster_valk:core/tick/animation/event/comet_phase_1/particle
    execute if score @s aj.comet_phase_1.frame matches 58..70 run function mhdp_monster_valk:core/tick/animation/event/comet_phase_1/particle_launch

# 風圧怯み
    execute if score @s aj.comet_phase_1.frame matches 56 run data modify storage mhdp_core:temp Damage set value {WindValue:2,GuardValue:1}
    execute if score @s aj.comet_phase_1.frame matches 56 positioned ^ ^ ^ as @a[tag=Ply.State.EnableDamage,distance=..12] facing entity @s feet positioned as @s run function mhdp_core:player/damage/wind/main
    execute if score @s aj.comet_phase_1.frame matches 56 run data remove storage mhdp_core:temp Damage

# 演出
    execute if score @s aj.comet_phase_1.frame matches 70 at @s on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/comet_phase_1/m.summon_vfx with entity @s data.locators.shadow

# モデル演出
    execute if score @s aj.comet_phase_1.frame matches 2 run function mhdp_monster_valk:core/util/models/chest_glow_start
    execute if score @s aj.comet_phase_1.frame matches 2 run function mhdp_monster_valk:core/util/models/ignite_start
    execute if score @s aj.comet_phase_1.frame matches 70 run function mhdp_monster_valk:core/util/models/chest_glow_end

# 状態設定
    execute if score @s aj.comet_phase_1.frame matches 2 run tag @s add Mns.State.IsDisableAngerSpeed
    execute if score @s aj.comet_phase_1.frame matches 2 run tag @s add Mns.State.IsDisableDeath
    execute if score @s aj.comet_phase_1.frame matches 2 run tag @s add Mns.State.IsDisablePartDamage

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.comet_phase_1.frame matches 99 run function mhdp_monster_valk:core/tick/animation/event/comet_phase_1/end
