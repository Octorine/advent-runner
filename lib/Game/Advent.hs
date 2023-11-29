module Game.Advent where

import System.TimeIt (timeItT)
import Text.Printf ( printf )
import Control.Exception (evaluate)

data Day = Day
  { dayName :: String,
    dayPart1 :: IO String,
    dayPart2 :: IO String
  }

runDay :: Day -> IO ()
runDay day = do
  runPart "1" =<< timeItT (evaluate =<< dayPart1  day)
  runPart "2" =<< timeItT (evaluate =<< dayPart2  day)
  where
    runPart part (elapsed, result) =
      printf
        "% 8s Part %s\t\tResult: %- 60s Time: %0.4f S\n"
        (if part == "1" then "Day " ++ dayName day ++ "," else "")
        part
        result
        elapsed

