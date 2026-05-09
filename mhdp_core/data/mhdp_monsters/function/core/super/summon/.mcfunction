#> mhdp_monsters:core/super/summon/
# 
# 共通処理 召喚

# Uidスコア化
    execute store result score #mhdp_temp_monster_uid Mns.Uid run data get storage mhdp_core:temp TargetMonsterData.Uid
