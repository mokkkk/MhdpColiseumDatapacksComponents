#> mhdp_items:sp_items/immovable_cloth/tick
#
# 不動の装衣のメイン処理
#
# @within function mhdp_items:sp_items/tick

# クールタイム減少
    execute if entity @s[tag=!Itm.Sp.ImmovableCloth.Using] if score @s Itm.ImmovableCloth.CoolTime matches 1..2 run tellraw @s {"text": "【不動の装衣が使用可能になった】","color": "green"}
    execute if entity @s[tag=!Itm.Sp.ImmovableCloth.Using] if score @s Itm.ImmovableCloth.CoolTime matches 1.. run scoreboard players remove @s Itm.ImmovableCloth.CoolTime 2

# 使用中処理
    execute if entity @s[tag=Itm.Sp.ImmovableCloth.Using] run function mhdp_items:sp_items/immovable_cloth/using/tick

# 訓練所のみ
    execute if entity @s[tag=Ply.State.IsTraining,tag=Ply.Option.Training.IsSpItemInfinity] if score @s Itm.ImmovableCloth.CoolTime matches 2.. run scoreboard players set @s Itm.ImmovableCloth.CoolTime 0
