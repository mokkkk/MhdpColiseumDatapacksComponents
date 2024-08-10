#> mhdp_monster_reus:core/tick/animation/event/fly_breath_triple/shot
#
# アニメーションイベントハンドラ 3連ブレス
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# 攻撃用Entity召喚
    $summon item_display ^$(posx) ^$(posy) ^$(posz) {teleport_duration:3,Tags:["Mns.Shot.Reus","Mns.Shot.Reus.Breath","Start"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.7f,0.7f,0.7f]},item:{id:"minecraft:magma_block",count:1}}

# 初期化
    execute as @n[type=item_display,tag=Mns.Shot.Reus.Breath,tag=Start] at @s facing entity @n[type=area_effect_cloud,tag=Mns.ShotPos.Reus] feet run tp @s ~ ~ ~ ~ ~

# 終了
    tag @n[type=item_display,tag=Mns.Shot.Reus.Breath,tag=Start] remove Start

# 演出
    playsound item.firecharge.use master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
    $particle flame ^$(posx) ^$(posy) ^$(posz) 0.1 0.1 0.1 0.3 10
