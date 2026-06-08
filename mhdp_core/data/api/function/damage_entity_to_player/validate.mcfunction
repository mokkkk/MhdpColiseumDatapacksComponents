#> api:damage_entity_to_player/validate
#
# バリデーション
#
# @input storage api: Arg.

# 引数のバリデーション
    execute unless data storage mhdp_core:temp Arg.Name run tellraw @a {"text":"【ERROR: モンスターの攻撃データが正常に設定されていません api:damage_entity_to_player/validate】",color:"red"}
