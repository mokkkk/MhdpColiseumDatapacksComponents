#> mhdp_monster_dino:core/tick/animation/event/bite_double_anger/main
#
# アニメーションイベントハンドラ 2連噛みつき
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 軸合わせ・弱め
    execute if score @s aj.bite_double_anger.frame matches 1 run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Dino",Tick:10,MaxRotation:360}
    execute if score @s aj.bite_double_anger.frame matches 6 run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Dino",Tick:10,MaxRotation:360}
    execute if score @s aj.bite_double_anger.frame matches 2..11 at @s run function mhdp_monsters:core/util/tick/event/alignment

# 移動
    execute if score @s aj.bite_double_anger.frame matches 1..17 at @s run tp @s ^ ^ ^0.3
    execute if score @s aj.bite_double_anger.frame matches 18..24 at @s run tp @s ^ ^ ^0.5
    execute if score @s aj.bite_double_anger.frame matches 25..27 at @s run tp @s ^ ^ ^0.1
    execute if score @s aj.bite_double_anger.frame matches 28..32 at @s run tp @s ^ ^ ^0.5
    execute if score @s aj.bite_double_anger.frame matches 46..55 at @s run tp @s ^ ^ ^0.05

# 効果音
    execute if score @s aj.bite_double_anger.frame matches 9 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7
    execute if score @s aj.bite_double_anger.frame matches 19 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7
    execute if score @s aj.bite_double_anger.frame matches 55 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 0.7
    execute if score @s aj.bite_double_anger.frame matches 21 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1.8 0.1 1.8 0 30
    execute if score @s aj.bite_double_anger.frame matches 28 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1.8 0.1 1.8 0 30
    
# 攻撃
    execute if score @s aj.bite_double_anger.frame matches 18 run function mhdp_monsters:core/util/tick/event/start_attack.m with storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks[{Name:"BiteDouble"}]
    execute if score @s aj.bite_double_anger.frame matches 18..22 run function animated_java_dino:dino/at_locator {name:"pos_head",command:"function mhdp_monster_dino:core/tick/animation/event/bite_double_anger/attack_head"}
    execute if score @s aj.bite_double_anger.frame matches 21 run function mhdp_monster_dino:core/tick/animation/event/bite_double_anger/attack
    execute if score @s aj.bite_double_anger.frame matches 28..32 run function animated_java_dino:dino/at_locator {name:"pos_head",command:"function mhdp_monster_dino:core/tick/animation/event/bite_double_anger/attack_head"}
    execute if score @s aj.bite_double_anger.frame matches 31 run function mhdp_monster_dino:core/tick/animation/event/bite_double_anger/attack
    execute if score @s aj.bite_double_anger.frame matches 32 run function mhdp_monsters:core/util/tick/event/end_attack

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    execute if score @s aj.bite_double_anger.frame matches 64 run function mhdp_monster_dino:core/tick/animation/event/bite_double_anger/end
