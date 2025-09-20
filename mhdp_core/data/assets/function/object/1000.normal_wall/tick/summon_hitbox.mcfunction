#> assets:object/1000.normal_wall/tick/summon_hitbox
#
# tick処理

# 当たり判定召喚
    summon shulker ~ ~ ~ {Tags:["Asset.Build.HitBox","Asset.Build.HitBox.Init"],Invulnerable:1b,NoAI:1b,Silent:1b,PersistenceRequired:1b,NoGravity:1b,Color:8b,DeathLootTable:"minecraft:empty",attributes:[{id:"minecraft:scale",base:3}]}

# 紐づけ開始
    execute as @n[type=shulker,tag=Asset.Build.HitBox,tag=Asset.Build.HitBox.Init] run function assets:core/object/build/start_link
