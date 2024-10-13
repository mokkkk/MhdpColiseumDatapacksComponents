#> mhdp_items:sp_items/immovable_cloth/util/use
#
# 特殊装具の使用時
#
# @within function mhdp_items:core/switch/macro/m.drawing

# クールタイムが終わっていない場合、中断
    execute if score @s Itm.ImmovableCloth.CoolTime matches 1.. run tellraw @s {"text":"【不動の装衣はまだ使用できません】","color": "red"}
    execute if score @s Itm.ImmovableCloth.CoolTime matches 1.. run return 0

# クールタイム設定
    scoreboard players set @s Itm.ImmovableCloth.CoolTime 200

# 使用開始
    scoreboard players set @s Itm.ImmovableCloth.GeneralTimer 0
    tag @s add Itm.Sp.ImmovableCloth.Using
