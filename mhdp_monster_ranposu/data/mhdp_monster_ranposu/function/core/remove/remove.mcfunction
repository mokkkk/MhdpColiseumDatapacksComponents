#> mhdp_monster_ranposu:core/remove/remove
#
# 消去処理を行う
#
# @within function 

# 当たり判定を消去
    execute as @e[type=slime,tag=Mns.HitBox.Ranposu] run function mhdp_monsters:core/util/other/remove_hitbox

# ボスバー消去
    bossbar remove mhdp_monster:ranposu

# モデル消去
    function animated_java:ranposu_aj/remove/this

# say モンスター処理：ドスランポス消去処理