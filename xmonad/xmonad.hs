import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Layout
import XMonad.Layout.NoBorders
import XMonad.Layout.Spiral
import Data.Ratio
import qualified Data.Map as M
import XMonad.Prompt
import XMonad.Prompt.Shell

main = xmonad $ defaultConfig
        { borderWidth        = 2
        , terminal           = "urxvt"
        , layoutHook         = Mirror fib ||| fib ||| Mirror tiled ||| tiled ||| noBorders Full
        , normalBorderColor  = "#000000"
        , focusedBorderColor = "#00aaaa"
        , modMask            = mod4Mask
        , keys               = newKeys }
 where tiled = Tall 1 (3%100) (1%2)
       fib = spiral (1 % 1)

newKeys x  = M.union (keys defaultConfig x) (M.fromList (myKeys x))

myKeys x =
           [ ((modMask x, xK_o ), shellPrompt (defaultXPConfig { position = Top }))
           ]
