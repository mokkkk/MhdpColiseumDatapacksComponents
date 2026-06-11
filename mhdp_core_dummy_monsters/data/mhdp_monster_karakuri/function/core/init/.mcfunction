#> mhdp_monster_karakuri:core/summon/init
#
# データ初期化処理を行う
#
# @within function mhdp_monster_karakuri:core/summon/summon

# 位置合わせ用の移動
    tp @s ^ ^ ^0.1

# 共通処理
    function mhdp_monsters:core/super/init/

# ボスバー作成
    # 非使用

# 同士討ちダメージ有効化
    function mhdp_monsters:core/util/tick/event/enable_damage.m {Name:"karakuri"}

# 部位耐久値
    # 非使用

# その他スコア初期化
    # 非使用

# 終了
    scoreboard players reset #mhdp_temp_monster_uid Mns.Uid

# アニメーション再生
    # 待機
        execute if entity @s[tag=Mns.Temp.IsIdleAnimation] run function animated_java:karakuri/animations/idle/play
