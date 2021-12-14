module Lib where

{-

Prob description:
Given is an undirected graph with N vertices and M edges. The vertices are
called Vertex 1, Vertex 2, …, Vertex N, and the edges are called Edge 1, Edge 2,
…, Edge M. Edge i (1≤i≤M) connects Vertex U_i  and Vertex V_i.
It is guaranteed that the graph is simple: it has no self-loops and no
multi-edges.

There are 2^M ways to direct every edge in this graph. We want each vertex to
have exactly one edge going from that vertex to another vertex. How many ways
are there to direct the edges in that way? Since the answer may be enormous,
print it modulo 998244353.

Solution:

Graph accepting such way of directing edges are (2-regular + hanging strings/trees?).
Note that 2-regular graphs have a cycle (Hamiltonian one)
Idk if that exists or it is the correct name but I think that would work.

We have two ways for each component of the graph, so 2^Numofcomponents
-}

import Data.IntSet as S
import Data.HashMap.Mutable.Basic as HM
import Control.Monad.Primitive
import Control.Monad as M

import Data.List as L hiding (lookup)

import Prelude as P hiding (lookup)

type Graph m = MHashMap (PrimState m) Int [Int]

insertEdge :: PrimMonad m => Graph m -> (Int,Int) -> m ()
insertEdge g (i,j) = HM.lookup g i >>= maybe (HM.insert g i [j]) (HM.insert g i . (j:))

removeEdge :: PrimMonad m => Graph m -> (Int, Int) -> m ()
removeEdge g (i,j) = HM.lookup g i >>= maybe (return ()) (\ls -> HM.insert g i (L.delete j ls))

removeBEdge :: PrimMonad m => Graph m -> (Int,Int) -> m ()
removeBEdge g (i,j) = removeEdge g (i,j) >> removeEdge g (j,i)

batchRemove :: PrimMonad m => Graph m -> [(Int,Int)] -> m ()
batchRemove g = P.mapM_ (removeBEdge g)

buildHGraph :: PrimMonad m => [(Int,Int)] -> m (Graph m)
buildHGraph ns =
  do
    g <- new
    P.mapM_ (\(a,b) -> insertEdge g (a,b) >> insertEdge g (b,a)) ns
    return g

--

-- Traverse a connected component destroying edges and counting.
connectedComp :: PrimMonad m
                  => Graph m -> Int -> m (IntSet, Int)
connectedComp gr st  =
  lookup gr st >>= maybe (return (empty,0))
  (\ngs ->
     batchRemove gr (zip ngs (repeat st)) >>
     traverse ngs (singleton st, length ngs))
  where
    traverse [] res = return res
    traverse (x:xs) res@(visited, eds) =
      lookup gr x >>=
      maybe (traverse xs res) (\ngsx ->
        batchRemove gr (zip ngsx (repeat x)) >>
        traverse (ngsx ++ xs) (S.insert x visited, eds + (length ngsx))
                                 )

-- 2-regular + hanging trees
check :: IntSet -> Int -> Bool
check s n = size s == n


accumulateResults :: PrimMonad m => Graph m -> [Int] -> m (Integer, IntSet)
accumulateResults g = M.foldM
  (\(acc, visited) st ->
     if acc == 0 then return (acc, visited)
     else if S.member st visited then return (acc, visited)
     else
       (connectedComp g st >>=
       \(vis, eds) -> if check vis eds
                      then return (2*acc, S.union visited vis)
                      else return (0, visited))
  ) (1, S.empty)

solution :: PrimMonad m => Int -> [(Int,Int)] -> m Integer
solution nds lgrp = ( flip mod 998244353 . fst) <$> sol'
  where
    sol' = buildHGraph lgrp >>= flip accumulateResults [1 .. nds]
