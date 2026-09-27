#> mhdp_monster_valk:core/tick/on_battle/interact/on_attack_object
#
# tick処理 戦闘中 建築物を攻撃した
#
# @within function mhdp_monsters:core/switch/macro/m.on_attack_object

# 同tick内で既に攻撃キャンセル済みなら中断 (複数の建築物・複数判定点への多重ヒット対策)
    execute if entity @s[tag=Mns.Temp.HitObject] run return 0

# 攻撃キャンセル (建築物の破壊可否に関わらず必ず怯む。技・左右は再生中アニメ + フレームで判定)
    # 2連突き
        execute if entity @s[tag=animated_java_valk.valk.animation.lance_spear_l_to_r.playing] if score @s aj.lance_spear_l_to_r.frame matches 35..42 run return run function mhdp_monster_valk:core/tick/on_battle/interact/reaction/cancel_attack_spear.m {Side:"l"}
        execute if entity @s[tag=animated_java_valk.valk.animation.lance_spear_l_to_r.playing] if score @s aj.lance_spear_l_to_r.frame matches 59..66 run return run function mhdp_monster_valk:core/tick/on_battle/interact/reaction/cancel_attack_spear.m {Side:"r"}
        execute if entity @s[tag=animated_java_valk.valk.animation.lance_spear_r_to_l.playing] if score @s aj.lance_spear_r_to_l.frame matches 35..42 run return run function mhdp_monster_valk:core/tick/on_battle/interact/reaction/cancel_attack_spear.m {Side:"r"}
        execute if entity @s[tag=animated_java_valk.valk.animation.lance_spear_r_to_l.playing] if score @s aj.lance_spear_r_to_l.frame matches 59..66 run return run function mhdp_monster_valk:core/tick/on_battle/interact/reaction/cancel_attack_spear.m {Side:"l"}
    # 翼槍回転斬り (突き部分)
        execute if entity @s[tag=animated_java_valk.valk.animation.lance_spear_to_spin_l.playing] if score @s aj.lance_spear_to_spin_l.frame matches 35..42 run return run function mhdp_monster_valk:core/tick/on_battle/interact/reaction/cancel_attack_spear.m {Side:"l"}
        execute if entity @s[tag=animated_java_valk.valk.animation.lance_spear_to_spin_r.playing] if score @s aj.lance_spear_to_spin_r.frame matches 35..42 run return run function mhdp_monster_valk:core/tick/on_battle/interact/reaction/cancel_attack_spear.m {Side:"r"}
    # 翼槍回転斬り (回転部分)
        execute if entity @s[tag=animated_java_valk.valk.animation.lance_spear_to_spin_l.playing] if score @s aj.lance_spear_to_spin_l.frame matches 68..85 run return run function mhdp_monster_valk:core/tick/on_battle/interact/reaction/cancel_attack_spear_spin.m {Side:"l"}
        execute if entity @s[tag=animated_java_valk.valk.animation.lance_spear_to_spin_r.playing] if score @s aj.lance_spear_to_spin_r.frame matches 68..85 run return run function mhdp_monster_valk:core/tick/on_battle/interact/reaction/cancel_attack_spear_spin.m {Side:"r"}
    # 翼槍叩きつけ (お手は対象外。振り下ろし〜着弾のみ)
        execute if entity @s[tag=animated_java_valk.valk.animation.lance_vertical_l.playing] if score @s aj.lance_vertical_l.frame matches 42..49 run return run function mhdp_monster_valk:core/tick/on_battle/interact/reaction/cancel_attack_vertical.m {Side:"l"}
        execute if entity @s[tag=animated_java_valk.valk.animation.lance_vertical_r.playing] if score @s aj.lance_vertical_r.frame matches 42..49 run return run function mhdp_monster_valk:core/tick/on_battle/interact/reaction/cancel_attack_vertical.m {Side:"r"}
        execute if entity @s[tag=animated_java_valk.valk.animation.lance_vertical_turn_l.playing] if score @s aj.lance_vertical_turn_l.frame matches 42..49 run return run function mhdp_monster_valk:core/tick/on_battle/interact/reaction/cancel_attack_vertical.m {Side:"l"}
        execute if entity @s[tag=animated_java_valk.valk.animation.lance_vertical_turn_r.playing] if score @s aj.lance_vertical_turn_r.frame matches 42..49 run return run function mhdp_monster_valk:core/tick/on_battle/interact/reaction/cancel_attack_vertical.m {Side:"r"}
        execute if entity @s[tag=animated_java_valk.valk.animation.lance_vertical_r_to_l.playing] if score @s aj.lance_vertical_r_to_l.frame matches 14..21 run return run function mhdp_monster_valk:core/tick/on_battle/interact/reaction/cancel_attack_vertical.m {Side:"l"}
        execute if entity @s[tag=animated_java_valk.valk.animation.lance_vertical_l_to_r.playing] if score @s aj.lance_vertical_l_to_r.frame matches 14..21 run return run function mhdp_monster_valk:core/tick/on_battle/interact/reaction/cancel_attack_vertical.m {Side:"r"}
    # 翼槍突き上げ (お手は対象外。怒り時専用の技のため、実質 *_anger が再生される)
        execute if entity @s[tag=animated_java_valk.valk.animation.lance_upper_l.playing] if score @s aj.lance_upper_l.frame matches 56 run return run function mhdp_monster_valk:core/tick/on_battle/interact/reaction/cancel_attack_spear.m {Side:"l"}
        execute if entity @s[tag=animated_java_valk.valk.animation.lance_upper_r.playing] if score @s aj.lance_upper_r.frame matches 56 run return run function mhdp_monster_valk:core/tick/on_battle/interact/reaction/cancel_attack_spear.m {Side:"r"}
    # 滑空突進
        execute unless entity @s[\
            tag=!animated_java_valk.valk.animation.lance_flytackle.playing,\
            tag=!animated_java_valk.valk.animation.lance_flytackle_repeat.playing,\
            tag=!animated_java_valk.valk.animation.lance_flytackle_end.playing\
        ] run return run function mhdp_monster_valk:core/tick/on_battle/interact/reaction/cancel_attack_flytackle
    # 薙ぎ払い
        execute if entity @s[tag=animated_java_valk.valk.animation.shoot_sweep_l.playing] if score @s aj.shoot_sweep_l.frame matches 49..57 run return run function mhdp_monster_valk:core/tick/on_battle/interact/reaction/cancel_attack_sweep.m {Side:"l"}
        execute if entity @s[tag=animated_java_valk.valk.animation.shoot_sweep_r.playing] if score @s aj.shoot_sweep_r.frame matches 49..57 run return run function mhdp_monster_valk:core/tick/on_battle/interact/reaction/cancel_attack_sweep.m {Side:"r"}
        execute if entity @s[tag=animated_java_valk.valk.animation.shoot_sweep_anger_l.playing] if score @s aj.shoot_sweep_anger_l.frame matches 49..57 run return run function mhdp_monster_valk:core/tick/on_battle/interact/reaction/cancel_attack_sweep.m {Side:"l"}
        execute if entity @s[tag=animated_java_valk.valk.animation.shoot_sweep_anger_r.playing] if score @s aj.shoot_sweep_anger_r.frame matches 49..57 run return run function mhdp_monster_valk:core/tick/on_battle/interact/reaction/cancel_attack_sweep.m {Side:"r"}
    # 翼叩きつけ (お手は対象外。振り下ろし〜着弾のみ)
        execute if entity @s[tag=animated_java_valk.valk.animation.shoot_vertical_l.playing] if score @s aj.shoot_vertical_l.frame matches 47..51 run return run function mhdp_monster_valk:core/tick/on_battle/interact/reaction/cancel_attack_vertical_s.m {Side:"l"}
        execute if entity @s[tag=animated_java_valk.valk.animation.shoot_vertical_r.playing] if score @s aj.shoot_vertical_r.frame matches 47..51 run return run function mhdp_monster_valk:core/tick/on_battle/interact/reaction/cancel_attack_vertical_s.m {Side:"r"}
