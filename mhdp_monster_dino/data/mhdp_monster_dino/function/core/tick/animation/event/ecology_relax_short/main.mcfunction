#> mhdp_monster_dino:core/tick/animation/event/ecology_relax/main
#
# アニメーションイベントハンドラ 待機・威嚇
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 効果音
    # execute if score @s aj.ecology_relax_short.frame matches 19 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    # execute if score @s aj.ecology_relax_short.frame matches 56 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# 終了
    execute if score @s aj.ecology_relax_short.frame matches 99 run function mhdp_monster_dino:core/tick/animation/event/ecology_relax_short/end
