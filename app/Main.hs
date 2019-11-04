{-# LANGUAGE OverloadedStrings #-}
module Main where

import Lib
import WFC.Grid
import qualified Data.Text as T
import qualified Data.Text.IO as T
import System.Console.ANSI
import Patterns
import WFC.Graph
import WFC.Types
import Data.Functor.Compose
import Text.Printf
import Control.Monad.IO.Class
import WFC
import Control.Lens
import Data.Set.NonEmpty as NE
import Control.Applicative
import Data.Monoid
import Data.Foldable

laminate :: [T.Text] -> T.Text
laminate txts = T.unlines pieces
  where
    pieces =
        getZipList . getAp $ foldMap (Ap . ZipList . fmap (<> " ") . T.lines) txts

printStep :: Int -> Int -> Graph Coord Dir (SuperPos (Option Char)) -> IO ()
printStep row col gr = do
    let currentStep = gridToText $ Grid (showSuper gr) row col
    let waviness = gridToText $ Grid (fmap showSuperPosSize gr) row col
    setCursorPosition 0 0
    -- T.putStrLn $ currentStep
    T.putStrLn $ laminate [currentStep, waviness]

showSuperPosSize :: SuperPos a -> Char
showSuperPosSize (Observed _) = '#'
showSuperPosSize (Unknown s)
  | NE.size s > 9 = '*'
  | otherwise = head $ show (NE.size s)

main :: IO ()
main = do
    clearScreen
    hideCursor
    run 20 20 tiledText
    showCursor

run :: Int -> Int -> T.Text -> IO ()
run rows cols txt = do
    let srcGrid = gridFromText txt
    let mPositions = collectSuperPositions srcGrid
    pos <- maybe (fail "No possible states!") return mPositions
    debugPositions pos
    let startGrid = generateGrid pos rows cols
    let minTracker = initMinTracker (startGrid ^. graph)
    runWFC minTracker $ do
        _result <- debugStepper (printStep rows cols) gridFilter (startGrid ^. graph)
        liftIO . T.putStrLn . gridToText . (\g -> Grid g rows cols) . flatten $ _result
        return ()
    return ()

debugPositions :: SuperPos (Option Char)  -> IO ()
debugPositions positions = do
    printf "num positions: %d\n" (length $ positions)
    for_ positions $ (T.putStrLn . printOption)
