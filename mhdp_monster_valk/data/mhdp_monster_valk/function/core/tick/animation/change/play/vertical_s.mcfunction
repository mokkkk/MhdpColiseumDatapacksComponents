#> mhdp_monster_valk:core/tick/animation/change/play/vertical_s
#
# アニメーション変更処理 軸合わせ
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# ターゲットが左右どちらにいるか確認
    execute facing entity @n[tag=Mns.Target.Valk] feet rotated ~ 0 positioned ^ ^ ^3.0 rotated as @s positioned ^4.0 ^ ^ if entity @s[distance=..5.0] run tag @s add Mns.Temp.Right

# 再生アニメーション決定
    execute if entity @s[tag=Mns.Temp.Right] run tag @s add Anim.VerticalS.R
    execute if entity @s[tag=!Mns.Temp.Right] run tag @s add Anim.VerticalS.L

# 終了
    tag @s remove Mns.Temp.Right