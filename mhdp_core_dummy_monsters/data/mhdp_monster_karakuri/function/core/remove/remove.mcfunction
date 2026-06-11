#> mhdp_monster_karakuri:core/remove/remove
#
# 消去処理を行う
#
# @within function 

# スコア消去
    scoreboard players reset @a Mns.Karakuri.Caution
    scoreboard players reset @a Mns.Karakuri.Search
    scoreboard players reset @a Mns.Karakuri.Hate

# モデル消去
    function animated_java:karakuri/remove/this

# say モンスター処理：からくり飛竜消去処理