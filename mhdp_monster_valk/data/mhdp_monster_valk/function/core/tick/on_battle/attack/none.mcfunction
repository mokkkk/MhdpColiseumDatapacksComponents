#> mhdp_monster_valk:core/tick/on_battle/attack/none
#
# tick処理 戦闘中 攻撃 (部位なし : 弾・ビーム系。start_attack.m のエラー検知回避用)
#
# @within function mhdp_monsters:core/switch/macro/m.start_attack

# エラー検知用 (成功を返すだけ。当たり判定は弾システム側で処理)
    return 1
