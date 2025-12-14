# Fix for terminal prompt rendering issues on startup
# Issue: fish renders the prompt before terminal dimensions are properly detected,
# causing garbled/wrapped text that disappears on window resize
#
# This affects terminals like Ghostty, iTerm2, and others where there's a race
# condition between terminal initialization and fish's prompt rendering

if status is-interactive
    # Ensure terminal size is detected before first prompt
    # This function runs once per shell session
    function __fix_prompt_init --on-event fish_prompt
        if not set -q __prompt_init_fixed
            set -g __prompt_init_fixed 1
            
            # Force terminal to recalculate dimensions and redraw
            # The key is to do this AFTER the first prompt attempt
            commandline -f repaint 2>/dev/null
            
            # Clean up - remove this function after first run
            functions -e __fix_prompt_init
        end
    end
end

