import XMonad
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Hooks.ManageHelpers
import Graphics.X11.ExtraTypes.XF86

myModMask = mod4Mask
myBorderWidth = 2
myBrowser = "google-chrome"
myTerm = "xterm"
myVim = "gvim"

main = do
    xmonad $ defaultConfig
        {
            modMask = myModMask,
            borderWidth = myBorderWidth
        }
        `additionalKeys`
        [
            ((0, xF86XK_AudioMute), spawn "amixer -q set Front toggle"),
            ((0, xF86XK_AudioLowerVolume), spawn "amixer -q set PCM 5%-"),
            ((0, xF86XK_AudioRaiseVolume), spawn "amixer -q set PCM 5%+"),
            ((0, xF86XK_AudioPlay), spawn "mocp -G"),
            ((0, xF86XK_HomePage), spawn myBrowser),
            ((myModMask, xK_x), spawn myTerm),
            ((myModMask, xK_g), spawn myVim)
        ]
