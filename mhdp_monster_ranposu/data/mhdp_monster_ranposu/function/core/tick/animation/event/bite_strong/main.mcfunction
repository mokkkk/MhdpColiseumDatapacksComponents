#> mhdp_monster_ranposu:core/tick/animation/event/bite_strong/main
#
# アニメーションイベントハンドラ 強嚙みつき
#
# @within function mhdp_monster_ranposu:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.bite_strong.frame matches 2 run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Ranposu",Tick:10}
    execute if score @s aj.bite_strong.frame matches 11 run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Ranposu",Tick:10}
    execute if score @s aj.bite_strong.frame matches 2..21 at @s run function mhdp_monsters:core/util/tick/event/alignment

# 移動
    execute if score @s aj.bite_strong.frame matches 1..5 at @s run tp @s ^ ^ ^-0.1
    execute if score @s aj.bite_strong.frame matches 6..9 at @s run tp @s ^ ^ ^-0.3
    execute if score @s aj.bite_strong.frame matches 18..20 unless entity @n[tag=Mns.Target.Ranposu,distance=..5] at @s run tp @s ^ ^ ^0.7
    execute if score @s aj.bite_strong.frame matches 21..24 unless entity @n[tag=Mns.Target.Ranposu,distance=..5] at @s run tp @s ^ ^ ^0.5

# 効果音
    execute if score @s aj.bite_strong.frame matches 2 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1 0.1 1 0 10
    execute if score @s aj.bite_strong.frame matches 2 run playsound entity.phantom.bite master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1.5
    execute if score @s aj.bite_strong.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.bite_strong.frame matches 18 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.bite_strong.frame matches 24 run playsound entity.wither.break_block master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 1 1.7

# 攻撃
    execute if score @s aj.bite_strong.frame matches 19 run function mhdp_monsters:core/util/tick/event/start_attack.m with storage mhdp_core:monster_data AttackData[{Uid:1001}].Attacks[{Name:"BiteStrong"}]
    execute if score @s aj.bite_strong.frame matches 24 run function mhdp_monster_ranposu:core/tick/animation/event/bite_strong/attack
    execute if score @s aj.bite_strong.frame matches 25 run function mhdp_monsters:core/util/tick/event/end_attack

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    execute if score @s aj.bite_strong.frame matches 53 run function mhdp_monster_ranposu:core/tick/animation/event/bite_strong/end
