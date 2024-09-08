#> mhdp_monster_valk:core/tick/animation/event/comet_phase_3/main
#
# アニメーションイベントハンドラ 彗星・急襲
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 移動
    execute if score @s aj.comet_phase_3.frame matches 2..10 at @s run tp @s ^ ^ ^1

# 効果音
    execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/comet_phase_3/m.particle with entity @s data.locators.pos_head
    # execute if score @s aj.comet_phase_3.frame matches 12 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    # execute if score @s aj.comet_phase_3.frame matches 36 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    # execute if score @s aj.comet_phase_3.frame matches 12 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.allay.death master @s ^ ^1 ^1 0.4 0.9 0.4
    # execute if score @s aj.comet_phase_3.frame matches 12 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.allay.death master @s ^ ^1 ^1 0.4 0.8 0.4
    # execute if score @s aj.comet_phase_3.frame matches 12 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 1 0.4
    # execute if score @s aj.comet_phase_3.frame matches 12 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 0.9 0.4
    # execute if score @s aj.comet_phase_3.frame matches 36 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 1.2 0.4
    # execute if score @s aj.comet_phase_3.frame matches 36 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.phantom.death master @s ^ ^1 ^1 0.4 1.1 0.4

    # execute if score @s aj.comet_phase_3.frame matches 2 at @s positioned ^ ^16 ^64 run summon area_effect_cloud ^ ^ ^ {Duration:2,DurationOnUse:0,Tags:["Mns.RotatePos.Valk"]}
    # execute if score @s aj.comet_phase_3.frame matches 2 positioned as @n[type=area_effect_cloud,tag=Mns.MovePos.Valk] run tp @s ~ ~0.5 ~ ~ 0
    # execute if score @s aj.comet_phase_3.frame matches 2 at @s facing entity @n[type=area_effect_cloud,tag=Mns.RotatePos.Valk] feet run tp @s ~ ~ ~ ~ 0
    # execute if score @s aj.comet_phase_3.frame matches 2 run kill @e[type=area_effect_cloud,tag=Mns.RotatePos.Valk]

# 演出
    execute if score @s aj.comet_phase_3.frame matches 2 at @s on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/comet_phase_3/m.summon_vfx_jet with entity @s data.locators.shadow
    execute if score @s aj.comet_phase_3.frame matches 2..20 at @s on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/comet_phase_3/m.tp_vfx_jet with entity @s data.locators.shadow

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.comet_phase_3.frame matches 20 run function mhdp_monster_valk:core/tick/animation/event/comet_phase_3/end
