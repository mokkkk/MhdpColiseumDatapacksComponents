#> mhdp_monster_valk:core/damage/reaction/macro/m.summon_tail
#
# 怯みリアクション 尻尾部位破壊演出
#
# @within function mhdp_monster_valk:core/damage/reaction/tail_break

# 状態更新
    # 攻撃用Entity召喚
        $summon item_display ^$(posx) ^$(posy) ^$(posz) {start_interpolation:-1,interpolation_duration:0,teleport_duration:3,Tags:["Mns.Shot.Valk","Mns.Shot.Valk.Tail","Start"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,1f,0f,0f],translation:[0f,-0.3f,0f],scale:[9.25f,9.25f,9.25f]},item:{id:"minecraft:white_dye",count:1,components:{custom_model_data:152}}}
    # 初期化
        execute as @n[type=item_display,tag=Mns.Shot.Valk.Tail,tag=Start] positioned as @s run tp @s ~ ~ ~ ~90 90
    # 終了
        tag @n[type=item_display,tag=Mns.Shot.Valk.Tail,tag=Start] remove Start
