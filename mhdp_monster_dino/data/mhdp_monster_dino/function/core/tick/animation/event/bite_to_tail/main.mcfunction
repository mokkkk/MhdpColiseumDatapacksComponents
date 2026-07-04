#> mhdp_monster_dino:core/tick/animation/event/bite_to_tail/main
#
# アニメーションイベントハンドラ 噛みつき
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 軸合わせ・弱め
    execute if score @s aj.bite_to_tail.frame matches 1 run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Dino",Tick:10,MaxRotation:360}
    execute if score @s aj.bite_to_tail.frame matches 6 run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Dino",Tick:10,MaxRotation:360}
    execute if score @s aj.bite_to_tail.frame matches 9 run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Dino",Tick:10,MaxRotation:360}
    execute if score @s aj.bite_to_tail.frame matches 2..18 at @s run function mhdp_monsters:core/util/tick/event/alignment
    execute if score @s aj.bite_to_tail.frame matches 34 run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Dino",Tick:6,MaxRotation:360}
    execute if score @s aj.bite_to_tail.frame matches 40 run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Dino",Tick:6,MaxRotation:360}
    execute if score @s aj.bite_to_tail.frame matches 34..44 at @s run function mhdp_monsters:core/util/other/turn_to_target_rotate

# 移動
    execute if score @s aj.bite_to_tail.frame matches 1..5 if entity @n[tag=Mns.Target.Dino,distance=..9] at @s run tp @s ^ ^ ^-0.5
    execute if score @s aj.bite_to_tail.frame matches 6..10 at @s run tp @s ^ ^ ^-0.1
    execute if score @s aj.bite_to_tail.frame matches 20..25 unless entity @n[tag=Mns.Target.Dino,distance=..7] at @s run tp @s ^ ^ ^0.5
    execute if score @s aj.bite_to_tail.frame matches 43..58 at @s run tp @s ^ ^ ^-0.1

# 効果音
    execute if score @s aj.bite_to_tail.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.bite_to_tail.frame matches 20 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.bite_to_tail.frame matches 25 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1.8 0.1 1.8 0 30
    execute if score @s aj.bite_to_tail.frame matches 66..70 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.ravager.attack master @s ^ ^1 ^1 0.4 0.8 0.4
    execute if score @s aj.bite_to_tail.frame matches 66..70 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.hoglin.attack master @s ^ ^1 ^1 0.4 0.65 0.4
    execute if score @s aj.bite_to_tail.frame matches 66..67 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:item.mace.smash_ground master @s ^ ^1 ^1 0.4 0.8 0.4
    execute if score @s aj.bite_to_tail.frame matches 66..67 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:item.mace.smash_ground master @s ^ ^1 ^1 0.4 0.6 0.4
    execute if score @s aj.bite_to_tail.frame matches 109 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# 攻撃
    execute if score @s aj.bite_to_tail.frame matches 20 run function mhdp_monsters:core/util/tick/event/start_attack.m with storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks[{Name:"Bite"}]
    execute if score @s aj.bite_to_tail.frame matches 21..26 run function animated_java_dino:dino/at_locator {name:"pos_head",command:"function mhdp_monster_dino:core/tick/animation/event/bite_to_tail/attack_head"}
    execute if score @s aj.bite_to_tail.frame matches 25 run function mhdp_monster_dino:core/tick/animation/event/bite_to_tail/attack_0
    execute if score @s aj.bite_to_tail.frame matches 27 run function mhdp_monsters:core/util/tick/event/end_attack
    
    execute if score @s aj.bite_to_tail.frame matches 49 run function mhdp_monsters:core/util/tick/event/start_attack.m with storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks[{Name:"Tail"}]
    execute if score @s aj.bite_to_tail.frame matches 50 at @s run function mhdp_monster_dino:core/tick/animation/event/bite_to_tail/attack_tail_start.m {Rotate:-90}
    execute if score @s aj.bite_to_tail.frame matches 51 at @s run function mhdp_monster_dino:core/tick/animation/event/bite_to_tail/attack_tail_start.m {Rotate:-70}
    execute if score @s aj.bite_to_tail.frame matches 52 at @s run function mhdp_monster_dino:core/tick/animation/event/bite_to_tail/attack_tail_start.m {Rotate:-50}
    execute if score @s aj.bite_to_tail.frame matches 53 at @s run function mhdp_monster_dino:core/tick/animation/event/bite_to_tail/attack_tail_start.m {Rotate:-30}
    execute if score @s aj.bite_to_tail.frame matches 54 at @s run function mhdp_monster_dino:core/tick/animation/event/bite_to_tail/attack_tail_start.m {Rotate:-10}
    execute if score @s aj.bite_to_tail.frame matches 55 run function mhdp_monster_dino:core/tick/animation/event/bite_to_tail/attack_1
    execute if score @s aj.bite_to_tail.frame matches 56 run function mhdp_monsters:core/util/tick/event/end_attack

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# フェーズ
    # execute if entity @s[tag=!Mns.Dino.State.TailHeat] if score @s aj.bite_to_tail.frame matches 26 run function mhdp_monster_dino:core/util/phase/tail_heat

# 終了
    execute if score @s aj.bite_to_tail.frame matches 138 run function mhdp_monster_dino:core/tick/animation/event/bite_to_tail/end
