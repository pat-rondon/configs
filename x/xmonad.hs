import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout
import XMonad.Layout.NoBorders
import XMonad.Layout.Spiral
import XMonad.Layout.Spacing
import Data.Ratio
import qualified Data.Map as M
import XMonad.Prompt
import XMonad.Prompt.Shell
import XMonad.Util.Run

conf = defaultConfig
          { borderWidth        = 2
          , modMask            = mod4Mask
          , terminal           = "urxvt"
          , layoutHook         = smartBorders $ avoidStruts $ Mirror fib ||| fib ||| Mirror tiled ||| tiled ||| Full
          , manageHook         = manageDocks <+> manageHook defaultConfig
          , normalBorderColor  = "#000000"
          , focusedBorderColor = "#ffa500"
          , keys               = newKeys }
 where tiled = Tall 1 (3%100) (1%2)
       fib = spiral (1 % 1)

toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

myPP = xmobarPP
            { ppCurrent = xmobarColor "#0088dd" "black"
            , ppTitle   = xmobarColor "orange" "black" . shorten 60
            , ppSep     = " "
            , ppLayout  = const ""
            }

main = xmonad =<< statusBar "xmobar" myPP toggleStrutsKey conf

newKeys x  = M.union (keys defaultConfig x) (M.fromList (myKeys x))

myKeys x =
           [ ((modMask x, xK_o ), shellPrompt (defaultXPConfig { position = Top }))
           ]
