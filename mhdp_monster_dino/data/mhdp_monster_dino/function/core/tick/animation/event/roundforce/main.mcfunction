#> mhdp_monster_dino:core/tick/animation/event/roundforce/main
#
# アニメーションイベントハンドラ 大回転斬り
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 軸合わせ
    execute if score @s aj.roundforce.frame matches 2 run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Dino",Tick:10,MaxRotation:180}
    execute if score @s aj.roundforce.frame matches 10 run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Dino",Tick:10,MaxRotation:180}
    execute if score @s aj.roundforce.frame matches 20 run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Dino",Tick:10,MaxRotation:180}
    execute if score @s aj.roundforce.frame matches 30 run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Dino",Tick:10,MaxRotation:180}
    execute if score @s aj.roundforce.frame matches 40 run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Dino",Tick:10,MaxRotation:180}
    execute if score @s aj.roundforce.frame matches 50 run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Dino",Tick:10,MaxRotation:180}
    execute if score @s aj.roundforce.frame matches 2..60 at @s run function mhdp_monsters:core/util/tick/event/alignment

# 移動
    execute if score @s aj.roundforce.frame matches 1..5 if entity @n[tag=Mns.Target.Dino,distance=..8] at @s run tp @s ^ ^ ^-0.4
    execute if score @s aj.roundforce.frame matches 81..86 at @s run tp @s ^ ^ ^1.2
    execute if score @s aj.roundforce.frame matches 87..96 at @s run tp @s ^ ^ ^0.8
    execute if score @s aj.roundforce.frame matches 97..105 at @s run tp @s ^ ^ ^0.3
    execute if score @s aj.roundforce.frame matches 106..115 at @s run tp @s ^ ^ ^0.1

# 効果音
    execute if score @s aj.roundforce.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.roundforce.frame matches 80 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.roundforce.frame matches 80 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1.8 0.1 1.8 0 30
    execute if score @s aj.roundforce.frame matches 81..94 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1 0.1 1 0 10
    execute if score @s aj.roundforce.frame matches 12 run playsound minecraft:item.mace.smash_ground_heavy master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.6
    execute if score @s aj.roundforce.frame matches 12 run playsound minecraft:item.mace.smash_ground_heavy master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    execute if score @s aj.roundforce.frame matches 12..55 run playsound minecraft:block.grindstone.use master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    execute if score @s aj.roundforce.frame matches 56..76 run playsound minecraft:block.grindstone.use master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.6
    execute if score @s aj.roundforce.frame matches 12..76 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:item.mace.smash_ground master @s ^ ^1 ^1 0.2 0.6 0.2
    execute if score @s aj.roundforce.frame matches 16..76 run function animated_java_dino:dino/at_locator {"name":"pos_head","command":"function mhdp_monster_dino:core/tick/animation/event/roundforce/particle_head"}
    execute if score @s aj.roundforce.frame matches 80 run playsound block.chain.break master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    execute if score @s aj.roundforce.frame matches 80 run playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    execute if score @s aj.roundforce.frame matches 80 run playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.roundforce.frame matches 80 run playsound minecraft:entity.breeze.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.roundforce.frame matches 80 run playsound minecraft:entity.breeze.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.5
    execute if score @s aj.roundforce.frame matches 82 run playsound item.trident.throw master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.roundforce.frame matches 123..129 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.ravager.attack master @s ^ ^1 ^1 0.4 0.8 0.4
    execute if score @s aj.roundforce.frame matches 123..129 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.hoglin.attack master @s ^ ^1 ^1 0.4 0.65 0.4
    execute if score @s aj.roundforce.frame matches 123..129 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:item.mace.smash_ground master @s ^ ^1 ^1 0.4 0.8 0.4
    execute if score @s aj.roundforce.frame matches 123..129 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:item.mace.smash_ground master @s ^ ^1 ^1 0.4 0.6 0.4

# 攻撃
    execute if score @s aj.roundforce.frame matches 79 run function mhdp_monsters:core/util/tick/event/start_attack.m with storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks[{Name:"Round"}]
    execute if score @s aj.roundforce.frame matches 80..90 at @s run function mhdp_monster_dino:core/tick/animation/event/roundforce/attack_tail_start
    execute if score @s aj.roundforce.frame matches 91 run function mhdp_monsters:core/util/tick/event/end_attack

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# フェーズ
    execute if entity @s[tag=!Mns.Dino.State.TailHeat] if score @s aj.roundforce.frame matches 80 run function mhdp_monster_dino:core/util/phase/tail_heat
    execute if entity @s[tag=!Mns.Dino.State.TailHeat] if score @s aj.roundforce.frame matches 81 run function mhdp_monster_dino:core/util/phase/tail_heat

# 終了
    execute if score @s aj.roundforce.frame matches 159 run function mhdp_monster_dino:core/tick/animation/event/roundforce/end
