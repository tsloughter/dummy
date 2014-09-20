-module(dummy).

-behaviour(rebar_provider).

-export([init/1,
         do/1]).

-define(PROVIDER, dummy).
-define(DEPS, []).

%% ===================================================================
%% Public API
%% ===================================================================

-spec init(rebar_state:t()) -> {ok, rebar_state:t()}.
init(State) ->
    State1 = rebar_state:add_provider(State, rebar_provider:create([{name, ?PROVIDER},
                                                                    {provider_impl, ?MODULE},
                                                                    {bare, false},
                                                                    {deps, ?DEPS},
                                                                    {example, "rebar dummy"},
                                                                    {short_desc, "dummy plugin."},
                                                                    {desc, ""},
                                                                    {opts, []}])),
    {ok, State1}.

-spec do(rebar_state:t()) -> {ok, rebar_state:t()}.
do(State) ->
    io:format("I am a dummy plugin~n"),
    {ok, State}.
