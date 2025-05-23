#> mhdp_items:sp_items/ImmovableCloth/using/end
#
# 翔蟲の使用中処理
#
# @within function mhdp_items:sp_items/ImmovableCloth/tick

# タグ消去
    tag @s remove Itm.Sp.ImmovableCloth.Using

# クールタイム設定
    scoreboard players set @s Itm.ImmovableCloth.CoolTime 7200

# 通知
    tellraw @s {"text": "【不動の装衣の効果が切れた】","color": "green"}

# attribute消去
    # なし

# 演出
    playsound item.armor.equip_chain master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 3 1

# 防具消去
    clear @s *[custom_data~{Immovable:1b}]
