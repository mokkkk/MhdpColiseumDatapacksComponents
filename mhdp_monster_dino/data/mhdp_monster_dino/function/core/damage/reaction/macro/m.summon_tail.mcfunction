#> mhdp_monster_dino:core/damage/reaction/macro/m.summon_tail
#
# 怯みリアクション 尻尾部位破壊演出
#
# @within function mhdp_monster_dino:core/damage/reaction/tail_break

# 状態更新
    # 攻撃用Entity召喚
        $summon item_display ^$(posx) ^$(posy) ^$(posz) {start_interpolation:-1,interpolation_duration:0,teleport_duration:3,Tags:["Mns.Shot.Dino","Mns.Shot.Dino.Tail","Start"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[13.25f,13.25f,13.25f]},item:{id:"minecraft:white_dye",count:1,components:{custom_model_data:75}}}
    # 初期化
        execute as @n[type=item_display,tag=Mns.Shot.Dino.Tail,tag=Start] positioned as @s run tp @s ~ ~ ~ ~90 90
    # 終了
        tag @n[type=item_display,tag=Mns.Shot.Dino.Tail,tag=Start] remove Start
