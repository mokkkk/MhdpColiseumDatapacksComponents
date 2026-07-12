#> mhdp_monster_dino:core/tick/animation/event/turn_bite_l/main
#
# アニメーションイベントハンドラ 軸合わせ
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.turn_bite_l.frame matches 2 run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Dino",Tick:7,MaxRotation:360}
    execute if score @s aj.turn_bite_l.frame matches 10..16 at @s run function mhdp_monsters:core/util/tick/event/alignment

# 移動
    execute if score @s aj.turn_bite_l.frame matches 1..9 if entity @n[tag=Mns.Target.Dino,distance=..7] at @s run tp @s ^ ^ ^-0.15

# 攻撃
    execute if score @s aj.turn_bite_l.frame matches 9 run function mhdp_monsters:core/util/tick/event/start_attack.m with storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks[{Name:"Bite"}]
    execute if score @s aj.turn_bite_l.frame matches 10..15 run function animated_java_dino:dino/at_locator {name:"pos_head",command:"execute rotated as @s run function mhdp_monster_dino:core/tick/animation/event/turn_bite_l/attack_head"}
    execute if score @s aj.turn_bite_l.frame matches 16 run function mhdp_monster_dino:core/tick/animation/event/turn_bite_l/attack
    execute if score @s aj.turn_bite_l.frame matches 17 run function mhdp_monsters:core/util/tick/event/end_attack

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    execute if score @s aj.turn_bite_l.frame matches 29 run function mhdp_monster_dino:core/tick/animation/event/turn_bite_l/end
