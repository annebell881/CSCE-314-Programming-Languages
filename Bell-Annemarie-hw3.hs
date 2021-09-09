
-- CSCE 314 [Section 502] Programming Languages Spring 2021
-- Homework Assignment 3 (Total 100 points)

-- Problem 1 (5 points)
-- Student Name: Annemarie Bell
-- UIN: 529007879
-- https://hackage.haskell.org/package/base-4.6.0.0/docs/Text-Show.html#:~:text=The%20shows%20functions%20return%20a,of%20results%20using%20function%20composition.&text=Conversion%20of%20values%20to%20readable,complete%20definition%3A%20showsPrec%20or%20show%20.
-- On my honor, as an Aggie, I have neither given nor received any unauthorized
-- aid on any portion of the academic work included in this assignment.

module Main where

import Test.HUnit
import System.Exit

-- *** Read Chapters 8 and 16 ***

data Tree2 a b = Leaf2 a | Branch b (Tree2 a b) (Tree2 a b)

--------------- Tree2 objects
tree2a :: Tree2 Int String -- to be used to test Problems 2 and 3
tree2a = Branch "A" 
            (Branch "B" 
               (Leaf2 1) 
               (Leaf2 2)) 
            (Leaf2 3)

tree2b :: Tree2 Int String -- to be used to test Problems 2 and 3
tree2b = Branch "+" 
            (Branch "*" 
               (Leaf2 3)
               (Branch "+" (Leaf2 4) (Leaf2 5)))
            (Branch "+"
               (Branch "*" (Leaf2 6) (Leaf2 7))
               (Leaf2 8))
---------------

-- Problem 2 (15 points)
--data Tree2 a b = Leaf2 a | Branch b (Tree2 a b) (Tree2 a b)
instance (Show a, Show b) => Show (Tree2 a b) where
   show (Leaf2 x) = show x
--show (Branch a (b) (c)) =
--show a ++ "\n" ++ s2 ++ show b ++ "\n" ++ s2 ++ show c ++ "\n" ++ s1
--where
--d = findDepth (Branch a (b) (c))
--s1 = addSpace (d - 1)
--s2 = addSpace d
--addSpace n = replicate n '\t'

-- Problem 3 (15 points)
preorder  :: (a -> c) -> (b -> c) -> Tree2 a b -> [c]  -- 8 points
preorder f g (Leaf2 a) = [f a]
preorder f g (Branch b left right) = [g b] ++ preorder f g left ++ preorder f g right

inorder   :: (a -> c) -> (b -> c) -> Tree2 a b -> [c]  -- 7 points
inorder = undefined



-- Problem 4 (10 + 15 = 25 points)
-- Chapter 16, Exercise 6 (Modified)

data Tree = Leaf Int | Node Tree Tree

--------------- Tree objects
tree1 :: Tree   -- to be used to test Problem 4.1
tree1 = Node
           (Node
              (Node (Leaf 1) (Leaf 2))
              (Leaf 3)
           )
           (Node
              (Leaf 4)
              (Node (Leaf 5) (Leaf 6))
           )

tree2 :: Tree   -- to be used to test Problem 4.1
tree2 = Node
           (Leaf 7)
           (Node
              (Node (Leaf 8) (Leaf 9))
              (Node (Leaf 10) (Leaf 11))
           )
---------------

-- Problem 4.1 (5 + 5 = 10 points)
leaves :: Tree -> Int
leaves (Leaf _) = 1
leaves (Node l r) = leaves l + leaves r

nodes :: Tree -> Int
nodes (Leaf _) = 0
nodes (Node l r) = nodes l + 1 + nodes r

-- Problem 4.2 (Base case 5 points + inductive case 10 points = 15 points)
{-- (Write your induction proof within this block comment.)
Base case:

nodes (Leaf _) + 1
(apply nodes)
= 0 + 1
(apply the plus sign)
= 1
(take out leaves)
= leaves(Leaf _)

Inductive case: (Make sure that you state the induction hypothesis!)

node(l r) + 1
(apply nodes)
= node l + 1 + node r + 1
(induction of nodes on l: node l = leaves l - 1))
= leaves 1 + node r + 1
(induction of nodes on r: node r = leaves r - 1)
=leaves l + leaves r
(take out leaves)
=leaves (Node l r)

--}


-- Problem 5 (40 points) Chapter 8, Exercise 9
data Expr = Val Int | Add Expr Expr | Mul Expr Expr

type Cont = [Op]

data Op = EVALA Expr | ADD Int | EVALM Expr | MUL Int

eval :: Expr -> Cont -> Int
-- Give three definitions for eval.
-- First two definitions,
-- 1) for (Val n) and c as arguments and
-- 2) for (Add x y) and c as arguments
-- are already given in the text Section 8.7, but
-- you need to modify the second definition slightly
-- and give the third definition for (Mul x y)
--start with Val n and c as the aruguments
eval (Val n) c = exec c n 
--2 ADD X,Y
eval (Add x y) c = eval x(EVALA y : c) --use expressions above
-- define for mutiply
eval(Mul x y) c = eval x (EVALM y : c) -- use experesions above

exec :: Cont -> Int -> Int
-- Give five definitions for exec, one for an empty list and
-- one for each of the four constructors of the data type Op
-- Some of these are already given in the text Section 8.7.
exec [] n = n --empty list
exec (EVALA y:c) n = eval y (ADD n:c)
exec(ADD n:c) m = exec c (n +m)
exec (EVALM y:c) n = eval y (MUL n:c)
exec (MUL n:c) m = exec c (n * m)

value :: Expr -> Int
value e = eval e []

-- Following expressions are to test your eval and exec definitions
-- (2 + 3) + 4 = 9
e1 = (Val 3)    -- 3
e2 = (Add (Val 4) (Val 3))  -- 4 + 3 = 7
e3 = (Mul (Val 4) (Val 3))  -- 4 * 3 = 12
e4 = (Add (Add (Val 2) (Val 3)) (Val 4))  -- (2 + 3) + 4 = 9
e5 = (Mul (Mul (Val 2) (Val 3)) (Val 4))  -- (2 * 3) * 4 = 24
e6 = (Mul (Add (Val 2) (Val 3)) (Val 4))  -- (2 + 3) * 4 = 20
e7 = (Add (Mul (Val 2) (Val 3)) (Val 4))  -- (2 * 3) + 4 = 10
e8 = (Add (Mul (Val 2) (Val 3)) (Add (Val 4) (Val 5))) -- (2 * 3) + (4 + 5) = 15
e9 = (Mul (Add (Val 2) (Val 3)) (Add (Val 4) (Val 5))) -- (2 + 3) * (4 + 5) = 45
e10 = (Add (Mul (Add (Val 2) (Val 3)) (Mul (Val 4) (Val 5))) (Mul (Val 3) (Add (Val 4) (Val 7)))) -- ((2 + 3) * (4 * 5)) + (3 * (4 + 7)) = 133


myTestList = 
  TestList [
  
    "preorder 1" ~: (concat (preorder show id tree2a)) ~=? "AB123"
  , "inorder 1"  ~: (concat (inorder show id tree2a))  ~=? "1B2A3"
  , "preorder 2" ~: (concat (preorder show id tree2b)) ~=? "+*3+45+*678"
  , "inorder 2"  ~: (concat (inorder show id tree2b))  ~=? "3*4+5+6*7+8"
 
  , "leaves 1" ~: leaves tree1 ~=? 6
  , "leaves 2" ~: leaves tree2 ~=? 5
  , "nodes 1"  ~: nodes tree1 ~=? 5
  , "nodes 1"  ~: nodes tree2 ~=? 4

  , "value 1"  ~: value e1 ~=? 3
  , "value 2"  ~: value e2 ~=? 7
  , "value 3"  ~: value e3 ~=? 12
  , "value 4"  ~: value e4 ~=? 9
  , "value 5"  ~: value e5 ~=? 24
  , "value 6"  ~: value e6 ~=? 20
  , "value 7"  ~: value e7 ~=? 10
  , "value 8"  ~: value e8 ~=? 15
  , "value 9"  ~: value e9 ~=? 45
  , "value 10" ~: value e10 ~=? 133
  
    ]

main = do c <- runTestTT myTestList
          putStrLn $ show c
          let errs = errors c
              fails = failures c
          exitWith (codeGet errs fails)
          
codeGet errs fails
 | fails > 0       = ExitFailure 2
 | errs > 0        = ExitFailure 1
 | otherwise       = ExitSuccess