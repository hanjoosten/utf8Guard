{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
module Run (run) where

import Import
import qualified RIO.ByteString.Lazy as BL

run :: RIO App ()
run = do
   bs <- BL.hGetContents stdin
   let bsSafe = doProces bs
   BL.hPut stdout bsSafe

doProces :: BL.ByteString -> BL.ByteString
doProces = BL.fromStrict . encodeUtf8 . decodeUtf8With lenientDecode . BL.toStrict

