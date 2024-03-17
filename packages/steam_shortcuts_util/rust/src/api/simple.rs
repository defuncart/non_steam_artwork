use steam_shortcuts_util::{parse_shortcuts, shortcuts_to_bytes, Shortcut};

#[flutter_rust_bridge::frb(init)]
pub fn init_app() {
    flutter_rust_bridge::setup_default_user_utils();
}

pub async fn parse(path: String) -> anyhow::Result<Vec<SteamShortcut>> {
    let content = std::fs::read(path)?;
    match parse_shortcuts(content.as_slice()) {
        Ok(shortcuts) => {
            return Ok(shortcuts
                .into_iter()
                .map(|x| SteamShortcut {
                    order: String::from(x.order),
                    app_id: x.app_id,
                    app_name: String::from(x.app_name),
                    target: String::from(x.exe),
                    launch_options: String::from(x.launch_options),
                    start_dir: String::from(x.start_dir),
                    icon: String::from(x.icon),
                    shortcut_path: String::from(x.shortcut_path),
                    is_hidden: x.is_hidden,
                    allow_desktop_config: x.allow_desktop_config,
                    allow_overlay: x.allow_overlay,
                    open_vr: x.open_vr,
                    dev_kit: x.dev_kit,
                    dev_kit_game_id: String::from(x.dev_kit_game_id),
                    dev_kit_overrite_app_id: x.dev_kit_overrite_app_id,
                    last_play_time: x.last_play_time,
                    tags: x.tags.into_iter().map(|v| String::from(v)).collect(),
                })
                .collect());
        }
        Err(_) => {
            panic!("error");
        }
    }
}

pub async fn generate_bytes(shortcuts: Vec<SteamShortcut>) -> Vec<u8> {
    let mapped_shortcuts = shortcuts
        .into_iter()
        .map(|x| Shortcut {
            order: x.order.as_str(),
            app_id: x.app_id,
            app_name: x.app_name.as_str(),
            exe: x.target.as_str(),
            launch_options: x.launch_options.as_str(),
            start_dir: x.start_dir.as_str(),
            icon: x.icon.as_str(),
            shortcut_path: x.shortcut_path.as_str(),
            is_hidden: x.is_hidden,
            allow_desktop_config: x.allow_desktop_config,
            allow_overlay: x.allow_overlay,
            open_vr: x.open_vr,
            dev_kit: x.dev_kit,
            dev_kit_game_id: x.dev_kit_game_id.as_str(),
            dev_kit_overrite_app_id: x.dev_kit_overrite_app_id,
            last_play_time: x.last_play_time,
            tags: x.tags.into_iter().map(|v| v.as_str()).collect(),
        })
        .collect();
    return shortcuts_to_bytes(mapped_shortcuts);
}

#[flutter_rust_bridge::frb(dart_metadata=("freezed", "immutable" import "package:meta/meta.dart" as meta))]
pub struct SteamShortcut {
    pub order: String,
    pub app_id: u32,
    pub app_name: String,
    pub target: String,
    pub launch_options: String,
    pub start_dir: String,
    pub icon: String,
    pub shortcut_path: String,
    pub is_hidden: bool,
    pub allow_desktop_config: bool,
    pub allow_overlay: bool,
    pub open_vr: u32,
    pub dev_kit: u32,
    pub dev_kit_game_id: String,
    pub dev_kit_overrite_app_id: u32,
    pub last_play_time: u32,
    pub tags: Vec<String>,
}
