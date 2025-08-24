#> assets:object/1000.normal_wall/validate/
#
# validate処理

# 開始
    data modify storage api: Arg.Valid set value false

# 使用者のゲージ確認
    # execute if score @s Ply.Stats.BuildGauge matches ..2 run return 0

# 設置範囲のブロック確認
    execute align xyz positioned ~0.5 ~0.5 ~0.5 \
        if block ~-1 ~ ~-1 #mhdp_core:no_collision if block ~-1 ~ ~ #mhdp_core:no_collision if block ~-1 ~ ~1 #mhdp_core:no_collision \
        if block ~ ~ ~-1 #mhdp_core:no_collision if block ~ ~ ~ #mhdp_core:no_collision if block ~ ~ ~1 #mhdp_core:no_collision \
        if block ~1 ~ ~-1 #mhdp_core:no_collision if block ~1 ~ ~ #mhdp_core:no_collision if block ~1 ~ ~1 #mhdp_core:no_collision \
        if block ~-1 ~1 ~-1 #mhdp_core:no_collision if block ~-1 ~1 ~ #mhdp_core:no_collision if block ~-1 ~1 ~1 #mhdp_core:no_collision \
        if block ~ ~1 ~-1 #mhdp_core:no_collision if block ~ ~1 ~ #mhdp_core:no_collision if block ~ ~1 ~1 #mhdp_core:no_collision \
        if block ~1 ~1 ~-1 #mhdp_core:no_collision if block ~1 ~1 ~ #mhdp_core:no_collision if block ~1 ~1 ~1 #mhdp_core:no_collision \
        if block ~-1 ~2 ~-1 #mhdp_core:no_collision if block ~-1 ~2 ~ #mhdp_core:no_collision if block ~-1 ~2 ~1 #mhdp_core:no_collision \
        if block ~ ~2 ~-1 #mhdp_core:no_collision if block ~ ~2 ~ #mhdp_core:no_collision if block ~ ~2 ~1 #mhdp_core:no_collision \
        if block ~1 ~2 ~-1 #mhdp_core:no_collision if block ~1 ~2 ~ #mhdp_core:no_collision if block ~1 ~2 ~1 #mhdp_core:no_collision \
        run data modify storage api: Arg.Valid set value true

# 設置範囲のエンティティ確認
    execute if data storage api: Arg{Valid:true} positioned ~-1.5 ~-1.5 ~-1.5 if entity @n[type=shulker,tag=Asset.Object.HitBox,dx=3,dy=3,dz=3] run data modify storage api: Arg.Valid set value false

# 設置範囲表示
    execute if data storage api: Arg{Valid:true} align xyz positioned ~0.5 ~ ~0.5 run function assets:object/1000.normal_wall/validate/particle {Color:"[0.255,1.000,0.169]"}
    execute if data storage api: Arg{Valid:false} align xyz positioned ~0.5 ~ ~0.5 run function assets:object/1000.normal_wall/validate/particle {Color:"[1.000,0.192,0.192]"}
    
# 終了
    data remove storage api: Arg
