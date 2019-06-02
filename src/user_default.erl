-module(user_default).
-export([msg/0,msg/1]).
-export([rec/0]).
-export([tcp/0]).

% ------------------------------------------------------------------
% show messages in mailbox
% ------------------------------------------------------------------

msg() ->
    msg(self()).

msg(Pid) when is_pid(Pid) ->
    process_info(Pid,messages);

msg(Name) when is_atom(Name) ->
    case whereis(Name) of
        undefined -> noproc;
        Pid -> msg(Pid)
    end.

% ------------------------------------------------------------------
% add recon lib ebin path
% ------------------------------------------------------------------

rec() ->
    code:add_patha("/Users/boshansun/Development/github/recon/_build/default/lib/recon/ebin").

% ------------------------------------------------------------------
% show tcp ports
% ------------------------------------------------------------------

tcp() ->
    Tcps=recon:tcp(),
    T=[begin P=recon:port_info(P0),
             Sock='Elixir.Kernel':get_in(P,[type,sockname]),
             Peer='Elixir.Kernel':get_in(P,[type,peername]),
             Type=get_type(Peer),
             {Type,P0,Sock,Peer}
    end || P0 <- Tcps],
    {length(Tcps),T}.

get_type(nil) -> ls;
get_type({_,N}) when N < 40000 -> c;
get_type({_,_}) -> s.
