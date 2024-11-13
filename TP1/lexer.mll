{
(* type token = ID of string | AUTO  | IFACE | INET | LOOPBACK | DHCP | STATIC | ADDRESS | NETMASK | GATEWAY | IP_ADDR | EOF (* A COMPLETER *) *)
open Parser

exception Error of string
}

(* Définitions de macro pour les expressions régulières *)
let blanc = [' ' '\t' '\n']
 (* À compléter éventuellement *)

let nb = ['0'-'9'] | (['1'-'9'] ['0'-'9']) | ('1'['0'-'9']['0'-'9']) | ('2'['0'-'4']['0'-'9']) | ("25"['0'-'5'])
let adresse = nb '.' nb '.' nb '.' nb
let nom = ['a'-'z']+ ['A'-'Z''a'-'z''0'-'9']*

(* Règles léxicales *)
rule interface = parse
|  blanc (* On ignore les blancs *)
    { interface lexbuf }
| "auto"
    { AUTO }
| "iface"
    { IFACE }
| "inet"
    { INET }
| "loopback"
    { LOOPBACK }
| "dhcp"
    { DHCP }
| "static" 
    { STATIC }
| "netmask"
    { NETMASK }
| "gateway"
    { GATEWAY }
| "address"
    { ADDRESS }
| adresse
    { IP_ADDR }
| nom as interface_name 
    { ID interface_name}
| eof
    { EOF }
| _
{ raise (Error ("Unexpected char: "^(Lexing.lexeme lexbuf)^" at "^(string_of_int (Lexing.lexeme_start
lexbuf))^"-"^(string_of_int (Lexing.lexeme_end lexbuf)))) }
