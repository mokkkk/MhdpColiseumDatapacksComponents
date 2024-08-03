#> mhdp_monster_reus:core/damage/reaction/macro/m.summon_tail
#
# 怯みリアクション 尻尾部位破壊演出
#
# @within function mhdp_monster_reus:core/damage/reaction/tail_break

# 状態更新
    # 攻撃用Entity召喚
        $summon item_display ^$(posx) ^$(posy) ^$(posz) {start_interpolation:-1,interpolation_duration:0,teleport_duration:3,Tags:["Mns.Shot.Reus","Mns.Shot.Reus.Tail","Start"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[3.8f,3.8f,3.8f]},item:{id:"minecraft:black_dye",count:1,components:{custom_model_data:2033}}}
    # 初期化
        execute as @n[type=item_display,tag=Mns.Shot.Reus.Tail,tag=Start] positioned as @s run tp @s ~ ~ ~ ~90 90
    # 終了
        tag @n[type=item_display,tag=Mns.Shot.Reus.Tail,tag=Start] remove Start
