%{
#include"y.tab.h"
%}
%%
"<" {return OPEN;}
">" {return CLOSED;}
[/]?[a-zA-Z0-9]+ {return ID;}
\n return 0;
%%
