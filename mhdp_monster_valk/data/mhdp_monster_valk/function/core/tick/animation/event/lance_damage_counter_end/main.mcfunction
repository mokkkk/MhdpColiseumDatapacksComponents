#> mhdp_monster_valk:core/tick/animation/event/lance_damage_counter_end/main
#
# アニメーションイベントハンドラ 怯み・反撃硬直終了
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 効果音
    execute if score @s aj.lance_damage_counter_end.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_damage_counter_end.frame matches 15 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_damage_counter_end.frame matches 15 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 30

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    execute if score @s aj.lance_damage_counter_end.frame matches 22 run function mhdp_monster_valk:core/tick/animation/event/lance_damage_counter_end/end
