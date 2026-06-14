#> mhdp_monster_ranposu:core/tick/animation/event/jump/main
#
# アニメーションイベントハンドラ 急襲
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/tick

# 軸合わせ・弱め
    execute if score @s aj.jump.frame matches 2 run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Ranposu",Tick:4,MaxRotation:999}
    execute if score @s aj.jump.frame matches 6 run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Ranposu",Tick:4,MaxRotation:999}
    execute if score @s aj.jump.frame matches 11 run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Ranposu",Tick:4,MaxRotation:999}
    execute if score @s aj.jump.frame matches 15 run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Ranposu",Tick:4,MaxRotation:999}
    execute if score @s aj.jump.frame matches 2..19 at @s run function mhdp_monsters:core/util/other/turn_to_target_rotate

# 移動
    execute if score @s aj.jump.frame matches 19 at @s run function mhdp_monsters:core/util/tick/event/vector_move_start.m {\
        TargetType:"player",TargetTag:"Mns.Target.Ranposu",MaxDistance:35,Tick:7,OffsetX:0.0,OffsetY:0.0,OffsetZ:-3.0,IsAdjustLand:"false"\
    }
    execute if score @s aj.jump.frame matches 24..30 at @s run function mhdp_monsters:core/util/tick/event/vector_move
    execute if score @s aj.jump.frame matches 31 at @s run function mhdp_monsters:core/util/tick/event/vector_move_offset_start.m {\
        Tick:8,OffsetX:0.0,OffsetY:0.0,OffsetZ:4.0,IsAdjustLand:"true"\
    }
    execute if score @s aj.jump.frame matches 31..38 at @s run function mhdp_monsters:core/util/tick/event/vector_move

# 効果音
    execute if score @s aj.jump.frame matches 20 run playsound entity.phantom.bite master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.5
    execute if score @s aj.jump.frame matches 24 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1 0.1 1 0 10
    execute if score @s aj.jump.frame matches 24 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.jump.frame matches 37 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1 0.1 1 0 10
    execute if score @s aj.jump.frame matches 37 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# 攻撃
    execute if score @s aj.jump.frame matches 24 run function mhdp_monsters:core/util/tick/event/start_attack.m with storage mhdp_core:monster_data AttackData[{Uid:1001}].Attacks[{Name:"Jump"}]
    execute if score @s aj.jump.frame matches 28..38 run function animated_java_ranposu:ranposu/at_locator {name:"pos_head",command:"function mhdp_monster_ranposu:core/tick/animation/event/jump/attack"}
    execute if score @s aj.jump.frame matches 38 run function mhdp_monsters:core/util/tick/event/end_attack

# 接地
    execute if entity @s[tag=!Mns.State.OnObject] if score @s aj.jump.frame matches 1..24 run function mhdp_monsters:core/util/tick/move/check_landing
    execute if entity @s[tag=!Mns.State.OnObject] if score @s aj.jump.frame matches 34.. run function mhdp_monsters:core/util/tick/move/check_landing

# 状態
    execute if score @s aj.jump.frame matches 24 run tag @s add Mns.State.IsFlying
    execute if score @s aj.jump.frame matches 38 run tag @s remove Mns.State.OnObject
    execute if score @s aj.jump.frame matches 38 run tag @s remove Mns.State.IsFlying

# 終了
    execute if score @s aj.jump.frame matches 99 run function mhdp_monster_ranposu:core/tick/animation/event/jump/end
