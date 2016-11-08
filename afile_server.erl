-module(afile_server).
-export([start/1, loop/1]).
start(Dir) -> spawn(afile_server, loop, [Dir]).
loop(Dir) ->
receive
{Client, list_dir} ->
Client ! {self(), file:list_dir(Dir)};
{Client, {get_file, File}} ->
Full = filename:join(Dir, File),
Client ! {self(), file:read_file(Full)}
end,
loop(Dir).

%file:list_dir(Dir) ficheros en dir
%filename:join(Dir,File) concatena File a Dir
%process_info(self()). infor del proceso actual
%process_info(self(),messages). mensajes del proceso