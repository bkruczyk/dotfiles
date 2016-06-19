import XMonad
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Spacing
import XMonad.Util.EZConfig ( additionalKeys )

myLayoutHook = spacing 4 $ avoidStruts $ layoutHook defaultConfig
myManageHook = manageDocks <+> manageHook defaultConfig
myModMask = mod4Mask
myKeys = [ ((myModMask , xK_r), spawn "rofi -show run")
         , ((myModMask , xK_e), spawn "rofi -show window")
         ]

main :: IO()
main = do
  xmonad $ ewmh defaultConfig
    { terminal           = "termite"
    , focusFollowsMouse  = True
    , modMask            = myModMask
    , borderWidth        = 4
    , layoutHook         = myLayoutHook
    , manageHook         = myManageHook
    , focusedBorderColor = "#0a9dff"
    , normalBorderColor  = "#d9cec3"
    } `additionalKeys` myKeys
