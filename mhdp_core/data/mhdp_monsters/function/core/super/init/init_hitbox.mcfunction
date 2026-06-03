#> mhdp_monsters:core/super/init/init_hitbox
# 
# 共通処理 召喚

# Health設定
    attribute @s max_health base set 1000
    data modify entity @s Health set value 1000.0f

# Effect付与
    effect give @s instant_health infinite 1 true

# 終了
    tag @s add AlreadyInitMob
