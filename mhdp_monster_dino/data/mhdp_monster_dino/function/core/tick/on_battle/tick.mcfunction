#> mhdp_monster_dino:core/tick/on_battle/tick
#
# tick処理 戦闘中
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# ヘイト更新
    execute if entity @s[tag=Mns.Temp.IsTick] run function mhdp_monster_dino:core/tick/on_battle/update_hate

# 建築物サーチ中
    execute if entity @s[tag=Mns.State.IsSearchObject] positioned ^ ^ ^4 if entity @n[type=shulker,tag=Asset.Build.HitBox,dx=0.01,dy=0.01,dz=0.01] run function mhdp_monster_dino:core/tick/on_battle/interact/on_search_object
    execute if entity @s[tag=Mns.State.IsSearchObject] positioned ^ ^ ^6 if entity @n[type=shulker,tag=Asset.Build.HitBox,dx=0.01,dy=0.01,dz=0.01] run function mhdp_monster_dino:core/tick/on_battle/interact/on_search_object
