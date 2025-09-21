#> mhdp_items:weapons/bow/type_tec/14_air_shot/start
#
# 射撃 開始
#
# @within function mhdp_items:weapons/bow/type_tec/1_charge/change_to_chargeattack

# 前処理
    function mhdp_items:weapons/bow/util/before_attack

# タグ付与
    tag @s add Wpn.Bw.Tec.Shot.Air
    tag @s remove Ply.Weapon.NoOpe

# スタミナ消費
    scoreboard players remove @s Ply.Stats.Stamina 80

# 溜め段階設定
    execute if entity @s[tag=!Skill.Extra.BowChargeUp] run scoreboard players set @s Wpn.Bw.ChargeCount 2
    execute if entity @s[tag=Skill.Extra.BowChargeUp] run scoreboard players set @s Wpn.Bw.ChargeCount 1

# say 武器操作：弓 射撃(最大溜め)