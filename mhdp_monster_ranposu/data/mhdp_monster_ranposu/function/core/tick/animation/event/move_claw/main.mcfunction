#> mhdp_monster_ranposu:core/tick/animation/event/move_claw/main
#
# アニメーションイベントハンドラ 移動ひっかき
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/tick

# 軸合わせ・弱め
    execute if score @s aj.move_claw.frame matches 2 run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Ranposu",Tick:5,MaxRotation:90}
    execute if score @s aj.move_claw.frame matches 6 run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Ranposu",Tick:5,MaxRotation:90}
    execute if score @s aj.move_claw.frame matches 11 run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Ranposu",Tick:5,MaxRotation:90}
    execute if score @s aj.move_claw.frame matches 2..16 at @s run function mhdp_monsters:core/util/tick/event/alignment

# 移動
    execute if score @s aj.move_claw.frame matches 1..5 at @s run tp @s ^ ^ ^-0.1
    execute if score @s aj.move_claw.frame matches 24..26 at @s run tp @s ^ ^ ^1.2
    execute if score @s aj.move_claw.frame matches 27..30 at @s run tp @s ^ ^ ^0.8
    execute if score @s aj.move_claw.frame matches 31..36 at @s run tp @s ^ ^ ^0.2

# 効果音
    execute if score @s aj.move_claw.frame matches 2 run playsound entity.phantom.bite master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.5
    execute if score @s aj.move_claw.frame matches 24 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1 0.1 1 0 10
    execute if score @s aj.move_claw.frame matches 24 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.move_claw.frame matches 25..28 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1 0.1 1 0 3
    execute if score @s aj.move_claw.frame matches 29 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1 0.1 1 0 10

# 攻撃
    execute if score @s aj.move_claw.frame matches 23 run function mhdp_monsters:core/util/tick/event/start_attack.m with storage mhdp_core:monster_data AttackData[{Uid:1001}].Attacks[{Name:"MoveClaw"}]
    execute if score @s aj.move_claw.frame matches 24..30 run function mhdp_monster_ranposu:core/tick/animation/event/move_claw/attack
    execute if score @s aj.move_claw.frame matches 31 run function mhdp_monsters:core/util/tick/event/end_attack

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    execute if score @s aj.move_claw.frame matches 64 run function mhdp_monster_ranposu:core/tick/animation/event/move_claw/end
