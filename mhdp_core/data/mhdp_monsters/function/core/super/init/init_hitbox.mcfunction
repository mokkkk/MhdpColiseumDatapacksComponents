#> mhdp_monsters:core/super/init/init_hitbox
# 
# 共通処理 召喚

# Health設定
    attribute @s max_health base set 1000
    data modify entity @s Health set value 1000.0f

# Effect付与
    effect give @s instant_health infinite 1 true

# Mhdp処理用のUuidを設定
    scoreboard players add #mhdp_global_uuid Entity.Uuid 1
    execute if score #mhdp_global_uuid Entity.Uuid matches 2147483647.. run scoreboard players set #mhdp_global_uuid Entity.Uuid -2147483648
    scoreboard players operation @s Entity.Uuid = #mhdp_global_uuid Entity.Uuid

# 終了
    tag @s add AlreadyInitMob
