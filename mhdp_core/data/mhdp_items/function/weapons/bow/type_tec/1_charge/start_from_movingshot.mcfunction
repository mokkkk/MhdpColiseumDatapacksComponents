#> mhdp_items:weapons/bow/type_tec/1_charge/start_from_movingshot
#
# 溜め 開始
#
# @within function mhdp_items:weapons/bow/type_tec/main

# 前処理
    function mhdp_items:weapons/bow/util/before_attack

# アニメーションを引き絞り完了まで進める
    scoreboard players set @s Wpn.GeneralTimer 9
    scoreboard players set @s Wpn.AnimationTimer 9

# タグ付与
    tag @s add Wpn.Bw.Tec.Charge
    tag @s remove Ply.Weapon.NoOpe
    tag @s add Ply.Weapon.StaminaNotRegen

# その他初期化
    scoreboard players set @s Wpn.Bw.ChargeTimer 0
    execute if entity @s[tag=!Skill.Extra.BowChargeUp] run scoreboard players set @s Wpn.Bw.ChargeCount 2
    execute if entity @s[tag=Skill.Extra.BowChargeUp] run scoreboard players set @s Wpn.Bw.ChargeCount 3

# say 武器操作：弓・溜め