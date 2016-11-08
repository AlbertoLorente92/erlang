-module(pract4).
-include("pract4.hrl").
-export([edad/1,vecinos/2,habitantes/2,incluye/2,mapSafe/2,poker/1,ordenaLista/1,ordenaAux/1]).

edad(Per) -> Per#persona.edad.

vecinos(P1,P2) -> case P1#persona.calle=:=P2#persona.calle andalso P1#persona.ciudad=:=P2#persona.ciudad of
					true -> true ;
					false -> false
					end.
					
habitantes([], _) -> [];
habitantes([X|Y], Ciudad) -> case X#persona.ciudad=:=Ciudad of
						true -> lists:append([X],habitantes(Y,Ciudad));
						false -> habitantes(Y,Ciudad)
						end.				
						
dniEnLista(_,[]) -> false;
dniEnLista(Dni,[X|Y]) -> case Dni=:=X#persona.dni of
						true -> true;
						false -> dniEnLista(Dni,Y)
						end.

incluye(Per, X) -> case dniEnLista(Per#persona.dni,X) of
						true -> X;
						false -> [Per|X]
						end.
						
mapSafe(_,[]) -> [];
mapSafe(F,[X|Y]) -> try [ F(X) | mapSafe(F,Y) ] catch error:_ -> [error | mapSafe(F,Y)] end	.

