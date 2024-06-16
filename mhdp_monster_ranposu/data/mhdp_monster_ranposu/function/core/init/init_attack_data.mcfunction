#> mhdp_monster_ranposu:core/init/init_attack_data
#
# モンスターデータの初期化を行う ダメージ計算用
#
# @within function mhdp_monster_ranposu:core/init/init_monster_data

# ひっかき
    data modify storage mhdp_core:monster_data AttackData[{Uid:1001}].Attacks append value {Id:1}
