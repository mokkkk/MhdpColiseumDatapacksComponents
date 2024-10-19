#> mhdp_monster_dino:core/remove/remove
#
# 消去処理を行う
#
# @within function 

# 弾消去
    kill @e[tag=Mns.Shot.Dino]

# 当たり判定を消去
    execute as @e[type=slime,tag=Mns.HitBox.Dino] run function mhdp_monsters:core/util/other/remove_hitbox

# ボスバー消去
    bossbar remove mhdp_monster:dino

# モデル消去
    function animated_java:dino_aj/remove/this

# say モンスター処理：斬竜消去処理