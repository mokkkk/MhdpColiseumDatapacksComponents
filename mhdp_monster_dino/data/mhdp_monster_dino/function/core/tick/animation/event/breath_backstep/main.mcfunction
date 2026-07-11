#> mhdp_monster_dino:core/tick/animation/event/breath_backstep/main
#
# アニメーションイベントハンドラ ブレス
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 弱めの軸合わせ
    execute if score @s aj.breath_backstep.frame matches 1 at @s run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Dino",Tick:20,MaxRotation:360}
    execute if score @s aj.breath_backstep.frame matches 12 at @s run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Dino",Tick:20,MaxRotation:360}
    execute if score @s aj.breath_backstep.frame matches 2..23 at @s run function mhdp_monsters:core/util/tick/event/alignment

# 移動
    execute if score @s aj.breath_backstep.frame matches 23 at @s run function mhdp_monsters:core/util/tick/event/vector_move_offset_start.m {\
        Tick:10,OffsetX:0.0,OffsetY:2.0,OffsetZ:-9.0,IsAdjustLand:"true"\
    }
    execute if score @s aj.breath_backstep.frame matches 28..40 at @s run function mhdp_monsters:core/util/tick/event/vector_move

# 効果音
    execute if score @s aj.breath_backstep.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.breath_backstep.frame matches 2..30 run function animated_java_dino:dino/at_locator {name:"pos_head",command:"function mhdp_monster_dino:core/tick/animation/event/breath_backstep/particle_head"}

# 攻撃
    execute if score @s aj.breath_backstep.frame matches 32 run function animated_java_dino:dino/at_locator {name:"pos_head",command:"execute rotated as @s run function mhdp_monster_dino:core/tick/animation/event/breath_backstep/attack"}

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    execute if score @s aj.breath_backstep.frame matches 61 run function mhdp_monster_dino:core/tick/animation/event/breath_backstep/end
