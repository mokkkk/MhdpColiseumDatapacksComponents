#> mhdp_core:player/damage/voice/macro/m.apply_voice
#
# モンスターからプレイヤーに対してのダメージ処理 ダメージ適用
#
# @within function mhdp_core:player/damage/voice/apply

# 移動停止
    $summon area_effect_cloud ~ ~ ~ {Duration:6,Age:4,potion_contents:{custom_effects:[{id:"minecraft:slowness",amplifier:5,duration:$(VoiceTime),show_particles:0b}]}}

# 武器操作中断
    # 操作無効化
        $execute if entity @s[tag=!Ply.Weapon.Guard] run scoreboard players set @s Wpn.DeactivateTimer $(VoiceTime)
    # 操作中断
        execute if entity @s[tag=Ply.State.UsingWeapon] run function mhdp_items:core/switch/weapon_interrupt
        execute if entity @s[tag=Ply.State.UsingWeapon] run function mhdp_items:core/switch/item/interrupt

# 演出
    execute at @s run tp @s ~ ~ ~ ~ ~5
