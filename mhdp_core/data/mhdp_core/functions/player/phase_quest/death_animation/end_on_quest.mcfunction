#> mhdp_core:player/phase_quest/death_animation/end_on_quest
#
# 死亡演出 終了 クエスト中
#
# @within
#    function mhdp_core:player/phase_quest/death_animation/tick
#    function mhdp_core:phase/3_quest/change_phase/general/player/reset

# 演出用のbarrier削除
    execute at @s as @e[type=marker,tag=Mk.Ply.DeathAnimation] at @s run fill ~ ~1 ~ ~ ~1 ~ air replace barrier
    execute at @s as @e[type=marker,tag=Mk.Ply.DeathAnimation] at @s run kill @s

# 移動禁止解除
    effect clear @s slowness
    attribute @s generic.jump_strength modifier remove f-f-f-f-2

# 武器使用可能
    tag @s add Ply.State.UsingWeapon

# 拠点に戻る
    function mhdp_core:phase/3_quest/call_from_player/move_to_camp

# 終了
    tag @s remove Ply.Event.DeathAnimation
