#> mhdp_core:player/phase_quest/death_animation/start
#
# 死亡演出 開始
#
# @within function mhdp_core:player/phase_quest/death_animation/tick

# 倒れる演出
    execute at @s align xyz run tp @s ~0.5 ~ ~0.5
    execute at @s run summon marker ~ ~ ~ {Tags:["Mk.Ply.DeathAnimation"]}
    execute at @s run setblock ~ ~1 ~ barrier keep

# 移動禁止
    effect give @s slowness 30 10 true
    attribute @s generic.jump_strength modifier add f-f-f-f-2 "死亡演出時ジャンプ禁止" -10 add_value

# 一時的に武器使用禁止・無敵化
    tag @s remove Ply.State.UsingWeapon
    tag @s remove Ply.State.EnableDamage

# ターゲット解除
    tag @s remove Ply.State.MnsTarget

# クエストの死亡処理を呼び出す
    execute if data storage mhdp_core:game_data ActiveQuest{State:"Playing"} run function mhdp_core:phase/3_quest/call_from_player/death
