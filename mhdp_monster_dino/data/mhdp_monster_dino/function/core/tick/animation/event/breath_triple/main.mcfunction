#> mhdp_monster_dino:core/tick/animation/event/breath_triple/main
#
# アニメーションイベントハンドラ ブレス
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 弱めの軸合わせ
    execute if score @s aj.breath_triple.frame matches 1 at @s run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Dino",Tick:20,MaxRotation:360}
    execute if score @s aj.breath_triple.frame matches 12 at @s run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Dino",Tick:20,MaxRotation:360}
    execute if score @s aj.breath_triple.frame matches 2..23 at @s run function mhdp_monsters:core/util/tick/event/alignment

# 効果音
    execute if score @s aj.breath_triple.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.breath_triple.frame matches 2..24 run function animated_java_dino:dino/at_locator {name:"pos_head",command:"function mhdp_monster_dino:core/tick/animation/event/breath_triple/particle_head"}

# 攻撃
    execute if score @s aj.breath_triple.frame matches 23 positioned as @n[tag=Mns.Target.Dino] run summon area_effect_cloud ~ ~0.1 ~ {Duration:25,DurationOnUse:0,Tags:["Mns.ShotPos.Dino.0"],custom_particle:{type:"block",block_state:"minecraft:air"}}
    execute if score @s aj.breath_triple.frame matches 23 positioned as @n[tag=Mns.ShotPos.Dino.0] facing entity @s feet rotated ~ 0 run summon area_effect_cloud ^-8 ^ ^-3 {Duration:10,DurationOnUse:0,Tags:["Mns.ShotPos.Dino.1"],custom_particle:{type:"block",block_state:"minecraft:air"}}
    execute if score @s aj.breath_triple.frame matches 23 positioned as @n[tag=Mns.ShotPos.Dino.0] facing entity @s feet rotated ~ 0 run summon area_effect_cloud ^8 ^ ^3 {Duration:43,DurationOnUse:0,Tags:["Mns.ShotPos.Dino.2"],custom_particle:{type:"block",block_state:"minecraft:air"}}
    execute if score @s aj.breath_triple.frame matches 30 run function animated_java_dino:dino/at_locator {name:"pos_head",command:"function mhdp_monster_dino:core/tick/animation/event/breath_triple/attack_0"}
    execute if score @s aj.breath_triple.frame matches 47 run function animated_java_dino:dino/at_locator {name:"pos_head",command:"function mhdp_monster_dino:core/tick/animation/event/breath_triple/attack_1"}
    execute if score @s aj.breath_triple.frame matches 64 run function animated_java_dino:dino/at_locator {name:"pos_head",command:"function mhdp_monster_dino:core/tick/animation/event/breath_triple/attack_2"}

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    execute if score @s aj.breath_triple.frame matches 112 run function mhdp_monster_dino:core/tick/animation/event/breath_triple/end
