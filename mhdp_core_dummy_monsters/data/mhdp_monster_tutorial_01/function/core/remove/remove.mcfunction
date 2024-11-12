#> mhdp_monster_tutorial_01:core/remove/remove
#
# 消去処理を行う
#
# @within function 

# 弾消去
    tp @e[tag=Mns.Shot.Tutorial01] ~ ~100 ~
    kill @e[tag=Mns.Shot.Tutorial01]
    scoreboard objectives setdisplay sidebar.team.gray
    scoreboard players reset $mhdp_temp_tutorial_text Mns.Tutorial.Text
    scoreboard players reset $mhdp_temp_tutorial_value Mns.Tutorial.Text
    scoreboard players reset $mhdp_temp_tutorial_value_2 Mns.Tutorial.Text
    scoreboard players reset $mhdp_temp_tutorial_value_3 Mns.Tutorial.Text
    fill 202 66 142 202 68 144 air replace oak_fence

# 当たり判定を消去
    # なし

# ボスバー消去
    # なし

# モデル消去
    kill @s

# say チュートリアル01消去処理