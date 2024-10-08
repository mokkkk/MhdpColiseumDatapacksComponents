#> mhdp_monster_reus:core/tick/animation/event/land_damage_down_l/main
#
# アニメーションイベントハンドラ ダウン開始
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# 移動
    execute if score @s aj.land_damage_down_l.frame matches 2..9 at @s run tp @s ^0.2 ^ ^ ~5 ~
    execute if score @s aj.land_damage_down_l.frame matches 10..18 at @s run tp @s ^ ^ ^ ~1 ~

# 効果音
    execute if score @s aj.land_damage_down_l.frame matches 2 run playsound entity.ravager.hurt master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s aj.land_damage_down_l.frame matches 2 run playsound entity.ravager.attack master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1
    execute if score @s aj.land_damage_down_l.frame matches 10 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 1 0.1 1 0 5
    execute if score @s aj.land_damage_down_l.frame matches 10 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 状態更新
    execute if score @s aj.land_damage_down_l.frame matches 2 run tag @s add Mns.State.IsDown

# スタン中演出
    execute if entity @s[tag=Mns.State.IsStun] on passengers if entity @s[tag=aj.data] run function mhdp_monster_reus:core/tick/animation/event/land_down_r/effect_stun with entity @s data.locators.pos_head

# 終了
    execute if score @s aj.land_damage_down_l.frame matches 29 run function mhdp_monster_reus:core/tick/animation/event/land_damage_down_l/end
