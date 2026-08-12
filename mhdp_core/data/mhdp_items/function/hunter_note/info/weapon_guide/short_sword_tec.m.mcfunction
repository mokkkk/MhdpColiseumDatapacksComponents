#> mhdp_items:hunter_note/info/weapon_guide/short_sword_normal.m
#
# ハンターノート操作 武器操作説明 片手剣 地ノ型
#
# @within function mhdp_core:player/tick

# 表示
    $dialog show @s {\
        type:"minecraft:notice",title:{translate:"ui.hunter_note.weapon_guide.short_sword.normal",bold:1b},can_close_with_escape:1b,inputs:[],body:[\
            {type:"minecraft:plain_message",contents:[\
                "◇ ",{translate:"weapon.short_sword.action.normal_1"}," : ",{keybind:"key.attack"},"      \n",\
                "┗ ◇ ",{translate:"weapon.short_sword.action.normal_2"}," : ",{keybind:"key.attack"},"   \n",\
                "┗ ◇ ",{translate:"weapon.short_sword.action.normal_3"}," : ",{keybind:"key.attack"},""\
            ],width:300},\
            {type:"minecraft:plain_message",contents:[\
                "◇ ",{translate:"weapon.short_sword.action.sword_combo_1"}," : ",{keybind:"key.use"},{translate:"operation.long"},"            \n",\
                "┗ ◇ ",{translate:"weapon.short_sword.action.sword_combo_2"}," : ",{keybind:"key.use"},{translate:"operation.long"},"         \n",\
                "┗ ◇ ",{translate:"weapon.short_sword.action.sword_combo_3"}," : ",{keybind:"key.use"},{translate:"operation.long"},"      \n",\
                "┗ ◇ ",{translate:"weapon.short_sword.action.sword_combo_4"}," : ",{keybind:"key.use"},{translate:"operation.long"},"   \n",\
                "┗ ◇ ",{translate:"weapon.short_sword.action.sword_combo_5"}," : ",{keybind:"key.use"},{translate:"operation.long"},"",\
            ],width:300}\
        ],\
        action:{label:{translate:"ui.hunter_note.button_close"},action:{type:"minecraft:run_command",command:"trigger $(Trigger) set $(Value)"}}\
    }
