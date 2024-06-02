import Control.Monad (when)
import Lib (someFunc)

main :: IO ()
main = when (someFunc 15 /= 16) $ error "tests failed"
