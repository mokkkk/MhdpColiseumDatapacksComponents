#> mhdp_monster_karakuri:core/remove/remove
#
# 消去処理を行う
#
# @within function 

# 当たり判定を消去
    execute as @e[type=slime,tag=Mns.HitBox.Karakuri] run function mhdp_monsters:core/util/other/remove_hitbox

# モデル消去
    function animated_java:karakuri_aj/remove/this

# say モンスター処理：からくり飛竜消去処理