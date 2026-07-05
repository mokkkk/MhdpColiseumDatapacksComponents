#> mhdp_monster_dino:core/tick/animation/event/jump_tail_anger_r/main
#
# アニメーションイベントハンドラ 尻尾叩きつけ
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.jump_tail_anger_r.frame matches 2 run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Dino",Tick:5,MaxRotation:999}
    execute if score @s aj.jump_tail_anger_r.frame matches 6 run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Dino",Tick:5,MaxRotation:999}
    execute if score @s aj.jump_tail_anger_r.frame matches 11 run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Dino",Tick:5,MaxRotation:999}
    execute if score @s aj.jump_tail_anger_r.frame matches 30 run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Dino",Tick:10,MaxRotation:999}
    execute if score @s aj.jump_tail_anger_r.frame matches 58 run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Dino",Tick:10,MaxRotation:999}
    execute if score @s aj.jump_tail_anger_r.frame matches 2..16 at @s run function mhdp_monsters:core/util/tick/event/alignment
    execute if score @s aj.jump_tail_anger_r.frame matches 30..35 at @s run function mhdp_monsters:core/util/tick/event/alignment
    execute if score @s aj.jump_tail_anger_r.frame matches 58..66 at @s run function mhdp_monsters:core/util/tick/event/alignment

# 移動
    execute if score @s aj.jump_tail_anger_r.frame matches 1..5 if entity @n[tag=Mns.Target.Dino,distance=..8] at @s run tp @s ^ ^ ^-0.2
    execute if score @s aj.jump_tail_anger_r.frame matches 23 at @s run function mhdp_monsters:core/util/tick/event/vector_move_start.m {\
        TargetType:"player",TargetTag:"Mns.Target.Dino",MaxDistance:35,Tick:14,OffsetX:0.0,OffsetY:0.0,OffsetZ:-7.0,IsAdjustLand:"true"\
    }
    execute if score @s aj.jump_tail_anger_r.frame matches 24..37 at @s run function mhdp_monsters:core/util/tick/event/vector_move
    execute if score @s aj.jump_tail_anger_r.frame matches 60..73 unless entity @n[tag=Mns.Target.Dino,distance=..9] at @s run tp @s ^ ^ ^0.4

# 効果音
    execute if score @s aj.jump_tail_anger_r.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.jump_tail_anger_r.frame matches 19 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.jump_tail_anger_r.frame matches 64 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.jump_tail_anger_r.frame matches 77 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.jump_tail_anger_r.frame matches 19 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1.8 0.1 1.8 0 30
    execute if score @s aj.jump_tail_anger_r.frame matches 37 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1.8 0.1 1.8 0 30
    execute if score @s aj.jump_tail_anger_r.frame matches 37 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.jump_tail_anger_r.frame matches 40 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.jump_tail_anger_r.frame matches 59 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.jump_tail_anger_r.frame matches 69 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.jump_tail_anger_r.frame matches 98 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.jump_tail_anger_r.frame matches 109 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.jump_tail_anger_r.frame matches 43..48 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.ravager.attack master @s ^ ^1 ^1 0.4 0.8 0.4
    execute if score @s aj.jump_tail_anger_r.frame matches 43..45 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.hoglin.attack master @s ^ ^1 ^1 0.4 0.65 0.4
    execute if score @s aj.jump_tail_anger_r.frame matches 72..77 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:item.mace.smash_ground master @s ^ ^1 ^1 0.4 0.8 0.4
    execute if score @s aj.jump_tail_anger_r.frame matches 72..74 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:item.mace.smash_ground master @s ^ ^1 ^1 0.4 0.6 0.4
    execute if score @s aj.jump_tail_anger_r.frame matches 128..134 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.ravager.attack master @s ^ ^1 ^1 0.4 0.8 0.4
    execute if score @s aj.jump_tail_anger_r.frame matches 128..134 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.hoglin.attack master @s ^ ^1 ^1 0.4 0.65 0.4
    execute if score @s aj.jump_tail_anger_r.frame matches 128..134 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:item.mace.smash_ground master @s ^ ^1 ^1 0.4 0.8 0.4
    execute if score @s aj.jump_tail_anger_r.frame matches 128..134 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:item.mace.smash_ground master @s ^ ^1 ^1 0.4 0.6 0.4

# 攻撃
    execute if score @s aj.jump_tail_anger_r.frame matches 37 run function mhdp_monsters:core/util/tick/event/start_attack.m with storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks[{Name:"TailJump"}]
    execute if score @s aj.jump_tail_anger_r.frame matches 38 at @s run function mhdp_monster_dino:core/tick/animation/event/jump_tail_anger_r/attack_tail_start_0.m {Rotate:-90}
    execute if score @s aj.jump_tail_anger_r.frame matches 39 at @s run function mhdp_monster_dino:core/tick/animation/event/jump_tail_anger_r/attack_tail_start_0.m {Rotate:-80}
    execute if score @s aj.jump_tail_anger_r.frame matches 40 at @s run function mhdp_monster_dino:core/tick/animation/event/jump_tail_anger_r/attack_tail_start_0.m {Rotate:-60}
    execute if score @s aj.jump_tail_anger_r.frame matches 41 at @s run function mhdp_monster_dino:core/tick/animation/event/jump_tail_anger_r/attack_tail_start_0.m {Rotate:-40}
    execute if score @s aj.jump_tail_anger_r.frame matches 42 at @s run function mhdp_monster_dino:core/tick/animation/event/jump_tail_anger_r/attack_tail_start_0.m {Rotate:-20}
    execute if score @s aj.jump_tail_anger_r.frame matches 43 run function mhdp_monster_dino:core/tick/animation/event/jump_tail_anger_r/attack_0
    execute if score @s aj.jump_tail_anger_r.frame matches 44 run function mhdp_monsters:core/util/tick/event/end_attack
    execute if score @s aj.jump_tail_anger_r.frame matches 66 run function mhdp_monsters:core/util/tick/event/start_attack.m with storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks[{Name:"TailJump"}]
    execute if score @s aj.jump_tail_anger_r.frame matches 67 at @s run function mhdp_monster_dino:core/tick/animation/event/jump_tail_anger_r/attack_tail_start_1.m {Rotate:-90}
    execute if score @s aj.jump_tail_anger_r.frame matches 68 at @s run function mhdp_monster_dino:core/tick/animation/event/jump_tail_anger_r/attack_tail_start_1.m {Rotate:-80}
    execute if score @s aj.jump_tail_anger_r.frame matches 69 at @s run function mhdp_monster_dino:core/tick/animation/event/jump_tail_anger_r/attack_tail_start_1.m {Rotate:-60}
    execute if score @s aj.jump_tail_anger_r.frame matches 70 at @s run function mhdp_monster_dino:core/tick/animation/event/jump_tail_anger_r/attack_tail_start_1.m {Rotate:-40}
    execute if score @s aj.jump_tail_anger_r.frame matches 71 at @s run function mhdp_monster_dino:core/tick/animation/event/jump_tail_anger_r/attack_tail_start_1.m {Rotate:-20}
    execute if score @s aj.jump_tail_anger_r.frame matches 72 run function mhdp_monster_dino:core/tick/animation/event/jump_tail_anger_r/attack_1
    execute if score @s aj.jump_tail_anger_r.frame matches 73 run function mhdp_monsters:core/util/tick/event/end_attack

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# フェーズ
    # execute if entity @s[tag=!Mns.Dino.State.TailHeat] if score @s aj.jump_tail_anger_r.frame matches 26 run function mhdp_monster_dino:core/util/phase/tail_heat

# 終了
    execute if score @s aj.jump_tail_anger_r.frame matches 156 run function mhdp_monster_dino:core/tick/animation/event/jump_tail_anger_r/end
