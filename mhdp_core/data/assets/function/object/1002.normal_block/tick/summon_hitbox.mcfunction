#> assets:object/1002.normal_block/tick/summon_hitbox
#
# tick処理

# 当たり判定召喚
    summon shulker ~ ~ ~ {Tags:["Asset.Build.HitBox","Asset.Build.HitBox.Init","Entity.EnableDamage"],Invulnerable:1b,NoAI:1b,Silent:1b,PersistenceRequired:1b,NoGravity:1b,Color:8b,DeathLootTable:"minecraft:empty",attributes:[{id:"minecraft:scale",base:1.5}]}

# ride
    execute as @e[type=shulker,tag=Asset.Build.HitBox,tag=Asset.Build.HitBox.Init] run ride @s mount @n[type=item_display,tag=This]

# 紐づけ開始
    execute as @e[type=shulker,tag=Asset.Build.HitBox,tag=Asset.Build.HitBox.Init] run function assets:core/object/build/start_link
