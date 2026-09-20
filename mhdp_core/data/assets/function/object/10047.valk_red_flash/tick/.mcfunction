#> assets:object/10047.valk_red_flash/tick/
#
# 龍閃 赤フラッシュ VFX tick（旧 mhdp_monster_valk:core/tick/shot/vfx_red_flash/tick）
#
# @within function assets:core/**

# 経過
    scoreboard players add @s ObjectTick 1
    scoreboard players add @s MhdpCore 1

# 通常版 / ビームVFX版で分岐
    execute if entity @s[tag=!10047.IsBeamVfx] run function assets:object/10047.valk_red_flash/tick/normal
    execute if entity @s[tag=10047.IsBeamVfx] run function assets:object/10047.valk_red_flash/tick/beam
