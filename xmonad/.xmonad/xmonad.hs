import XMonad
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks

myLayoutHook = avoidStruts $ layoutHook defaultConfig
myManageHook = manageDocks <+> manageHook defaultConfig

main :: IO()
main = do
  xmonad $ ewmh defaultConfig
    { terminal           = "termite"
    , focusFollowsMouse  = True
    , modMask            = mod4Mask
    , borderWidth        = 4
    , layoutHook         = myLayoutHook
    , manageHook         = myManageHook
    -- , handleEventHook    = fullscreenEventHook
    , focusedBorderColor = "#0a9dff" -- tardis
    , normalBorderColor  = "#d9cec3" -- brightgravel
    }
