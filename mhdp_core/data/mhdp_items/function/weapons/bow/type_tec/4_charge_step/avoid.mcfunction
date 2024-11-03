#> mhdp_items:weapons/bow/type_tec/4_charge_step/avoid
#
# チャージステップ 回避成功
#
# @within function mhdp_items:weapons/bow/type_tec/1_charge/change_to_chargeattack

# 仕掛け矢ゲージ上昇+スタミナ回復
    playsound entity.breeze.jump master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    playsound entity.breeze.jump master @s[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.9
    particle firework ~ ~1 ~ 0 0 0 0.3 8
    scoreboard players add @s Wpn.Bw.Gauge 100
    scoreboard players add @s Ply.Stats.Stamina 500
