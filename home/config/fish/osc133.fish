# (Partially) Copied from: https://github.com/kovidgoyal/kitty/blob/v0.26.5/shell-integration/fish/vendor_conf.d/kitty-shell-integration.fish

if not set -q __nifoc_prompt_state
    function __nifoc_mark_prompt_start --on-event fish_prompt --on-event fish_cancel --on-event fish_posterror
        test "$__nifoc_prompt_state" != prompt-start
        and echo -en "\e]133;D\a"
        set --global __nifoc_prompt_state prompt-start
        echo -en "\e]133;A\a"
    end
    __nifoc_mark_prompt_start

    function __nifoc_mark_output_start --on-event fish_preexec
        set --global __nifoc_prompt_state pre-exec
        echo -en "\e]133;C\a"
    end

    function __nifoc_mark_output_end --on-event fish_postexec
        set --global __nifoc_prompt_state post-exec
        echo -en "\e]133;D;$status\a"
    end

    set --global fish_handle_reflow 1
end
