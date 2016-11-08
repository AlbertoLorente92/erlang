-module(pract2).
-export([sonMúltiplos/2,mapTree/2,nNodos/1,impares/1,acker/2,mismoConjunto/2,normal/1,intersection/2,esta/2]).

impares([]) -> [];
impares([X|Y]) -> lists:append([X],impares(tl(Y))).

acker(0,N) -> N+1;
acker(M,0) when M > 0 -> acker(M-1,1);
acker(M,N) -> acker(M-1,acker(M,N-1)).

contenido(_,[]) -> false;
contenido(X,Y) -> case X=:=hd(Y) of
                            false -> contenido(X,tl(Y));
                            true -> true
						end.					
						
mismoConjunto([],_) -> true;
mismoConjunto(X,Y) -> case contenido(hd(X),Y) of
                            false -> false;
                            true -> mismoConjunto(tl(X),Y)
						end.
normal([]) -> [];							
normal([X|Y]) -> case contenido(X,Y) of
						true -> normal(Y);
						false -> lists:append([X],normal(Y))
						end.
						
intersection([],[]) -> [];	
intersection([],_) -> [];		
intersection(X,Y) -> case contenido(hd(X),Y) of
						true -> lists:append([hd(X)],intersection(tl(X),Y));
						false -> intersection(tl(X),Y)
						end.

esta(_,{}) -> false;						
esta(E,X) -> case element(1,X)=:=E of
						true -> true;
						false -> esta(E,element(2,X)) orelse esta(E,element(3,X))
						end.
nNodos({}) -> 0;						
nNodos({_,X2,X3})	-> 1 + 	nNodos(X2) + nNodos(X3).		

mapTree(_,{}) -> {};
mapTree(F,{X1,X2,X3}) -> {F(X1),mapTree(F,X2),mapTree(F,X3)}.

sonMúltiplos(0,_) -> true;
sonMúltiplos(X,Y) -> case (Y rem X)=:=0 of
					true -> true;
					false -> false
					end.