------------------------------------------------------------------------
-- Properties satisfied by preorders
------------------------------------------------------------------------

{-# OPTIONS --universe-polymorphism #-}

open import Relation.Binary

module Relation.Binary.Props.Preorder
         {p₁ p₂ p₃} (P : Preorder p₁ p₂ p₃) where

open import Data.Function
open import Data.Product as Prod

open Relation.Binary.Preorder P

------------------------------------------------------------------------
-- For every preorder there is an induced equivalence

inducedEquivalence : Setoid _ _
inducedEquivalence = record
  { _≈_           = λ x y → x ∼ y × y ∼ x
  ; isEquivalence = record
    { refl  = (refl , refl)
    ; sym   = swap
    ; trans = Prod.zip trans (flip trans)
    }
  }