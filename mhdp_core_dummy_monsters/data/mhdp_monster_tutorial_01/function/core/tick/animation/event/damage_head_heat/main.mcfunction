#> mhdp_monster_dino:core/tick/animation/event/damage_head_heat/main
#
# アニメーションイベントハンドラ 怯み
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 移動
    execute if score @s aj.damage_head_heat.frame matches 2..8 at @s run tp @s ^ ^ ^-0.3
    execute if score @s aj.damage_head_heat.frame matches 12..18 at @s run tp @s ^0.5 ^ ^-0.3 ~-3 ~
    execute if score @s aj.damage_head_heat.frame matches 19..25 at @s run tp @s ^0.3 ^ ^

# 効果音
    execute if score @s aj.damage_head_heat.frame matches 2..4 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.damage_head_heat.frame matches 2..5 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.ravager.hurt master @s ^ ^1 ^1 0.4 0.8 0.4
    execute if score @s aj.damage_head_heat.frame matches 2..5 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.hoglin.hurt master @s ^ ^1 ^1 0.4 0.65 0.4
    execute if score @s aj.damage_head_heat.frame matches 12 on passengers if entity @s[tag=aj.data] run function mhdp_monster_dino:core/tick/animation/event/damage_head_heat/m.particle_head with entity @s data.locators.pos_head 
    execute if score @s aj.damage_head_heat.frame matches 12..14 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.damage_head_heat.frame matches 27 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1.3 0.1 1.3 0 30
    execute if score @s aj.damage_head_heat.frame matches 27 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7

# 状態更新
    execute if score @s aj.damage_head_heat.frame matches 12 run function mhdp_monster_dino:core/util/models/charge_end

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.damage_head_heat.frame matches 47 run function mhdp_monster_dino:core/tick/animation/event/damage_head_heat/end
