#> assets:object/1001.normal_tower/tick/summon_hitbox
#
# tick処理

# 当たり判定召喚
    summon shulker ~ ~ ~ {Tags:["Asset.Build.HitBox","Asset.Build.HitBox.Init"],Invulnerable:1b,NoAI:1b,Silent:1b,PersistenceRequired:1b,NoGravity:1b,Color:8b,DeathLootTable:"minecraft:empty",attributes:[{id:"minecraft:scale",base:2}]}
    summon shulker ~ ~2 ~ {Tags:["Asset.Build.HitBox","Asset.Build.HitBox.Init"],Invulnerable:1b,NoAI:1b,Silent:1b,PersistenceRequired:1b,NoGravity:1b,Color:8b,DeathLootTable:"minecraft:empty",attributes:[{id:"minecraft:scale",base:2}]}
    summon shulker ~ ~4 ~ {Tags:["Asset.Build.HitBox","Asset.Build.HitBox.Init"],Invulnerable:1b,NoAI:1b,Silent:1b,PersistenceRequired:1b,NoGravity:1b,Color:8b,DeathLootTable:"minecraft:empty",attributes:[{id:"minecraft:scale",base:2}]}

# 紐づけ開始
    execute as @e[type=shulker,tag=Asset.Build.HitBox,tag=Asset.Build.HitBox.Init] run function assets:core/object/build/start_link
