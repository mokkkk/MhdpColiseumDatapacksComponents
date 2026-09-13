#> mhdp_monster_valk:core/tick/animation/event/lance_search/main
#
# アニメーションイベントハンドラ 警戒
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 効果音
    execute if score @s aj.lance_search.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_search.frame matches 40 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    execute if score @s aj.lance_search.frame matches 49 run function mhdp_monster_valk:core/tick/animation/event/lance_search/end
