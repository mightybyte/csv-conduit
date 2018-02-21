{-# LANGUAGE OverloadedStrings    #-}
{-# LANGUAGE TypeSynonymInstances #-}

module Data.CSV.Conduit.Types where

-------------------------------------------------------------------------------
import           Data.Default
import qualified Data.Map     as M
-------------------------------------------------------------------------------


-------------------------------------------------------------------------------
-- | Settings for a CSV file. This library is intended to be flexible
-- and offer a way to process the majority of text data files out
-- there.
data CSVSettings = CSVSettings
  {
    -- | Separator character to be used in between fields
    csvSep       :: !Char

    -- | Quote character that may sometimes be present around fields.
    -- If 'Nothing' is given, the library will never expect quotation
    -- even if it is present.
  , csvQuoteChar :: !(Maybe Char)
  } deriving (Read, Show, Eq)



-------------------------------------------------------------------------------
-- | Default settings for a CSV file.
--
-- > csvSep = ','
-- > csvQuoteChar = Just '"'
--
defCSVSettings :: CSVSettings
defCSVSettings = CSVSettings
  { csvSep = ','
  , csvQuoteChar = Just '"'
  }


instance Default CSVSettings where
    def = defCSVSettings

-------------------------------------------------------------------------------
-- | A 'Row' is just a list of fields
type Row a = [a]

-------------------------------------------------------------------------------
-- | A 'MapRow' is a dictionary based on 'Data.Map' where column names
-- are keys and row's individual cell values are the values of the
-- 'Map'.
type MapRow a = M.Map a a

-------------------------------------------------------------------------------
-- | An 'AlistRow' is a list of pairs where column names are the first element
-- and row's individual cell values are the second element.  This is sometimes
-- more desirable than 'MapRow' because it preserves column order.
type AlistRow a = [(a,a)]
