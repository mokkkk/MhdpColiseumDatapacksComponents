#> mhdp_monster_dino:core/tick/animation/event/breath_backstep/main
#
# アニメーションイベントハンドラ ブレス
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 弱めの軸合わせ
    execute if score @s aj.breath_backstep.frame matches 1 run function mhdp_monster_dino:core/tick/animation/event/breath_backstep/turn_start
    execute if score @s aj.breath_backstep.frame matches 12 run function mhdp_monster_dino:core/tick/animation/event/breath_backstep/turn_start
    execute if score @s aj.breath_backstep.frame matches 1..23 at @s run function mhdp_monsters:core/util/other/turn_to_target_rotate

# 移動
    execute if score @s aj.breath_backstep.frame matches 23 at @s run function mhdp_monster_dino:core/tick/animation/event/breath_backstep/move_start
    execute if score @s aj.breath_backstep.frame matches 28..40 at @s run function mhdp_monsters:core/util/other/move_to_target_move

# 効果音
    execute if score @s aj.breath_backstep.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.breath_backstep.frame matches 2..30 on passengers if entity @s[tag=aj.data] run function mhdp_monster_dino:core/tick/animation/event/breath_backstep/m.particle_head with entity @s data.locators.pos_head

# 攻撃
    execute if score @s aj.breath_backstep.frame matches 32 on passengers if entity @s[tag=aj.data] run function mhdp_monster_dino:core/tick/animation/event/breath_backstep/shot with entity @s data.locators.pos_head

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# 終了
    execute if score @s aj.breath_backstep.frame matches 61 run function mhdp_monster_dino:core/tick/animation/event/breath_backstep/end
