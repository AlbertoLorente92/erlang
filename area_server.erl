-module(area_server).
-export([start/0, area/2, loop/0]).

start() -> spawn(area_server, loop, []).
area(Pid, What) ->
rpc(Pid, What).
rpc(Pid, Request) ->
Pid ! {self(), Request},
receive
{Pid, Response} ->
Response
end.

loop() ->
receive
{From, {rectangle, Width, Ht}} ->
From ! Width * Ht,
loop();
{From, {circle, R}} ->
From ! 3.14159 * R * R,
loop();
{From, Other} ->
From ! {error,Other},
loop()
end.

