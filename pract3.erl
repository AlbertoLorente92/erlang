-module(pract3).
-include_lib("eunit/include/eunit.hrl").
-export([different/3,differentBis/3,equal/3,morosos/1,triangulo/1,maxLists/2]).

%1)
different(_,_,[]) -> [];
different(F,G,L) -> lists:filter(fun(X) -> F(X)/=G(X) end,L).

%2)
abs(X) when X<0 -> -X;
abs(X) when X>=0 -> X.

id(X) -> X.
different_test() -> ?assertEqual(different(fun abs/1, fun id/1, lists:seq(-3,10) ), [-3,-2,-1]). 

%3)
differentBis(_,_,[]) -> [];
differentBis(F,G,L) -> [ X || X <- L, F(X)=/=G(X)].

%4)
differentBis_test() -> ?assertEqual(differentBis(fun abs/1, fun id/1, lists:seq(-3,10) ), [-3,-2,-1]).

%5) 

equal(_,_,[]) -> true;
equal(F,G,L) -> case length(different(F,G,L))=:=0 of
				true -> true;
				false -> false
				end.
%6) 

equal_test() -> ?assertEqual(equal(fun abs/1, fun abs/1, lists:seq(-10,10) ), true).

%7)

morosos(L) -> [element(1,X) || X <-L, element(2,X)<0]	.	
				
%8) 

morosos_test() -> ?assertEqual(morosos([ {bertoldo, 500}, {herminia,cancelada}, {aniceto,-2000} ]), [aniceto]).		

%9) 

triangulo(N) ->  [lists:seq(X,Y) || X <-lists:seq(1,N), Y <- lists:seq(1,N), X=<Y andalso X=:=1 ].

%10) maxLists(LF,LV), donde LF = [F1,…, FN] es una lista de funciones y LV=[V1,…,VM] una lista
%de valores. La función maxLists(LF,LV) devolverá
% [max(F1(V1),…,FN(V1)), …,max(F1(VM),…,FN(VM))]
%con max la función máximo. La función estará definida por una sola regla y usará listas
%intensionales. Sugerencia: usar lists:foldl/3 y erlang:max/2 como funciones auxiliares.
	
%maxLists(LF,LV) -> lists:foldl(fun erlang:max/2, 0, [ X(Y) || X <- LF, Y <- LV]).

dameList(X,LV) ->[ X(Y) ||  Y <- LV].

maxLists(LF,LV) -> lists:foldl(fun erlang:max/2, 0,[ dameList(X,LV) ||  X <- LF]).	
%lists:foldl(fun erlang:max/2,0, [1,2,3,4,5])
	%[[2,1,4],[4,4,5],[6,9,6]]

%pract3:maxLists([fun(X)->X+X end, fun(X)->X*X end, fun(X) -> X+3 end], lists:seq(1,3)). 
%[4,5,9]	