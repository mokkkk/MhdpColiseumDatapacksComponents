#> mhdp_monster_reus:core/tick/animation/change/play/fly_move
#
# アニメーション変更処理 飛行回り込み
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# ターゲットが左右どちらにいるか確認
    execute facing entity @e[tag=Mns.Target.Reus,limit=1] feet rotated ~ 0 positioned ^ ^ ^3.0 rotated as @s positioned ^4.0 ^ ^ if entity @s[distance=..5.0] run tag @s add Mns.Temp.Right

# 再生アニメーション決定
    execute if entity @s[tag=Mns.Temp.Right,tag=!Anim.Dash.Start] run tag @s add Anim.Fly.Move.L
    execute if entity @s[tag=!Mns.Temp.Right,tag=!Anim.Dash.Start] run tag @s add Anim.Fly.Move.R

# 終了
    tag @s remove Mns.Temp.Right
