#> mhdp_monster_reus:core/remove/remove
#
# 消去処理を行う
#
# @within function 

# 弾消去
    kill @e[tag=Mns.Shot.Reus]

# 当たり判定を消去
    execute as @e[type=slime,tag=Mns.HitBox.Reus] run function mhdp_monsters:core/util/other/remove_hitbox

# ボスバー消去
    bossbar remove mhdp_monster:reus

# モデル消去
    function animated_java:reus_aj/remove/this

say 火竜消去処理