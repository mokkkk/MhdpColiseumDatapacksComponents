#> mhdp_items:weapons/great_sword/util/on_attack
#
# 武器の与ダメージ時処理
#
# @within function mhdp_items:core/switch/macro/m.on_attack

# モーション値取得
    # api: Return.DamageMult

# 相殺成功判定
    execute if entity @s[tag=Wpn.Gs.Tec.Upper] if data storage api: Return{Counter:true} run tag @s add Ply.Flag.CounterSuccess

# 終了
    data remove storage api: Return
