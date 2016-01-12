/*Generated by DSLFORGE*/

grammar InternalStatemachine;

options {
  language=JavaScript;
  output=AST;
  ASTLabelType=CommonTree;
}

@lexer::header {
}

@parser::header {
}

 
rule_Statemachine :
	('events' 
		events+=rule_Event+ 
	'end')? ('resetEvents' 
		resetevents+=ID+ 
	'end')? ('commands' 
		commands+=rule_Command+ 
	'end')? states+=rule_State*
 EOF!;


rule_Event:
	name=ID code=ID
;


rule_Command:
	name=ID code=ID
;


rule_State:
	'state' name=ID ('actions' '{' actions+=ID+ '}')? transitions+=rule_Transition*
	'end'
;


rule_Transition:
	event=ID '=>' state=ID;


ID : ('a'..'z' | 'A'..'Z' | '_') ('a'..'z' | 'A'..'Z' | '_' | '0'..'9')* ;

STRING : ('"' ('\\' ('b'|'t'|'n'|'f'|'r'|'u'|'"'|'\''|'\\')|~(('\\'|'"')))* '"'|'\'' ('\\' ('b'|'t'|'n'|'f'|'r'|'u'|'"'|'\''|'\\')|~(('\\'|'\'')))* '\'');

COMMENT : ('/*' .* '*/' | '//' ~('\r' | '\n')*)   { $channel = HIDDEN; } ;

WS:  (' '|'\r'|'\t'|'\u000C'|'\n') {$channel=HIDDEN;} ;

//NUMBER: INT ('.' INT)?;

INT: ('0'..'9')+;
