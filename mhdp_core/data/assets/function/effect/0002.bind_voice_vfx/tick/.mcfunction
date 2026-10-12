#> assets:effect/0002.bind_voice_vfx/tick/
#
# エフェクトtick処理

# 画面演出付与
    execute if score #temp_effect_tick MhdpCore matches 60 run function assets:effect/0002.bind_voice_vfx/tick/apply_vfx
