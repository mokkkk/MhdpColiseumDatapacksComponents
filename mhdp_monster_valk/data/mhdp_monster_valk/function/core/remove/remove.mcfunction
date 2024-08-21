#> mhdp_monster_valk:core/remove/remove
#
# 消去処理を行う
#
# @within function 

# 弾消去
    kill @e[tag=Mns.Shot.Valk]

# 当たり判定を消去
    execute as @e[type=slime,tag=Mns.HitBox.Valk] run function mhdp_monsters:core/util/other/remove_hitbox

# ボスバー消去
    bossbar remove mhdp_monster:valk

# モデル消去
    function animated_java:valk_aj/remove/this

say 天彗龍消去処理