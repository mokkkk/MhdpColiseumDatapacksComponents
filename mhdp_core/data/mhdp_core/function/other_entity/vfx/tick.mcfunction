#> mhdp_core:other_entity/vfx/tick
#
# 毎tick実行される処理 Vfx表示
#
# @within function minecraft:tick

# ダメージ
    execute if entity @s[tag=Other.Text.Damage] run function mhdp_core:other_entity/damage_text_tick
# 斬撃エフェクト
    execute if entity @s[tag=Other.Text.Vfx.Slash] run function mhdp_core:other_entity/vfx/slash_effect
# 打撃エフェクト
    execute if entity @s[tag=Other.Text.Vfx.Blow] run function mhdp_core:other_entity/vfx/blow_effect
