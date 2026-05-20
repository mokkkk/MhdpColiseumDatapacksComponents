#> mhdp_items:weapons/long_sword/util/on_attack
#
# 武器の与ダメージ時処理
#
# @within function mhdp_items:core/switch/macro/m.on_attack

# 狩技ゲージ上昇
    function api:weapon_operation/charge_arts.m with storage api: Return

# 練気ゲージ上昇
    # 縦斬り
        execute if entity @s[tag=Wpn.Ls.Tec.Normal.1] run scoreboard players add @s Wpn.Ls.SpiritGauge 100
    # 突き
        execute if entity @s[tag=Wpn.Ls.Tec.Normal.2] run scoreboard players add @s Wpn.Ls.SpiritGauge 100
    # 斬り上げ
        execute if entity @s[tag=Wpn.Ls.Tec.Normal.3] run scoreboard players add @s Wpn.Ls.SpiritGauge 100
# 上限
    execute if score @s Wpn.Ls.SpiritGauge matches 1001.. run scoreboard players set @s Wpn.Ls.SpiritGauge 1000

# 終了
    data remove storage api: Return
