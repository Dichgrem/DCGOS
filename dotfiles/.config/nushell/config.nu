# config.nu
#
# Installed by:
# version = "0.103.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options
#
# You can remove these comments if you want or leave
# them for future reference.

mkdir ($nu.data-dir | path join "vendor/autoload")
atuin init nu | save -f ($nu.data-dir | path join "vendor/autoload/atuin.nu")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
# 彻底关闭启动欢迎横幅
$env.config.show_banner = false



# 交互式选择一个已装包，然后用 paru -Rs 卸载
def paru-u [] {
  # pacman -Qqe 列出所有显式安装的包名，管给 fzf 选一个
  let pkg = (pacman -Qqe | lines | fzf)
  if $pkg != '' {
    # 选好了就卸载，并自动确认
    paru -Rs --noconfirm $pkg
  } else {
    echo "Canceled."
  }
}
