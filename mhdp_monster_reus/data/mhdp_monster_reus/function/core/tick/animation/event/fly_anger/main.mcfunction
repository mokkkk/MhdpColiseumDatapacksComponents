#> mhdp_monster_reus:core/tick/animation/event/fly_anger/main
#
# アニメーションイベントハンドラ 咆哮
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# 演出
    execute if score @s aj.fly_anger.frame matches 17..33 on passengers if entity @s[tag=aj.data] run function mhdp_monster_reus:core/tick/animation/event/fly_anger/effect_voice with entity @s data.locators.pos_head
    execute if score @s aj.fly_anger.frame matches 6 run playsound entity.hoglin.angry master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.fly_anger.frame matches 17..33 run playsound entity.ender_dragon.growl master @a[tag=!Ply.State.IsSilent,distance=..48] ~ ~ ~ 1 0.5 0.4
    execute if score @s aj.fly_anger.frame matches 17..33 run playsound entity.ravager.attack master @a[tag=!Ply.State.IsSilent,distance=..48] ~ ~ ~ 1 0.7 0.4
    execute if score @s aj.fly_anger.frame matches 5 run playsound entity.ender_dragon.flap master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.fly_anger.frame matches 53 run playsound entity.ender_dragon.flap master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7

# 咆哮怯み
    execute if score @s aj.fly_anger.frame matches 17 run data modify storage mhdp_core:temp Damage set value {VoiceValue:2,VoiceTime:40,GuardValue:6}
    execute if score @s aj.fly_anger.frame matches 17 as @a[tag=Ply.State.EnableDamage,distance=..18] facing entity @s feet positioned as @s run function mhdp_core:player/damage/voice/main
    execute if score @s aj.fly_anger.frame matches 17 run data remove storage mhdp_core:temp Damage

# 状態更新
    execute if entity @s[tag=!Mns.Reus.State.Flying] if score @s aj.fly_anger.frame matches 2 run function mhdp_monster_reus:core/tick/animation/event/fly_anger/change_phase

# 終了
    execute if score @s aj.fly_anger.frame matches 66 run function mhdp_monster_reus:core/tick/animation/event/fly_anger/end
