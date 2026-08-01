#> mhdp_monster_dino:core/tick/animation/event/tail_attack_r/main
#
# アニメーションイベントハンドラ 尻尾叩きつけ
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 軸合わせ・弱め
    execute if score @s aj.tail_attack_r.frame matches 2 run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Dino",Tick:10,MaxRotation:180}
    execute if score @s aj.tail_attack_r.frame matches 10 run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Dino",Tick:10,MaxRotation:180}
    execute if score @s aj.tail_attack_r.frame matches 2..18 at @s run function mhdp_monsters:core/util/tick/event/alignment

# 移動
    execute if score @s aj.tail_attack_r.frame matches 1..5 if entity @n[tag=Mns.Target.Dino,distance=..8] at @s run tp @s ^ ^ ^-0.5
    execute if score @s aj.tail_attack_r.frame matches 16..25 unless entity @n[tag=Mns.Target.Dino,distance=..9] at @s run tp @s ^ ^ ^0.4
    execute if score @s aj.tail_attack_r.frame matches 81..87 at @s run tp @s ^ ^ ^-0.1

# 効果音
    execute if score @s aj.tail_attack_r.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.tail_attack_r.frame matches 16 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.tail_attack_r.frame matches 26 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.tail_attack_r.frame matches 26 run particle block{block_state:"minecraft:sand"} ~ ~0.1 ~ 1.8 0.1 1.8 0 30
    execute if score @s aj.tail_attack_r.frame matches 38..42 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.ravager.attack master @s ^ ^1 ^1 0.4 0.8 0.4
    execute if score @s aj.tail_attack_r.frame matches 38..42 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.hoglin.attack master @s ^ ^1 ^1 0.4 0.65 0.4
    execute if score @s aj.tail_attack_r.frame matches 38..39 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:item.mace.smash_ground master @s ^ ^1 ^1 0.4 0.8 0.4
    execute if score @s aj.tail_attack_r.frame matches 38..39 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:item.mace.smash_ground master @s ^ ^1 ^1 0.4 0.6 0.4
    execute if score @s aj.tail_attack_r.frame matches 81 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

# 攻撃
    execute if score @s aj.tail_attack_r.frame matches 20 run tag @s remove Mns.Temp.Attack.Tail.R
    execute if score @s aj.tail_attack_r.frame matches 20 run function mhdp_monsters:core/util/tick/event/start_attack.m with storage mhdp_core:monster_data AttackData[{Uid:1003}].Attacks[{Name:"Tail"}]
    execute if score @s aj.tail_attack_r.frame matches 21 at @s run function mhdp_monster_dino:core/tick/animation/event/tail_attack_r/attack_tail_start.m {Rotate:-90}
    execute if score @s aj.tail_attack_r.frame matches 22 at @s run function mhdp_monster_dino:core/tick/animation/event/tail_attack_r/attack_tail_start.m {Rotate:-70}
    execute if score @s aj.tail_attack_r.frame matches 23 at @s run function mhdp_monster_dino:core/tick/animation/event/tail_attack_r/attack_tail_start.m {Rotate:-50}
    execute if score @s aj.tail_attack_r.frame matches 24 at @s run function mhdp_monster_dino:core/tick/animation/event/tail_attack_r/attack_tail_start.m {Rotate:-30}
    execute if score @s aj.tail_attack_r.frame matches 25 at @s run function mhdp_monster_dino:core/tick/animation/event/tail_attack_r/attack_tail_start.m {Rotate:-10}
    execute if score @s aj.tail_attack_r.frame matches 26 run function mhdp_monster_dino:core/tick/animation/event/tail_attack_r/attack
    execute if score @s aj.tail_attack_r.frame matches 27 run function mhdp_monsters:core/util/tick/event/end_attack

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# フェーズ
    execute if entity @s[tag=!Mns.Dino.State.TailHeat] if score @s aj.tail_attack_r.frame matches 26 run function mhdp_monster_dino:core/util/phase/tail_heat_check

# 終了
    execute if score @s aj.tail_attack_r.frame matches 108 run function mhdp_monster_dino:core/tick/animation/event/tail_attack_r/end
