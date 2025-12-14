#> api:damage_player_to_entity/vfx/show_damage
#
# ダメージ表示
#
# @within function api:damage_player_to_entity/vfx

# 表示位置のオフセット
    # ランダム
        execute store result storage mhdp_core:temp Arg.Damage int 1 run scoreboard players get #mhdp_temp_damage_total MhdpCore
        execute store result storage mhdp_core:temp Arg.RotX int 1 run random value 0..90
        execute store result storage mhdp_core:temp Arg.RotY int 1 run random value 0..359
        execute store result storage mhdp_core:temp Arg.Dist float 0.01 run random value 0..150
    # スライムのサイズ計算
        execute store result score #mhdp_temp_slime_size MhdpCore run data get entity @e[tag=Temp.Victim,limit=1] Size
        scoreboard players add #mhdp_temp_slime_size MhdpCore 1
        scoreboard players operation #mhdp_temp_slime_size MhdpCore *= #const_slime_size Const
        scoreboard players operation #mhdp_temp_slime_size MhdpCore /= #const_7 Const
    # オフセット計算
        execute store result storage mhdp_core:temp Arg.OffsetZ float 0.0001 run scoreboard players get #mhdp_temp_slime_size MhdpCore

# データ設定
    data modify storage api: Arg.Override.Damage set from storage mhdp_core:temp Arg.Damage
    # 肉質に応じて文字色を変更
        execute unless score #mhdp_temp_defence_phys MhdpCore matches 45.. run data modify storage api: Arg.Override.Color set value "white"
        execute if score #mhdp_temp_defence_phys MhdpCore matches 45.. run data modify storage api: Arg.Override.Color set value "#FF9F20"
        execute unless score #mhdp_temp_defence_phys MhdpCore matches 45.. run data modify storage api: Arg.Override.Scale set value 0.8
        execute if score #mhdp_temp_defence_phys MhdpCore matches 45.. run data modify storage api: Arg.Override.Scale set value 1.0
    # 会心表示
        data modify storage api: Arg.Override.Prefix set value ""
        execute if entity @s[tag=Ply.Temp.IsCrit] run data modify storage api: Arg.Override.Prefix set value "+"
        execute if entity @s[tag=Ply.Temp.IsCritInverse] run data modify storage api: Arg.Override.Prefix set value "-"

# 表示
    function api:damage_player_to_entity/vfx/summon_damage_text.m with storage mhdp_core:temp Arg
