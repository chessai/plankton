{-# OPTIONS_GHC -Wall #-}

-- | Ring classes. A distinguishment is made between Rings and Commutative Rings.
module Plankton.Ring
  ( Semiring
  , Ring
  , CRing
  ) where

import Data.Complex (Complex(..))
import Plankton.Additive
import Plankton.Distribution
import Plankton.Multiplicative
import Protolude (Bool(..), Double, Float, Int, Integer)

-- | Semiring
class (MultiplicativeAssociative a, MultiplicativeUnital a, Distribution a) =>
      Semiring a

instance Semiring Double

instance Semiring Float

instance Semiring Int

instance Semiring Integer

instance Semiring Bool

instance (AdditiveGroup a, Semiring a) => Semiring (Complex a)

-- | Ring
-- a summary of the laws inherited from the ring super-classes
--
-- > zero + a == a
-- > a + zero == a
-- > (a + b) + c == a + (b + c)
-- > a + b == b + a
-- > a - a = zero
-- > negate a = zero - a
-- > negate a + a = zero
-- > a + negate a = zero
-- > one `times` a == a
-- > a `times` one == a
-- > (a `times` b) `times` c == a `times` (b `times` c)
-- > a `times` (b + c) == a `times` b + a `times` c
-- > (a + b) `times` c == a `times` c + b `times` c
-- > a `times` zero == zero
-- > zero `times` a == zero
class ( AdditiveGroup a
      , MultiplicativeAssociative a
      , MultiplicativeUnital a
      , Distribution a
      ) =>
      Ring a

instance Ring Double

instance Ring Float

instance Ring Int

instance Ring Integer

instance (Ring a) => Ring (Complex a)

-- | CRing is a Ring with Multiplicative Commutation.  It arises often due to '*' being defined as a multiplicative commutative operation.
class (Multiplicative a, Ring a) =>
      CRing a

instance CRing Double

instance CRing Float

instance CRing Int

instance CRing Integer

instance (CRing a) => CRing (Complex a)
