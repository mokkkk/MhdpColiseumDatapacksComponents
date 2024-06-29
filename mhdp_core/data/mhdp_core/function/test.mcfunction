

# 正面判定
    execute facing entity @n[tag=Mns.Target.Ranposu] feet rotated ~ 0 positioned ^ ^ ^1 rotated as @s positioned ^ ^ ^-1 if entity @s[distance=..0.25] at @s run say 正面!!!!!!!

# 対象との角度差を計算
    summon marker ~ ~ ~ {Tags:["Temp.Rotate.Target.Marker"]}
    execute at @s facing entity @n[tag=Mns.Target.Ranposu] feet rotated ~ 0 run tp @n[type=marker,tag=Temp.Rotate.Target.Marker,limit=1] ~ ~ ~ ~ ~
    execute store result score #mhdo_temp_rotate MhdpCore run data get entity @s Rotation[0] 1000
    execute store result score #temp_debug MhdpCore run data get entity @n[type=marker,tag=Temp.Rotate.Target.Marker,limit=1] Rotation[0] 1000
    scoreboard players operation #temp_debug MhdpCore -= #mhdo_temp_rotate MhdpCore
    execute if score #temp_debug MhdpCore matches 180000.. run scoreboard players remove #temp_debug MhdpCore 360000
    execute if score #temp_debug MhdpCore matches ..-180000 run scoreboard players add #temp_debug MhdpCore 360000

    tellraw @a [{"text": "角度："},{"score":{"name":"#temp_debug","objective":"MhdpCore"}}]

# 終了
    kill @e[type=marker,tag=Temp.Rotate.Target.Marker]
    scoreboard players reset #temp_debug MhdpCore
