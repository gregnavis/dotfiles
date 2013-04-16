import System.IO

import Graphics.X11.ExtraTypes.XF86

import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)

main = do
    xmobar <- spawnPipe "xmobar"
    xmonad $ defaultConfig
        {
            manageHook = manageDocks <+> manageHook defaultConfig,
            layoutHook = avoidStruts $ layoutHook defaultConfig,
            logHook = dynamicLogWithPP xmobarPP
                {
                    ppOutput = hPutStrLn xmobar,
                    ppTitle = xmobarColor "green" "" . shorten 50
                },
            borderWidth = 1,
            terminal = "urxvtc",
            modMask = mod4Mask,
            focusFollowsMouse = False
        }
        `additionalKeys`
        [
            ((0, xF86XK_AudioMute), spawn "amixer -q set Front toggle"),
            ((0, xF86XK_AudioLowerVolume), spawn "amixer -q set PCM 5%-"),
            ((0, xF86XK_AudioRaiseVolume), spawn "amixer -q set PCM 5%+"),
            ((0, xF86XK_AudioPlay), spawn "mocp -G"),
            ((0, xF86XK_HomePage), spawn "firefox"),
            ((mod4Mask, xK_g), spawn "gvim"),
            ((mod4Mask, xK_s), spawn "slock"),
            ((mod4Mask, xK_Print), spawn "scrot")
        ]
