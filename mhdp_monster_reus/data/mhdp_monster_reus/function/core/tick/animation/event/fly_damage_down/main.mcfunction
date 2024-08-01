#> mhdp_monster_reus:core/tick/animation/event/fly_damage_down/main
#
# アニメーションイベントハンドラ 飛行中ダウン
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# 移動
    execute if score @s aj.fly_damage_down.frame matches 7 at @s run function mhdp_monster_reus:core/tick/animation/event/fly_damage_down/move_start
    execute if score @s aj.fly_damage_down.frame matches 7..16 at @s run function mhdp_monsters:core/util/other/move_to_target_move

# 演出
    execute if score @s aj.fly_damage_down.frame matches 2 run playsound entity.ravager.hurt master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.8
    execute if score @s aj.fly_damage_down.frame matches 2 run playsound entity.ravager.attack master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1
    execute if score @s aj.fly_damage_down.frame matches 16 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.fly_damage_down.frame matches 16 run particle block{block_state:"minecraft:sand"} ~ ~0.5 ~ 2 0.5 2 0 30

# 接地
    execute if score @s aj.fly_damage_down.frame matches 16.. at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute if score @s aj.fly_damage_down.frame matches 16.. at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 状態変更
    execute if score @s aj.fly_damage_down.frame matches 16 run tag @s remove Mns.State.IsFlying
    execute if entity @s[tag=!Mns.Reus.State.Flying] if score @s aj.fly_damage_down.frame matches 16 run function mhdp_monster_reus:core/tick/animation/event/fly_damage_down/change_phase


# スタン中演出
    execute if entity @s[tag=Mns.State.IsStun] on passengers if entity @s[tag=aj.data] run function mhdp_monster_reus:core/tick/animation/event/land_down_r/effect_stun with entity @s data.locators.pos_head

# 終了
    execute if score @s aj.fly_damage_down.frame matches 33 run function mhdp_monster_reus:core/tick/animation/event/fly_damage_down/end
