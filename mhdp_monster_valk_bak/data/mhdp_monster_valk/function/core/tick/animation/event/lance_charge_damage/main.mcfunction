#> mhdp_monster_valk:core/tick/animation/event/lance_charge_damage/main
#
# アニメーションイベントハンドラ 龍気吸引
#
# @within function mhdp_monster_valk:core/tick/animation/event/tick

# 移動
    execute if score @s aj.lance_charge_damage.frame matches 2..11 at @s run tp @s ^ ^ ^-0.3
    execute if score @s aj.lance_charge_damage.frame matches 6..16 at @s run tp @s ^-0.3 ^ ^ ~-7 ~

# 効果音
    execute if score @s aj.lance_charge_damage.frame matches 8..10 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.phantom.hurt master @s ^ ^1 ^1 0.4 1 0.4
    execute if score @s aj.lance_charge_damage.frame matches 8..10 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.phantom.hurt master @s ^ ^1 ^1 0.4 1.2 0.4
    execute if score @s aj.lance_charge_damage.frame matches 8..10 at @a[tag=!Ply.State.IsSilent,distance=..48] facing entity @s feet as @p run playsound minecraft:entity.phantom.hurt master @s ^ ^1 ^1 0.4 0.8 0.4

    execute if score @s aj.lance_charge_damage.frame matches 2 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    execute if score @s aj.lance_charge_damage.frame matches 18 run playsound entity.hoglin.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_charge_damage.frame matches 18 run particle block{block_state:"minecraft:sand"} ^ ^ ^ 2 0.1 2 0 30
    execute if score @s aj.lance_charge_damage.frame matches 20 run playsound block.grass.step master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1

    execute if score @s aj.lance_charge_damage.frame matches 6 run playsound entity.generic.explode master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 0.7
    execute if score @s aj.lance_charge_damage.frame matches 6 run particle explosion ^ ^4 ^-2 1.2 1.2 1.2 0 8
    execute if score @s aj.lance_charge_damage.frame matches 6 run summon text_display ^ ^3 ^-2 {Tags:["Mns.Shot.Valk","Mns.Shot.Valk.Vfx.Bomb"],default_background:0b,brightness:{sky:15,block:15},text:{"text":"0","font":"vfx/valstrax"},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[5f,5f,5f]},background:16777215,text_opacity:255,interpolation_duration:1,teleport_duration:2,billboard:"center",alignment:"left"}

# 接地
    execute at @s if block ~ ~-0.1 ~ #mhdp_core:no_collision at @s run function mhdp_monsters:core/util/other/on_ground
    execute at @s unless block ~ ~ ~ #mhdp_core:no_collision at @s run tp @s ~ ~0.1 ~ ~ ~

# モデル演出
    execute if score @s aj.lance_charge_damage.frame matches 2 run function mhdp_monster_valk:core/util/models/chest_glow_end

# 肉質変化
    execute if score @s aj.lance_charge_damage.frame matches 2 as @e[type=slime,tag=Mns.HitBox.Valk.Body0] run scoreboard players set @s Mns.Hitbox.PartId 1
    execute if score @s aj.lance_charge_damage.frame matches 2 as @e[type=slime,tag=Mns.HitBox.Valk.ArmR] run scoreboard players set @s Mns.Hitbox.PartId 3
    execute if score @s aj.lance_charge_damage.frame matches 2 as @e[type=slime,tag=Mns.HitBox.Valk.ArmL] run scoreboard players set @s Mns.Hitbox.PartId 4

# 終了
    execute if score @s aj.lance_charge_damage.frame matches 29 run function mhdp_monster_valk:core/tick/animation/event/lance_charge_damage/end
