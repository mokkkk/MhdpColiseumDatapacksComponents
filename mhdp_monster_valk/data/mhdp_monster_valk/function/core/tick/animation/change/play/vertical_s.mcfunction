#> mhdp_monster_valk:core/tick/animation/change/play/vertical_s
#
# アニメーション変更処理 軸合わせ
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# ターゲットが左右どちらにいるか確認
    execute facing entity @n[tag=Mns.Target.Valk] feet rotated ~ 0 positioned ^ ^ ^3.0 rotated as @s positioned ^4.0 ^ ^ if entity @s[distance=..5.0] run tag @s add Mns.Temp.Right

# ターゲットがある程度遠くにいる場合、そのまま発動
    execute if entity @s[tag=Mns.Temp.Right] if entity @n[tag=Mns.Target.Valk,distance=16..] run tag @s add Anim.VerticalS.R
    execute if entity @s[tag=!Mns.Temp.Right] if entity @n[tag=Mns.Target.Valk,distance=16..] run tag @s add Anim.VerticalS.L
    execute if entity @s[tag=Anim.VerticalS.R] run return run tag @s remove Mns.Temp.Right
    execute if entity @s[tag=Anim.VerticalS.L] run return run tag @s remove Mns.Temp.Right

# 移動位置決定
    execute if entity @s[tag=!Mns.Temp.Right] facing entity @n[tag=Mns.Target.Valk] feet rotated ~ 0 positioned as @n[tag=Mns.Target.Valk] positioned ^-6 ^ ^-18 run summon area_effect_cloud ^ ^ ^ {Duration:200,DurationOnUse:0,Tags:["Mns.MovePos.Valk"]}
    execute if entity @s[tag=Mns.Temp.Right] facing entity @n[tag=Mns.Target.Valk] feet rotated ~ 0 positioned as @n[tag=Mns.Target.Valk] positioned ^6 ^ ^-18 run summon area_effect_cloud ^ ^ ^ {Duration:200,DurationOnUse:0,Tags:["Mns.MovePos.Valk"]}

# 角度決定
    execute positioned as @n[type=area_effect_cloud,tag=Mns.MovePos.Valk] facing entity @n[tag=Mns.Target.Valk] feet rotated ~ 0 positioned as @s positioned ^ ^ ^8 run summon area_effect_cloud ^ ^ ^ {Duration:200,DurationOnUse:0,Tags:["Temp.Rotate.Target.Marker"],custom_particle:{type:"block",block_state:"minecraft:air"}}
    
# 再生アニメーション決定
    execute if entity @s[tag=Mns.Temp.Right] run tag @s add Mns.Temp.Valk.StepToVertical.R
    execute if entity @s[tag=!Mns.Temp.Right] run tag @s add Mns.Temp.Valk.StepToVertical.L
    tag @s add Anim.Step

# 終了
    tag @s remove Mns.Temp.Right
