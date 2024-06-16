#> mhdp_monster_ranposu:core/remove/remove
#
# 消去処理を行う
#
# @within function 

# 当たり判定のサイズをリセット
    execute on passengers if entity @s[type=snowball,tag=aj.ranposu_aj.locator_origin] on origin if entity @s[type=slime] run data modify entity @s Size set value 0

# ボスバー消去
    bossbar remove mhdp_monster:ranposu

# モデル消去
    function animated_java:ranposu_aj/remove/this

say ドスランポス消去処理