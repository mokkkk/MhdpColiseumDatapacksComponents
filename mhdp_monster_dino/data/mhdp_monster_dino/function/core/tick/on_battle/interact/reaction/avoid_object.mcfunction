#> mhdp_monster_dino:core/tick/on_battle/interact/reaction/avoid_object
#
# tick処理 戦闘中 建築物サーチ 建築物回避
#
# @within function mhdp_monsters:core/switch/macro/m.damage

# 尻尾赤熱化時
    # ステップ→叩きつけ
        execute if entity @s[tag=Mns.Dino.State.TailHeat] run return run function mhdp_monster_dino:core/tick/animation/change/play/step_to_jumptail_forceplay
        
# 喉赤熱化時
    # 移動ブレス
        execute if entity @s[tag=Mns.Dino.State.HeadHeat] run return run function mhdp_monster_dino:core/tick/animation/change/play/move_breath_forceplay

# 通常時
    # サイドステップ
        return run function mhdp_monster_dino:core/tick/animation/change/play/step_forceplay
