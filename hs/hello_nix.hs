{-# OPTIONS_GHC -Wall #-}

import qualified Data.Vector.Unboxed as U
import           System.Random    (randoms)
import           System.Random.TF (seedTFGen)

nRandomFloats :: Int -> [Float]
nRandomFloats n = take n $ randoms $ seedTFGen (0, 0, 0, 0)

main :: IO ()
main = do
    let n = 1000
    let x = U.fromList $ nRandomFloats n
    print $ U.sum     x / fromIntegral (U.length x)
    print $ U.minimum x
    print $ U.maximum x
    print "It worked!"
