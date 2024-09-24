#> mhdp_monster_valk:core/tick/animation/event/comet_phase_3/main
#
# アニメーションイベントハンドラ 彗星・急襲
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 移動
    execute if score @s aj.comet_phase_3.frame matches 2..10 at @s run tp @s ^ ^ ^1

# 効果音
    execute on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/comet_phase_3/m.particle with entity @s data.locators.pos_head

# 演出
    execute if score @s aj.comet_phase_3.frame matches 3 run kill @e[type=text_display,tag=Mns.Shot.Valk.Vfx.Star]
    execute if score @s aj.comet_phase_3.frame matches 2 at @s on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/comet_phase_3/m.summon_vfx_jet with entity @s data.locators.shadow
    execute if score @s aj.comet_phase_3.frame matches 2..20 at @s on passengers if entity @s[tag=aj.data] run function mhdp_monster_valk:core/tick/animation/event/comet_phase_3/m.tp_vfx_jet with entity @s data.locators.shadow

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.comet_phase_3.frame matches 20 run function mhdp_monster_valk:core/tick/animation/event/comet_phase_3/end
