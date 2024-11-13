%{
 (* type interface = Auto of string | Iface of string *)
%}


%token <string> ID
%token AUTO
%token IFACE
%token INET
%token LOOPBACK
%token DHCP
%token STATIC
%token ADDRESS
%token NETMASK
%token GATEWAY
%token IP_ADDR
%token EOF

(* Exercice 2 *)
(* Déclarations du type de l'attribut associé à un non terminal *)
(* Dans un premier temps on ignore cet attribut -> type unit *)
%type <string list * string list> i
%type <unit> t

(* Indication de l'axiom et du type de l'attribut associé à l'axiom *)
(* Dans un premier temps on ignore cet attribut -> type unit *)
%start <string list * string list> is

%%

(*
IS -> I IS
IS -> $
I -> AUTO ID
I -> IFACD ID INET T
T -> LOOPBACK
T -> DHCP
T -> STATIC ADDRESS IP_ADDR NETMASK IP GATEWAY IP
*)

is :
| i = i is= is {let (i1, a1) = i in let (i2, a2) = is in (i1 @ i2, a1 @ a2)} (* action sémantique associée à une règle de prodution -> dans un premier temps () *)
| EOF  {([], [])}


i : 
| AUTO id = ID {[], [id]}
| IFACE id = ID  INET t {[id], []}

t :
| LOOPBACK {()}
| DHCP {()}
| STATIC ADDRESS IP_ADDR NETMASK IP_ADDR GATEWAY IP_ADDR {()}

%%
