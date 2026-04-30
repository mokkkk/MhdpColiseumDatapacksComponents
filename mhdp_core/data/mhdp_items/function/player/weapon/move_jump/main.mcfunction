#> mhdp_items:player/weapon/move_jump/main
#
# 移動ジャンプ
#
# @within function mhdp_items:player/weapon/tick

# 前移動の場合、スキップ
    # execute if entity @s[tag=Ply.Ope.IsKeyForward] run return 0

# スタミナ消費
    execute if entity @s[tag=!Skill.Stamina.Constitution.1,tag=!Skill.Stamina.Constitution.2,tag=!Skill.Stamina.Constitution.3] run scoreboard players remove @s Ply.Stats.Stamina 150
    execute if entity @s[tag=Skill.Stamina.Constitution.1] run scoreboard players remove @s Ply.Stats.Stamina 140
    execute if entity @s[tag=Skill.Stamina.Constitution.2] run scoreboard players remove @s Ply.Stats.Stamina 130
    execute if entity @s[tag=Skill.Stamina.Constitution.3] run scoreboard players remove @s Ply.Stats.Stamina 115

# 移動
    execute rotated ~ 30 run function api:weapon_operation/vector_move.m {Strength:4000}
    data modify storage mhdp_core:temp PlayerData.VectorMove.Strength set value 1000
    function api:weapon_operation/save_vector
    function mhdp_core:player/data/save_data

# 演出
    particle cloud ~ ~0.3 ~ 0.3 0.3 0.3 0.1 3
    playsound block.grass.step player @s ~ ~ ~ 2 1

# 空中フラグ有効
    tag @s add Ply.Ope.IsAir

# クールタイム設定
    scoreboard players set @s Ply.Timer.VectorJumpCoolTime 10

# 無敵時間設定
    scoreboard players set @s Ply.Timer.Avoid 3

# 飛び降り判定時間設定
    scoreboard players set @s Ply.Timer.JumpOffCheckTime 10

# 武器操作停止
    scoreboard players set @s Wpn.DeactivateTimer 8

# 移動速度減少
    attribute @s movement_speed modifier add mhdp_core:movejump_movement_speed -0.07 add_value
    attribute @s jump_strength modifier add mhdp_core:movejump_jump_strength -1 add_value

# 終了
    data remove storage mhdp_core:temp Temp
