set -g theme_show_time yes
set -g theme_short_path yes
set -g theme_current_folder_path yes
set fish_greeting


set -gx PROJECT_PATHS ~/workspace

if status is-interactive
    # Commands to run in interactive sessions can go here
end


if test -d /home/linuxbrew/.linuxbrew
    # Homebrew is installed on Linux

    set -gx HOMEBREW_PREFIX "/home/linuxbrew/.linuxbrew"
    set -gx HOMEBREW_CELLAR "/home/linuxbrew/.linuxbrew/Cellar"
    set -gx HOMEBREW_REPOSITORY "/home/linuxbrew/.linuxbrew/Homebrew"
    set -gx PATH "/home/linuxbrew/.linuxbrew/bin" "/home/linuxbrew/.linuxbrew/sbin" $PATH
    set -q MANPATH; or set MANPATH ''
    set -gx MANPATH "/home/linuxbrew/.linuxbrew/share/man" $MANPATH
    set -q INFOPATH; or set INFOPATH ''
    set -gx INFOPATH "/home/linuxbrew/.linuxbrew/share/info" $INFOPATH

end

export XDG_DATA_DIRS="/home/linuxbrew/.linuxbrew/share:$XDG_DATA_DIRS"

if set -q ZELLIJ
else
    zellij
end

starship init fish | source

nvm use lts/iron
clear

set -x LS_COLORS "di=38;5;73:ow=48;5;22:ex=38;5;131:ln=38;5;179:*.tar=38;5;209:*.zip=38;5;209:*.jpg=38;5;176:*.png=38;5;176:*.mp3=38;5;176:*.wav=38;5;176:*.txt=38;5;223:*.sh=38;5;131"
alias ls='gls --color=auto'
alias fzfbat='fzf --preview="bat --theme=gruvbox-dark --color=always {}"'
alias fzfnvim='nvim (fzf --preview="bat --theme=gruvbox-dark --color=always {}")'

## everforest
set -l foreground d3c6aa
set -l selection 2d4f67
set -l comment 859289
set -l red e67e80
set -l orange ff9e64
set -l yellow dbbc7f
set -l green a7c080
set -l purple d699b6
set -l cyan 7fbbb3
set -l pink d699b6

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment

# pnpm
set -gx PNPM_HOME "/home/windwaker/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
