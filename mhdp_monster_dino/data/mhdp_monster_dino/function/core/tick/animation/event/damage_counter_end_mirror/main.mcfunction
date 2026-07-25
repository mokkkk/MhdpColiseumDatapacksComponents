#> mhdp_monster_dino:core/tick/animation/event/damage_counter_end_mirror/main
#
# アニメーションイベントハンドラ 怯み
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 効果音
    execute if score @s aj.damage_counter_end_mirror.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    execute if score @s aj.damage_counter_end_mirror.frame matches 37 run function mhdp_monster_dino:core/tick/animation/event/damage_counter_end_mirror/end
