#> mhdp_items:weapons/bow/util/avoid
#
# 武器のフレーム回避成功時処理
#
# @within function mhdp_items:core/switch/macro/m.avoid

# チャージステップでの回避時、仕掛け矢ゲージ上昇+スタミナ回復
    execute if entity @s[tag=Wpn.Bw.Tec.ChargeStep] run function mhdp_items:weapons/bow/type_tec/4_charge_step/avoid
