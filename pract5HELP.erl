%%spawn(io, format, ["hola mundo!"])
%%Pid = spawn(fun() -> io:format("hola mundo!") end).
%% is_process_alive(Pid). --> false, muere cuando no tiene codigo que ejecutar.

%%Pid = spawn(fun() ->
%%	receive Any ->
%%		io:format("recibido: ~p~n", [Any])
%%	end
%%end).

%%Pid = spawn(fun() ->
%% receive
%% {P,M} ->
%%  io:format("recibido: ~p~n", [M]),
%% P ! "adios"
%% end
%%end).

-module(saludador).
-compile(export_all).
init() -> spawn(fun()-> procesaMensaje() end).
procesaMensaje() ->
receive
{saluda,Persona} ->
io:format("Hola ~p~n",[Persona]);
Msg ->
io:format("Error: no entiendo ~p~n",[Msg])
end.

receive
Pattern1 [when Guard1] ->
Expressions1;
Pattern2 [when Guard2] ->
Expressions2;
...
end