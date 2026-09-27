

local terminal = "alacritty"
local file_manager = "nautilus"
local launcher = "rofi -show drun"



-- =========================================================
-- autostart
-- =========================================================

hl.on("hyprland.start", function()
    hl.exec_cmd("sleep 2 && waybar")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("waypaper --restore")
    hl.exec_cmd("mpd && sleep 2 && mpd-mpris")
end)

-- =========================================================
-- binds
-- =========================================================

hl.bind(
    "SUPER + Q",
    hl.dsp.exec_cmd(terminal)
)

hl.bind(
    "SUPER + SHIFT + C",
    hl.dsp.window.kill()
)

hl.bind(
    "SUPER + M",
    hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)

hl.bind(
    "SUPER + E",
    hl.dsp.exec_cmd(file_manager)
)

hl.bind(
    "SUPER + R",
    hl.dsp.exec_cmd(launcher)
)

hl.bind(
    "SUPER + F",
    hl.dsp.exec_cmd("firefox")
)



-- =========================================================
-- general
-- =========================================================

hl.config({
    general = {
        gaps_in = 1,
        gaps_out = 1,

        border_size = 1,

	resize_on_border = false,
        allow_tearing = false,

        layout = "dwindle",
    },
})

-- =========================================================
-- decoration
-- =========================================================

hl.config({
    decoration = {
        rounding = 10,
        rounding_power = 2,

        active_opacity = 0.9,
        inactive_opacity = 0.9,

        shadow = {
            enabled = false,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },

        blur = {
            enabled = true,
            size = 10,
            passes = 1,
            vibrancy = 0.1696,
        },
    },
})


-- =========================================================
-- cursor timeout
-- =========================================================

hl.config({
    cursor = {
        inactive_timeout = 0.1,
    },
})



-- =========================================================
-- window
-- =========================================================

hl.bind(
    "SUPER + p",
    hl.dsp.window.pseudo()
)

hl.bind(
    "SUPER + k",
    hl.dsp.layout("togglesplit")
)

hl.bind(
    "SUPER + space",
    hl.dsp.window.float({ action = "toggle" })
)

hl.bind(
    "SUPER + SHIFT + f",
    hl.dsp.window.fullscreen({ mode = "fullscreen" })
)

-- =========================================================
-- monitor and scale
-- =========================================================

hl.monitor({
    output = "",
    mode = "highres",
    position = "auto",
    scale = 1,
})

-- =========================================================
-- choose launguage
-- =========================================================

hl.config({
    input = {
        kb_layout = "us,ru",
        kb_options = "grp:caps_toggle,caps:shift_capslock",

        repeat_delay = 400,
        repeat_rate = 80,

        scroll_method = "on_button_down",
        scroll_button = 276,

        follow_mouse = 1,

        touchpad = {
            natural_scroll = false,
        },
    },
})

-- =========================================================
-- move windows
-- =========================================================


hl.bind(
    "SUPER + SHIFT + left",
    hl.dsp.window.move({ direction = "l" })
)
hl.bind(
    "SUPER + SHIFT + right",
    hl.dsp.window.move({ direction = "r" })
)
hl.bind(
    "SUPER + SHIFT + up",
    hl.dsp.window.move({ direction = "u" })
)
hl.bind(
    "SUPER + SHIFT + down",
    hl.dsp.window.move({ direction = "d" })
)

-- =========================================================
-- resize
-- =========================================================

hl.bind(
    "SUPER + ALT + left",
    hl.dsp.window.resize({
        x = -70,
        y = 0,
        relative = true,
    })
)

hl.bind(
    "SUPER + ALT + right",
    hl.dsp.window.resize({
        x = 70,
        y = 0,
        relative = true,
    })
)

hl.bind(
    "SUPER + ALT + up",
    hl.dsp.window.resize({
        x = 0,
        y = -70,
        relative = true,
    })
)

hl.bind(
    "SUPER + ALT + down",
    hl.dsp.window.resize({
        x = 0,
        y = 70,
        relative = true,
    })
)

-- =========================================================
-- resize mouse
-- =========================================================

hl.bind(
    "SUPER + mouse:272",
    hl.dsp.window.drag(),
    { mouse = true }
)

hl.bind(
    "SUPER + mouse:273",
    hl.dsp.window.resize(),
    { mouse = true }
)

-- =========================================================
-- animations
-- =========================================================

hl.curve("myBezier", {
    type = "bezier",
    points = {
        { 0.05, 0.9 },
        { 0.1, 1.05 },
    },
})

hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 7,
    bezier = "myBezier",
})

hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 1,
    bezier = "default",
    style = "popin 80%",
})

hl.animation({
    leaf = "border",
    enabled = true,
    speed = 10,
    bezier = "default",
})

hl.animation({
    leaf = "borderangle",
    enabled = true,
    speed = 8,
    bezier = "default",
})

hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 3,
    bezier = "default",
    style = "slidevert",
})



-- =========================================================
-- workspaces 1-10
-- =========================================================

hl.bind("SUPER + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind("SUPER + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind("SUPER + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind("SUPER + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind("SUPER + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind("SUPER + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind("SUPER + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind("SUPER + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind("SUPER + 9", hl.dsp.focus({ workspace = 9 }))
hl.bind("SUPER + 0", hl.dsp.focus({ workspace = 10 }))



-- =========================================================
-- move window to worlspaces
-- =========================================================


-- Move window to workspaces
hl.bind("SUPER + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind("SUPER + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind("SUPER + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind("SUPER + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind("SUPER + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind("SUPER + SHIFT + 6", hl.dsp.window.move({ workspace = 6 }))
hl.bind("SUPER + SHIFT + 7", hl.dsp.window.move({ workspace = 7 }))
hl.bind("SUPER + SHIFT + 8", hl.dsp.window.move({ workspace = 8 }))
hl.bind("SUPER + SHIFT + 9", hl.dsp.window.move({ workspace = 9 }))
hl.bind("SUPER + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))


-- =========================================================
-- screenshots
-- =========================================================


hl.bind("Print",
    hl.dsp.exec_cmd("grim - | wl-copy"))

hl.bind("SUPER + SHIFT + S",
    hl.dsp.exec_cmd("grim -g \"$(slurp)\" - | wl-copy"))


-- ============================================
-- Brightness
-- ============================================

hl.bind("XF86MonBrightnessUp",
    hl.dsp.exec_cmd("brightnessctl set +5%"))

hl.bind("XF86MonBrightnessDown",
    hl.dsp.exec_cmd("brightnessctl set 5%-"))


-- ============================================
-- Audio
-- ============================================

hl.bind("XF86AudioRaiseVolume",
    hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +5%"))

hl.bind("XF86AudioLowerVolume",
    hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -5%"))

hl.bind("XF86AudioMute",
    hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"))

hl.bind("XF86AudioMicMute",
    hl.dsp.exec_cmd("pactl set-source-mute @DEFAULT_SOURCE@ toggle"))


-- ============================================
-- MPD
-- ============================================

hl.bind("XF86AudioPlay",
    hl.dsp.exec_cmd("mpc toggle"))

hl.bind("XF86AudioNext",
    hl.dsp.exec_cmd("mpc next"))

hl.bind("XF86AudioPrev",
    hl.dsp.exec_cmd("mpc prev"))
