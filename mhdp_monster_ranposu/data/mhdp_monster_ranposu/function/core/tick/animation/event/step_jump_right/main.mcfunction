#> mhdp_monster_ranposu:core/tick/animation/event/step_jump_right/main
#
# アニメーションイベントハンドラ 回り込み急襲
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.step_jump_right.frame matches 2..27 at @s run tag @n[tag=Mns.Target.Ranposu] add Temp.Rotate.Target
    execute if score @s aj.step_jump_right.frame matches 2..27 at @s run function mhdp_monsters:core/util/tick/event/turn_to_target_accurate

# 移動
    execute if score @s aj.step_jump_right.frame matches 2..18 at @s run tp @s ^-1 ^ ^
    execute if score @s aj.step_jump_right.frame matches 28 at @s run function mhdp_monsters:core/util/tick/event/vector_move_start.m {\
        TargetType:"player",TargetTag:"Mns.Target.Ranposu",MaxDistance:35,Tick:7,OffsetX:0.0,OffsetY:0.0,OffsetZ:-3.0,IsAdjustLand:"false"\
    }
    execute if score @s aj.step_jump_right.frame matches 30..36 at @s run function mhdp_monsters:core/util/tick/event/vector_move
    execute if score @s aj.step_jump_right.frame matches 37 at @s run function mhdp_monsters:core/util/tick/event/vector_move_offset_start.m {\
        Tick:8,OffsetX:0.0,OffsetY:0.0,OffsetZ:4.0,IsAdjustLand:"true"\
    }
    execute if score @s aj.step_jump_right.frame matches 37..44 at @s run function mhdp_monsters:core/util/tick/event/vector_move

# 効果音
    execute if score @s aj.step_jump_right.frame matches 2 run playsound entity.phantom.bite master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.5
    execute if score @s aj.step_jump_right.frame matches 3 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1 0.1 1 0 10
    execute if score @s aj.step_jump_right.frame matches 3 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.step_jump_right.frame matches 10 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1 0.1 1 0 10
    execute if score @s aj.step_jump_right.frame matches 10 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.step_jump_right.frame matches 18 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.step_jump_right.frame matches 30 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1 0.1 1 0 10
    execute if score @s aj.step_jump_right.frame matches 30 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.step_jump_right.frame matches 43 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1 0.1 1 0 10
    execute if score @s aj.step_jump_right.frame matches 43 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# 攻撃
    execute if score @s aj.step_jump_right.frame matches 30 run function mhdp_monsters:core/util/tick/event/start_attack.m with storage mhdp_core:monster_data AttackData[{Uid:1001}].Attacks[{Name:"Jump"}]
    execute if score @s aj.step_jump_right.frame matches 32..45 run function animated_java_ranposu:ranposu/at_locator {name:"pos_head",command:"function mhdp_monster_ranposu:core/tick/animation/event/step_jump_right/attack"}
    execute if score @s aj.step_jump_right.frame matches 46 run function mhdp_monsters:core/util/tick/event/end_attack

# 接地
    execute if entity @s[tag=!Mns.State.OnObject] if score @s aj.step_jump_right.frame matches 1..29 run function mhdp_monsters:core/util/tick/move/check_landing
    execute if entity @s[tag=!Mns.State.OnObject] if score @s aj.step_jump_right.frame matches 44.. run function mhdp_monsters:core/util/tick/move/check_landing

# 状態
    execute if score @s aj.step_jump_right.frame matches 30 run tag @s add Mns.State.IsFlying
    execute if score @s aj.step_jump_right.frame matches 44 run tag @s remove Mns.State.IsFlying

# 終了
    execute if score @s aj.step_jump_right.frame matches 99 run function mhdp_monster_ranposu:core/tick/animation/event/step_jump_right/end
