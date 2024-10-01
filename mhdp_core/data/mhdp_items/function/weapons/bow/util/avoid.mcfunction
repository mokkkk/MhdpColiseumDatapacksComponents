#> mhdp_items:weapons/bow/util/avoid
#
# 武器のフレーム回避成功時処理
#
# @within function mhdp_items:core/switch/macro/m.avoid

# チャージステップでの回避時、仕掛け矢ゲージ上昇+スタミナ回復
    execute if entity @s[tag=Wpn.Bw.Tec.ChargeStep] run playsound entity.breeze.jump master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if entity @s[tag=Wpn.Bw.Tec.ChargeStep] run playsound entity.breeze.jump master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9
    execute if entity @s[tag=Wpn.Bw.Tec.ChargeStep] run particle firework ~ ~1 ~ 0 0 0 0.3 8
    execute if entity @s[tag=Wpn.Bw.Tec.ChargeStep] run scoreboard players add @s Wpn.Bw.Gauge 100
    # ジャスト回避時はスタミナを大きく回復
        execute if entity @s[tag=Wpn.Bw.Tec.ChargeStep] if score @s Ply.Timer.Avoid matches 2.. run scoreboard players add @s Ply.Stats.Stamina 500
