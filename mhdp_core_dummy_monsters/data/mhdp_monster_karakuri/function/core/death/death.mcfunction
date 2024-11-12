#> mhdp_monster_karakuri:core/death/death
#
# 死亡時の処理
#
# @within function mhdp_monsters:core/switch/macro/m.death

# 状態更新
    tag @s add Mns.State.Death
    tag @s remove Mns.State.IsAnger

# 当たり判定を消去
    execute as @e[type=slime,tag=Mns.HitBox.Karakuri] run function mhdp_monsters:core/util/other/remove_hitbox

# remove処理を呼び出す
    function mhdp_monster_karakuri:core/remove/remove
