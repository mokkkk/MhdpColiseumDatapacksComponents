#> mhdp_monster_dino:core/tick/animation/event/breath_backstep/shot
#
# アニメーションイベントハンドラ ブレス
#
# @within function mhdp_monster_dino:core/tick/animation/event/tail_flame_l/attack

# 攻撃用Entity召喚
    $execute positioned ^$(posx) ^$(posy) ^$(posz) run summon item_display ~ ~-1 ~ {teleport_duration:3,Tags:["Mns.Shot.Dino","Mns.Shot.Dino.Breath","Start"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.7f,0.7f,0.7f]},item:{id:"minecraft:air",count:1}}

# 初期化
    execute as @n[type=item_display,tag=Mns.Shot.Dino.Breath,tag=Start] positioned as @s run tp @s ~ ~ ~ ~ 25

# 終了
    tag @n[type=item_display,tag=Mns.Shot.Dino.Breath,tag=Start] remove Start

# 演出
    $particle lava ^$(posx) ^$(posy) ^$(posz) 0.1 0.1 0.1 0 3
    $particle flame ^$(posx) ^$(posy) ^$(posz) 0.1 0.1 0.1 0.2 20
    playsound entity.blaze.shoot master @a[tag=!Ply.State.IsSilent] ~ ~ ~ 2 1
