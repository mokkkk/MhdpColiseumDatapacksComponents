#> assets:object/10040.valk_shot/summon/
#
# 龍気形態の射撃弾 召喚（旧 mhdp_monster_valk:core/tick/shot/shot/*）
#
# 呼び出し側で銃口位置・狙い方向（rotation）を作ってから api:object/summon.m {ObjectId:10040}

# 召喚 (item_display)
    summon item_display ^ ^ ^ {teleport_duration:1,Tags:["Asset.Object","Asset.Object.Init","Asset.Object.Valk"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1.5f,1.5f,1.5f]},item:{id:"minecraft:paper",count:1,components:{"minecraft:item_model":"shot/valstrax/shot"}}}
