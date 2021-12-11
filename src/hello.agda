
module hello where

import Relation.Binary.PropositionalEquality as Eq
open Eq using (_≡_; refl)

data ℕ : Set where
  zero : ℕ
  suc  : ℕ → ℕ

{-# BUILTIN NATURAL ℕ #-}

_+_ : ℕ -> ℕ -> ℕ
zero + n = n
(suc m) + n = suc (m + n)

_ : 2 + 3 ≡ 5
_ = refl
