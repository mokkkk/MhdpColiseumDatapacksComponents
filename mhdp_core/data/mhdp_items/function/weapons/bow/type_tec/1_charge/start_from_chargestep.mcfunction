#> mhdp_items:weapons/bow/type_tec/1_charge/start_from_chargestep
#
# 溜め 開始
#
# @within function mhdp_items:weapons/bow/type_tec/main

# 前処理
    function mhdp_items:weapons/bow/util/before_attack

# 既に引き絞った状態にするため、Timerは9に設定(10で引き絞り完了)
    scoreboard players set @s Wpn.GeneralTimer 9
    scoreboard players set @s Wpn.AnimationTimer 9
    function mhdp_items:core/util/item_modify_custom_name {Name:"溜め"}
    function api:weapon_operation/attribute_nojump
    tag @s add Ply.Weapon.NoMoveJump

# タグ付与
    tag @s add Wpn.Bw.Tec.Charge
    tag @s remove Ply.Weapon.NoOpe
    tag @s add Ply.Weapon.StaminaNotRegen

# その他初期化
    scoreboard players set @s Wpn.Bw.ChargeTimer 0
    execute if entity @s[tag=!Skill.Extra.BowChargeUp] if score @s Wpn.Bw.ChargeCount matches ..1 run scoreboard players add @s Wpn.Bw.ChargeCount 1
    execute if entity @s[tag=Skill.Extra.BowChargeUp] if score @s Wpn.Bw.ChargeCount matches ..2 run scoreboard players add @s Wpn.Bw.ChargeCount 1

# say 武器操作：弓・溜め