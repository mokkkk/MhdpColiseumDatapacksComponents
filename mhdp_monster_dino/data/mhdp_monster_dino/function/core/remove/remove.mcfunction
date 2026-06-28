#> mhdp_monster_dino:core/remove/remove
#
# 消去処理を行う
#
# @within function 

# 当たり判定を消去
    # execute as @e[type=slime,tag=Mns.HitBox.Dino] run function mhdp_monsters:core/util/other/remove_hitbox

# ボスバー消去
    bossbar remove mhdp_monster:dino

# スコア消去
    scoreboard players reset @a Mns.Dino.Caution
    scoreboard players reset @a Mns.Dino.Search
    scoreboard players reset @a Mns.Dino.Hate

# モデル消去
    function animated_java_dino:dino/remove/this
