#> mhdp_monster_valk:core/tick/animation/change/play/bomb_side
#
# アニメーション変更処理 側面爆発
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# ターゲットがある程度近くにいる場合、そのまま発動
    execute if entity @n[tag=Mns.Target.Valk,distance=..9] run return run tag @s add Anim.Bomb.Side

# ターゲットが左右どちらにいるか確認
    execute facing entity @n[tag=Mns.Target.Valk] feet rotated ~ 0 positioned ^ ^ ^3.0 rotated as @s positioned ^4.0 ^ ^ if entity @s[distance=..5.0] run tag @s add Mns.Temp.Right

# 移動位置決定
    execute facing entity @n[tag=Mns.Target.Valk] feet rotated ~ 0 positioned as @n[tag=Mns.Target.Valk] positioned ^ ^ ^-4 run summon marker ^ ^ ^ {Tags:["Temp.Move.Target.Marker"]}

# 角度決定
    execute if entity @s[tag=Mns.Temp.Right] positioned as @n[type=marker,tag=Temp.Move.Target.Marker] facing entity @n[tag=Mns.Target.Valk] feet rotated ~-90 0 positioned as @s positioned ^ ^ ^8 run summon marker ^ ^ ^ {Tags:["Temp.Rotate.Target.Marker"]}
    execute if entity @s[tag=!Mns.Temp.Right] positioned as @n[type=marker,tag=Temp.Move.Target.Marker] facing entity @n[tag=Mns.Target.Valk] feet rotated ~90 0 positioned as @s positioned ^ ^ ^8 run summon marker ^ ^ ^ {Tags:["Temp.Rotate.Target.Marker"]}

# 再生アニメーション決定
    tag @s add Mns.Temp.Valk.StepToBombSide
    tag @s add Anim.Step

# 終了
    tag @s remove Mns.Temp.Right
