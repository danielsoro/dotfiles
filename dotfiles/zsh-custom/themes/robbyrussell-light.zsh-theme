# robbyrussell layout, recolored for light terminal backgrounds.
# Dark 256-color tones only — no bright cyan/yellow, which wash out on white.

local ret_status="%(?:%F{28}➜:%F{160}➜)%f"
PROMPT='${ret_status} %F{25}%c%f $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%F{240}git:(%f%F{90} "
ZSH_THEME_GIT_PROMPT_SUFFIX="%f "
ZSH_THEME_GIT_PROMPT_DIRTY="%f%F{240})%f %F{130}✗%f"
ZSH_THEME_GIT_PROMPT_CLEAN="%f%F{240})%f"
