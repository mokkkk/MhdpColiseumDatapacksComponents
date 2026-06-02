#> mhdp_monster_ranposu:core/tick/on_battle/interact/on_attack_object
#
# tick処理 戦闘中 建築物を攻撃した
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 特定モーション時
    say 建築殴った
    execute if data storage api: Return{IsWall:true} run say 壁を殴った
    execute if data storage api: Return{IsRemainObject:true} run say こわせませんでした
