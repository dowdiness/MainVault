Call-by-Push-Valueは値呼び戦略と名前呼び戦略を両立させる評価戦略。

従来の理論では項(Term)しかなかったのを、CbPVでは項を値と計算に区別する。

```hs
data Type 
    = Int
    | Fun Type Type

data Term
    = Var Text
    | Int Int
    | Fun Text Term
    | App Term Term
```

```hs
-- Type of values
data ValType 
    = Int
    | Thunk CompType

-- Type of computations
data CompType 
    = Fun ValType CompType -- !!
    | Return ValType

-- A value term
data Value
    = Int Int
    | Var Text
    | Thunk Comp

-- A computation term
data Comp
    = Fun Text Comp
    | App Comp Value
    | Return Value
```