#> mhdp_monster_valk:core/tick/animation/change/random/first
#
# 初回遭遇時
#
# @within function mhdp_monster_valk:core/tick/animation/change/random/main

# 咆哮
    tag @s add Anim.Voice

# 軸合わせ
    tag @s add Mns.Temp.IsTurn

# 終了
    tag @s remove Mns.Temp.Forward
    tag @s remove Mns.Temp.Back
    data remove storage mhdp_core:temp Temp.AttackRandom
    scoreboard players reset #mndp_temp_action_id MhdpCore
    kill @n[type=minecraft:item,nbt={Item:{components:{"minecraft:custom_data":{IsRandomTemp:1b}}}}]
