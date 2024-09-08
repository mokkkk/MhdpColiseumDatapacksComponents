#> mhdp_monster_valk:core/tick/animation/event/comet_phase_2/main
#
# アニメーションイベントハンドラ 彗星・滑空
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 移動
    execute if score @s aj.comet_phase_2.frame matches 3..60 at @s run tp @s ~ ~ ~ ~-4.2 ~
    execute if score @s aj.comet_phase_2.frame matches 3..60 unless entity @n[tag=Mns.Target.Valk,distance=..3] at @s facing entity @n[tag=Mns.Target.Valk] feet rotated ~ 0 run tp @s ^ ^ ^1

    # execute if score @s aj.comet_phase_2.frame matches 60 at @s positioned as @n[tag=Mns.Target.Valk] positioned ~ ~0.5 ~ run summon area_effect_cloud ^ ^ ^ {Duration:50,DurationOnUse:0,Tags:["Mns.MovePos.Valk"]}
    # execute if score @s aj.comet_phase_2.frame matches 60 as @n[type=area_effect_cloud,tag=Mns.MovePos.Valk] at @s run function mhdp_monsters:core/util/other/on_ground

# 効果音
    execute if score @s aj.comet_phase_2.frame matches 60 positioned ^ ^16 ^16 run playsound entity.breeze.jump master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.5
    execute if score @s aj.comet_phase_2.frame matches 60 positioned ^ ^16 ^16 run playsound entity.breeze.jump master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.6
    execute if score @s aj.comet_phase_2.frame matches 60 positioned ^ ^16 ^16 run playsound entity.breeze.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.5
    execute if score @s aj.comet_phase_2.frame matches 60 positioned ^ ^16 ^16 run playsound entity.breeze.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.6

    execute if score @s aj.comet_phase_2.frame matches 2..55 positioned ^ ^16 ^16 run playsound entity.warden.sonic_charge master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.5

    execute if score @s aj.comet_phase_2.frame matches 55 positioned ^ ^16 ^16 run playsound entity.warden.sonic_charge master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.5
    execute if score @s aj.comet_phase_2.frame matches 55 positioned ^ ^16 ^16 run playsound entity.warden.sonic_charge master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.6
    execute if score @s aj.comet_phase_2.frame matches 55 positioned ^ ^16 ^16 run playsound entity.warden.sonic_charge master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.7
    execute if score @s aj.comet_phase_2.frame matches 55 positioned ^ ^16 ^16 run playsound entity.warden.sonic_charge master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.8
    execute if score @s aj.comet_phase_2.frame matches 55 positioned ^ ^16 ^16 run playsound entity.warden.sonic_charge master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 0.9
    execute if score @s aj.comet_phase_2.frame matches 55 positioned ^ ^16 ^16 run playsound entity.warden.sonic_charge master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 3 1.0

# 演出
    execute if score @s aj.comet_phase_2.frame matches 2 at @s on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/comet_phase_2/m.summon_vfx_star with entity @s data.locators.pos_comet_star
    execute if score @s aj.comet_phase_2.frame matches 3 run data modify entity @n[type=text_display,tag=Mns.Shot.Valk.Vfx.Star] transformation.scale set value [64f,64f,1f]
    execute if score @s aj.comet_phase_2.frame matches 2..60 at @s on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/comet_phase_2/m.tp_vfx_star with entity @s data.locators.pos_comet_star
    execute if score @s aj.comet_phase_2.frame matches 61..90 at @s on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/comet_phase_2/m.tp_vfx_star_turn with entity @s data.locators.pos_comet_star
    function mhdp_monster_valk:core/tick/animation/event/comet_phase_2/change_text
    execute if score @s aj.comet_phase_2.frame matches 60 at @s on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/comet_phase_2/m.summon_vfx with entity @s data.locators.pos_comet_star

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.comet_phase_2.frame matches 91 run function mhdp_monster_valk:core/tick/animation/event/comet_phase_2/end
