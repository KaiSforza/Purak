module Cards where

import Prelude

import Data.Enum (class Enum)
import Data.Maybe (Maybe(..))

data Card = Card
    { suit :: Suit
    , rank :: Rank
    }

derive instance eqCard :: Eq Card
instance ordCard :: Ord Card where
    compare = ordByRank
instance showCard :: Show Card where
    show (Card card) = show card.rank <> show card.suit

eqByRank :: Card -> Card ->Boolean 
eqByRank (Card a) (Card b) = eq a.rank b.rank
ordByRank :: Card -> Card -> Ordering
ordByRank (Card a) (Card b) = compare a.rank b.rank
ordByTrump :: Suit -> Card -> Card -> Ordering
ordByTrump trump a_@(Card a) b_@(Card b) =
    if (a.suit == trump && b.suit == trump)
    then ordByRank a_ b_
    else if (a.suit == trump)
    then GT
    else if (b.suit == trump)
    then LT
    else ordByRank a_ b_

data Suit = Spades
          | Clubs
          | Diamonds
          | Hearts

derive instance eqSuit :: Eq Suit
derive instance ordSuit :: Ord Suit
instance showSuit :: Show Suit where
  show x = case x of
    Clubs    -> "C "
    Diamonds -> "D "
    Hearts   -> "H "
    Spades   -> "S "

readSuit :: String -> Maybe Suit
readSuit x = case x of
  "S" -> Just Spades
  "D" -> Just Diamonds
  "H" -> Just Hearts
  "C" -> Just Clubs
  _ -> Nothing

data Rank
  = Two
  | Three
  | Four
  | Five
  | Six
  | Seven
  | Eight
  | Nine
  | Ten 
  | Jack
  | Queen
  | King
  | Ace

derive instance eqRank :: Eq Rank
derive instance ordRank :: Ord Rank


instance showRank :: Show Rank where
  show x = case x of
    Two   -> "2"
    Three -> "3"
    Four  -> "4"
    Five  -> "5"
    Six   -> "6"
    Seven -> "7"
    Eight -> "8"
    Nine  -> "9"
    Ten   -> "10"
    Jack  -> "J"
    Queen -> "Q"
    King  -> "K"
    Ace   -> "A"

readRank :: String -> Maybe Rank
readRank x = case x of
  "2" -> Just Two
  "3" -> Just Three
  "4" -> Just Four
  "5" -> Just Five
  "6" -> Just Six
  "7" -> Just Seven
  "8" -> Just Eight
  "9" -> Just Nine
  "T" -> Just Ten
  "J" -> Just Jack
  "Q" -> Just Queen
  "K" -> Just King
  "A" -> Just Ace
  _ -> Nothing

