#> mhdp_monster_dino:core/tick/animation/event/tail_flame_r/shot
#
# アニメーションイベントハンドラ 火炎
#
# @within function mhdp_monster_dino:core/tick/animation/event/tail_flame_r/attack

# 攻撃用Entity召喚
    summon item_display ~ ~ ~ {teleport_duration:3,Tags:["Mns.Shot.Dino","Mns.Shot.Dino.Flame","Start"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.7f,0.7f,0.7f]},item:{id:"minecraft:air",count:1}}

# 初期化
    execute facing entity @n[type=area_effect_cloud,tag=Mns.ShotPos.Dino] feet run tp @n[type=item_display,tag=Mns.Shot.Dino.Flame,tag=Start] ~ ~ ~ ~ 0

# 終了
    tag @n[type=item_display,tag=Mns.Shot.Dino.Flame,tag=Start] remove Start
