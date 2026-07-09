#> mhdp_monster_dino:core/tick/animation/event/breath/main
#
# アニメーションイベントハンドラ ブレス
#
# @within function mhdp_monster_dino:core/tick/animation/event/tick

# 軸合わせ・弱め
    execute if score @s aj.breath.frame matches 1 at @s run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Dino",Tick:20,MaxRotation:360}
    execute if score @s aj.breath.frame matches 12 at @s run function mhdp_monsters:core/util/tick/event/alignment_start.m {TargetTag:"Mns.Target.Dino",Tick:20,MaxRotation:360}
    execute if score @s aj.breath.frame matches 2..23 at @s run function mhdp_monsters:core/util/tick/event/alignment

# 効果音
    execute if score @s aj.breath.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.breath.frame matches 2..24 on passengers if entity @s[tag=aj.data] run function mhdp_monster_dino:core/tick/animation/event/breath/m.particle_head with entity @s data.locators.pos_head
    execute if score @s aj.breath.frame matches 27..31 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.ravager.attack master @s ^ ^1 ^1 0.4 0.8 0.4
    execute if score @s aj.breath.frame matches 27..31 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:entity.hoglin.attack master @s ^ ^1 ^1 0.4 0.65 0.4
    execute if score @s aj.breath.frame matches 27..28 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:item.mace.smash_ground master @s ^ ^1 ^1 0.4 0.8 0.4
    execute if score @s aj.breath.frame matches 27..28 at @a[tag=!Ply.State.IsSilent,distance=..32] facing entity @s feet as @p run playsound minecraft:item.mace.smash_ground master @s ^ ^1 ^1 0.4 0.6 0.4

# 攻撃
    execute if score @s aj.breath.frame matches 23 positioned as @n[tag=Mns.Target.Dino] run summon area_effect_cloud ~ ~0.1 ~ {Duration:10,DurationOnUse:0,Tags:["Mns.ShotPos.Dino"],custom_particle:{type:"block",block_state:"minecraft:air"}}
    execute if score @s aj.breath.frame matches 27 run function animated_java_dino:dino/at_locator {name:"pos_head",command:"function mhdp_monster_dino:core/tick/animation/event/breath/attack"} 

# 接地
    function mhdp_monsters:core/util/tick/move/check_landing

# 終了
    execute if score @s aj.breath.frame matches 61 run function mhdp_monster_dino:core/tick/animation/event/breath/end
