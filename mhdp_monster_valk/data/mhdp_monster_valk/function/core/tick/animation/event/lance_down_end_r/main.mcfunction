#> mhdp_monster_valk:core/tick/animation/event/lance_down_end_r/main
#
# アニメーションイベントハンドラ ダウン起き上がり (右)
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 効果音
    execute if score @s aj.lance_down_end_r.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_down_end_r.frame matches 14 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_down_end_r.frame matches 27 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    execute if score @s aj.lance_down_end_r.frame matches 44 run function mhdp_monster_valk:core/tick/animation/event/lance_down_end_r/end
