use steam_shortcuts_util::parse_shortcuts;

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
                    app_id: x.app_id,
                    app_name: String::from(x.app_name),
                    target: String::from(x.exe),
                    launch_options: String::from(x.launch_options),
                })
                .collect());
        }
        Err(_) => {
            panic!("error");
        }
    }
}

#[flutter_rust_bridge::frb(dart_metadata=("freezed", "immutable" import "package:meta/meta.dart" as meta))]
pub struct SteamShortcut {
    pub app_id: u32,
    pub app_name: String,
    pub target: String,
    pub launch_options: String,
}
