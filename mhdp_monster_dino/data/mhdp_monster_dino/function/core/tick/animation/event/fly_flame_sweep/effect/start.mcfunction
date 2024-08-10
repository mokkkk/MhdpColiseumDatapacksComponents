#> mhdp_monster_reus:core/tick/animation/event/fly_flame_sweep/effect/start
#
# アニメーションイベントハンドラ なぎはらい火炎放射
#
# @within function mhdp_monster_reus:core/tick/animation/event/tick

# 攻撃判定召喚
    $summon marker ^$(posx) ^$(posy) ^$(posz) {Tags:["Mns.Reus.Attack.Flame"]}

# 初期化
    scoreboard players set @n[type=marker,tag=Mns.Reus.Attack.Flame] MhdpCore 30
    execute as @n[type=marker,tag=Mns.Reus.Attack.Flame,limit=1] at @s facing entity @n[type=area_effect_cloud,tag=Mns.ShotPos.Reus] feet run tp @s ~ ~ ~ ~ ~

# 演出
    execute as @n[type=marker,tag=Mns.Reus.Attack.Flame,limit=1] at @s run function mhdp_monster_reus:core/tick/animation/event/fly_flame_sweep/effect/shot
    execute as @n[type=marker,tag=Mns.Reus.Attack.Flame,limit=1] at @s run function mhdp_monster_reus:core/tick/animation/event/fly_flame_sweep/effect/loop
    execute as @n[type=marker,tag=Mns.Reus.Attack.Flame,limit=1] at @s run particle lava ~ ~1 ~ 0 0 0 0 3
    execute as @n[type=marker,tag=Mns.Reus.Attack.Flame,limit=1] at @s run particle explosion ~ ~1 ~ 0.2 0.2 0.2 0 2

# 終了
    kill @e[type=marker,tag=Mns.Reus.Attack.Flame]
