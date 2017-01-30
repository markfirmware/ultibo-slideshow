unit uSlides;

interface
type
 TSlide=record
  Lines:Array[0..999] of String;
  NumberOfLines:Integer;
 end;
 TSlides=record
  Slides:Array[1..100] of TSlide;
  NumberOfSlides:Integer;
 end;

function SlidesFirstSlideNumber:LongWord;
function SlidesNextSlideNumber(N:LongWord):LongWord;

var
 Slides:TSlides;

implementation

function SlidesFirstSlideNumber:LongWord;
begin
 SlidesFirstSlideNumber:=1;
end;

function SlidesNextSlideNumber(N:LongWord):LongWord;
var
 Next:LongWord;
begin
 Next:=N + 1;
 if Next > Slides.NumberOfSlides then
  Next:=1;
 SlidesNextSlideNumber:=Next;
end;

procedure InitSlide;
begin
 with Slides do
  begin
   Inc(NumberOfSlides);
   Slides[NumberOfSlides].NumberOfLines:=0;
  end;
end;

procedure AddLine(Line:String);
begin
 with Slides.Slides[Slides.NumberOfSlides] do
  begin
   Lines[NumberOfLines]:=Line;
   Inc(NumberOfLines);
  end;
end;

procedure MakeUltiboOrg;
begin
 InitSlide;
 AddLine('                                                                   ..........................................................................................................................           ');
 AddLine('                                                               .'';;clllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll:;''.       ');
 AddLine('                                                              .;lodxxxxdooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooddxxxdolc.      ');
 AddLine('                                                              ,lodkOkxdc:;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;::oxkOOxol;      ');
 AddLine('                                                             .cloxxxol:.                                                                                                                 ''lodkkdoc.     ');
 AddLine('                                                             .clloooll;                                                                                                                  .lodkkdoc.     ');
 AddLine('                                                             ..........                                                                                                                  .lodkkdoc.     ');
 AddLine('                                           .........                                   .........          .......''.                                                                      .lodkkdoc.     ');
 AddLine('                                           ...''''''''''''''.               ..                .......''.''.       ....''''''''''..                                                                     .lodkkdoc.     ');
 AddLine('                                           ..'',,,,,,c''        .......''''..              ..''''''''''''..        ...'',,,,,..                                                                     .lldkkdoc.     ');
 AddLine('                                           ..'',,,,,,c.        ...''''''''''''.               .........         ...'',,,,,.                                                                      .lldkkdoc.     ');
 AddLine('                                           ..'',,,,,,:.        ..'',,,''..                                  ...'',,,,,.                                                                      .lldkkdoc.     ');
 AddLine('          ....               .....         ..'',,,,,,;.       ...,,;,''....    ...            ....         ...'',,,''.      ........                       ...........                       .lldkkdoc.     ');
 AddLine('     .......''''..        .......''''''         ..'',,,,,,;.    .....'',;;;,''''.........       ......''''..        ...'',,''..  ................             ......................                  .lldkkdoc.     ');
 AddLine('     ..'''',,,,,,.        ...,,,,,,,.        ..'',,,,,,:.   ......'',;;;,,,,,''''''''''''.       ..'',,,,,''.        ...'',,,.......''''....''''''''....           ...'''',,,,,,,''''....''''''....                .lldkkdoc.     ');
 AddLine('     ..'',,,,,,,.        ..'',,,,,,;.        ..'',,,,,,c.    .. ...'',,,,,,,::::,...       ..'',,,,,''.        ...'';;,,''''''''. ........'',''''''...       ...'''',,;;,,;.........''''''''....              .lldkkdoc.     ');
 AddLine('     ..'',,,,,,,.        ..'',,,,,,;.        ..'',,,,,,c.        ..'',,,,,,'',...           ..'',,,,,''.        ...'';;,,,,;''        ...,,,''''''..     ...'',,,,,;::.       ...'',,''''''...            .lldkkdoc.     ');
 AddLine('     ..'',,,,,,,.        ..'',,,,,,;.        ..'',,,,,,c''        ..'',,,,,,''''              ..'',,,,,''.        ...'',,,,,.,.        ...'',,,''''''..    ...,,,,,,;;.         ..'',,,''''''''.            .lldkkdoc.     ');
 AddLine('     ..'',,,,,,,.        ..'',,,,,,;.        ..'',,,,,,c''        ..'',,,,,,''.              ..'',,,,,''.        ...'',,,,,...         ..'',,,,,,.     ..'',,,,,.''.          ...,,,,,,,''            .lldkkdoc.     ');
 AddLine('     ..'',,,,,,''.        ..'',,,,,,;.        ..'',,,,,,c''        ..'',,,,,,''.              ..'',,,,,''.        ...'',,,''''..          ..'',,,,,,..    ..'',,,,''...          ...,,,,,,;,            .lldkkdoc.     ');
 AddLine('     ..'',,,''''''.        ...'',,,,,,;.        ..'',,,,,,c''        ..'',,,,,,''.              ..'',,,,,''.        ...'',,,''''..         ...'',,,,,''''.    ...'',,''''''.           ..'',,,,,'';.            .lldkkdoc.     ');
 AddLine('      ..'',,''...        ...,;;,,,,;.        ..'',,,,,,c.        ..'',,,,,,''.              ..'',,,,,''.        ...'';;,''...         ...,,,,,,;;     ...'',,''''...         ...'',,,;,''..            .lldkkdoc.     ');
 AddLine('      ..'',,,''...      ....,;;,,,,;.        ..'',,,,,,c''        ..'',,,,,,''.              ..'',,,,,''.        ...'',;,''...       ...'''',,;;;,,.      ...''''''''....      ....'',,;;,;;.             .lldkkdoc.     ');
 AddLine('      ...'''',''''............'',,,,,,,.        ..'',,'''',,:.        ..'',,,,,,''.              ..'''','''',''.        ...'',,,''............'',,,;;,;;          ...''''''...........'',,,;,;:;               .lldkkdoc.     ');
 AddLine('       ...''''''''''''''''''''''. ...'',,''''''''''        ..'''',,''''''''.         ..'',,,,,,''.              ..'''',''''''.         ...'',,''''''. .......'''',,,;,'',''            ...''''''''......'''''',,,;,ll,.               .lldkkdoc.     ');
 AddLine('        ..'''',,,,,,''..   ..'',,''...         ...'',,....          ..'',,,,,,''.              ..'',,''...         ...'',,''..   ...'''',,,,;;c:;''               ..'''''''',,,,,,,;;;,,.''.                 .lldkkdoc.     ');
 AddLine('          ..........      ....               ...              ..'',,,,,,..                ...                ...         ..........                    ..............                     .lldkkdoc.     ');
 AddLine('                                                              ..'',,,''''.                                                                                                                  ''lodkkdoc.     ');
 AddLine('                                                              ...'',,''...                                       .''''..          .''''..           .''''..                               ......''codkOxdo:.     ');
 AddLine('                                                               ...''''''''''.......................................oOcckk''.........xXO0c..........dklco;............................  .clloooodxkkxdol''      ');
 AddLine('                                                               ..'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''':;'''''''''''''''''',x0ccOO,'''''''''''''''',kXk0o,'''''''''''''''',k0loXd.''''''''''''''''''''''''''''''''''''''''''''''.''''.  .clooooooooolc:''       ');
 AddLine('                                                                 ..'',,,;;;;;;;;;;;;;;;;;;;;;;;;;;;lc;;;;;;;;;;:oooo:;;;;;;;;;;lo:ld:;;;;;;;;;:ododc;;;;;;;;;;;;;;;;;;;;;;;,,''.    ''''''''''''''''''....         ');
 AddLine('                                                                    ...,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,;,,.                            ');
end;

procedure MakeLenna;
begin
 InitSlide;
 AddLine('xxxxxxxxdddddxxxxkkkxxdlc;;::::::::::::::ccccllllllllllllllllolloooooollolloooooooolllllllllloooolloolllllllllllllllllllcccc::cloddxxxdddddddxdddddddddxddxddk0KKXXKkl::cccclccllccllllllllclllllccccdkd');
 AddLine('xxxxxdddddddddxxkkkkxdol:;;;:::::::::::::ccccllllllllllllllllllloololollllloooolllollllllllllllollllolllllllllllllllllllcccc::cloddxxxdddddddddddddddddddddddxOKKXXX0dc::ccccccllcccllllllllllllllclllc:');
 AddLine('xxxxddxddddddxxxkkkkxdol:;;;;::::::::::::ccccllllllllllllllllllllllollllllllllllllllllllllllllllllllllllllllllllllllllllccccc::cloddxxxdddxxxxxxddddddddddddddxOKKXXX0dc::cccccccccccllllllllllllllc,...');
 AddLine('xxdddxxddddxxxxxxxxxxdol:;;;;::::::::::::ccccllllllllllllllllllllllolllllolllollllllllllllllllooollllllllllllllllllllllllccccc::cloddxxxxxxxxxxxxxxxddddddddddddk0KXXXKkl:::ccccclclcllllllllllll:''.....');
 AddLine('ddxxxxxxddxxxxxxxxxxxdolc;;;;::::::::::::ccccccllllllllllllllllllllllllllllllllllllllllllllllllloolllllllllllllllllllllllllccc:::cooddxxxxxxxxxxxxxxdddddddddddddx0KXXXKOo::cccccclllcllllllool;''.......');
 AddLine('ddxxxxxxxxxxxxxxxxxxxdol:;,;;:::::::::::::ccccllllllllllllllllllllllllllllloollllllllllllllllllllllllllllllllllllllllllllllccc::ccloddxxxxxxxxxxxxdxdxddddddddddddx0KXXXX0d::cccclllcclllllol;''.........');
 AddLine('xxxxxxxxxxxkkxxxxxxxxdol:;;;;:::::::::::::cccclllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllcccccc:cclooddxxxxxxxxxxxxxddxdddddddddddox0KXXXX0xc:cccccllllllll:''...........');
 AddLine('xxxxxxxxxxxxxxxxxxxxxdol:;,;;::::::::::::ccccccclllllllllllllllllllllllllllllllllllllllllccccllllllllllllllllllllllllllllcccccc:ccloodddddxxxxxxxxxxddxxddddddddddooxOKXXXXKkc::ccccllllc;''.............');
 AddLine('xxxxxxxkxxxxxxxxxxxxxdol:;,;;:::::::::::::ccccccllllllllllllllllllllllllllllllllllllllcllccccccllllllllllllllllllllllllllcccccc:ccloooddddddxdddddddddddddddddddddooodOKXXXXKxc:::ccclc:''...............');
 AddLine('xxxxxkkxxdddddxxxxxxxdol:;,;;::::::::::::cccccclllllllllllllllllllllllllllllllloooooddxxxxxxxxddollccllllllllllllllllllllcccccc:ccllooddddddddddddddddddddddddoooooooodOKXXXXKkl::ccc;..................');
 AddLine('xxxxkkxddoooddxxxxxxxdol:;,;;;:::::::::::ccccccclllllllllllllllllllllllllloodddodddxxxkkOOkkkkOOOOOkxdlccclllllllllllllcccccccc::clooododddddddddddddddddddddoooooooooook0KXXXX0dcc;....................');
 AddLine('xxxkxxdolllodxxxxxxxxdol:,,,;;;::::::::::ccccccllllllllllllllllloloooollloooooodddddxxxxkkkkkkkOOOOO00Okdlcclllllllllllcccccc::::cloooddddddddddddddddddddooooooooooooooox0KXXNXKo''.....................');
 AddLine('xkkxxdol::codxxxxxxxxdol:,,,;;;;;;::::::::ccccccccllllllllllloolooolllllloollooooddddxxxxkkkOOOOOOOOO00000kdlccccccccccccccc:::::clooddddoddddddddddoooooodoooooooooooooooxOKXNX0;......................');
 AddLine('kkkxdol;,;codxxxxxxxxdol:,'',,;;;:::::::::::ccccccclcllllllllldccccccllclllllllooooooddxxkkkkOkOOOOOOO00000000koc:ccccccccccc:::::clooddddddoooooodddoooooodoooooooooooododddOK0o''.......................');
 AddLine('kkxdoc;,,:codxxxxxxxxdol:,'',;;;::::::::::::ccccccccccclllllolcccccccclllllloooollooodddxxkkkOOOOO0O000000000000Odc:::::ccc:::::::cloddddddddoollloodddoooddooooooooodddddddddc''........................''');
 AddLine('xxdoc;,,,:lodxxxxxxxxdol:,'',;;;:;::::::::::ccccccccccccclloocc:::cccclllllllloooooooddddxxkOOOOOOOO000000O000KKKXXK0o;;::::::::::cloddddddddolc::clodddooddooooooooodddddddl,....................''''..'':d');
 AddLine('ddl:;,,,,:codxxxxxxxxdoc:,,,;;;;:::::::::::cccccccccccllllcc:ccccccclcccclllloooooooooddxxkOOOOOOOOOOO00KKKKKKKKKKXXXx:;;;:::::;::coodddddddooc;'',:looddooddooooodoodddddo:.....................'''''''':odd');
 AddLine('ol:,,;;,,:codxxxxxxxxdoc:,,,;;;;::::::::::::ccccccccllllcc::ccccccccccccllllooooooooodddxxkkkkOkkkO0KKKKKKKKKKKKKKKXXX0c,,;;;;;;;:cloddddddddoc;..'':clodddodooooooooddddl,....................'''',,:lddoo');
 AddLine('c;,,;;;,,:codxxxxxxxxdoc:,,,;;;:;::::::::::ccccccccclllc::cccccccccccccllllooooooddooodddxkkxxxk0KK0KKKKK0000KKKKKKKXXXKo;,,,,;;;:looddddddddol;...'':clodddooooooodddddc......................'';:loddood');
 AddLine(';,;;;;;;,:coddxxxxxxxdoc:,,,;;;::::::::::::cccccccccllcccccccccccccccllllloooooooooooooddxddkO0000KK00000000000KKKKKKKKXXKkl,'',,;:cooddddddddol;....'';clodddoooooddddo:......................'';lodddddxx');
 AddLine(',;;;;;;;;:coddxxxxxxxdoc:,,,;;;;;::::::::::ccccccccolc:::ccccccccccclllloooooooooooloooodxk0000000000000000KKKKKKKKKKKKKKXXXO:'''',:cloddddddddoc;''.....,:loodooooodddl,......................,cooooodxxxx');
 AddLine(';;;;;;;;;:coddxxxxxxxdol:,,,;;;;:::::::::::cccccccoxc::::ccccccccclllloooollooooollclldxOOOO0000OOOOO000KKKKK0KKKKKKKKKKKXXXX0c,'';cloddddddddol:''......'';cldddoodddl''......................;lddooddxxxxx');
 AddLine(';;;;;;;,,;coddxxxxxxxdol:,'',,;;;;;::::::::::ccc::o0d:::::cccccccclllloooollooolllcloxkOOOOOOOOOOOO00000000K0000K0000KKKKKKKXXXXo'',:loddddddddol:''.......:dO0KK00K0o......................,codooddxxxxxxx');
 AddLine(';;;;;;;;,;clddxxxxxxxdol:,'',,;;;;;;;;;::::::cc::cOOo::::::ccccccclllllllllollcccoxkkkkOkkkkkOOOOOO0000000000000KK0K00KKKKKKKKXXKl,:loddddddddoc;''....''lO000KKXXXNNK;....................;oddoodxxxxxxxxx');
 AddLine(';;;;;;;;;;clddxxxxxxxdoc:,'',,;;;::::::::::::ccc:xKkl;::::cc:cccllllccllllllcccoxkkkkxxkkkkOOkOO0OOOO0OOO00000000000000KKKKKKKKKXKo:codddxddddoc;...:x00OOKXXKKKKXXNd..................''coddodxxxxxxxxxxx');
 AddLine(';;;;:;;;;:clddxxxxxxxdoc:,,,,;;;:::::::::::ccc:c00xl;::::::cccllclccllollccloxxxxxxxxkkOOkkOOOOOOOOkkOOO00000000000000000000KKKKKKkdodddddddol;,;oO00O0KKKKK0KKKXXNd.................''ldddddxxxxxxxxxddx');
 AddLine(':::::::;;:clddxxxkxxxdol:,,,,;;::::::::::::ccc:oKOoc:;::::ccccccclllllcccloxxddddxxxkkkkkOOkkOOOkkkkOOOOO000000000OkkO00000000000KKKOddddddoodxO00O0KKKKKK000KKXXXXl................''ldddddxxxxxddxddddd');
 AddLine(':::::::;::coddxxkkkkxxol:,,,;;;:::::::::::::::;xKxol::::::::ccccllcccccloddddddodxxxkkkkxkkOOkxkkkkOOOkOOOOO0OO0OOOOOO00000000000000KOddddkO000O00KKKK000KKKKKKXXXK;...............;lddddxxxxxxxxxxddddd');
 AddLine('::::::::::codxxkkkkkkxdl:,,,;;;;:::::;:::::::;c00kdlc:::::::cccccclcclodddooooodxxxxxxkkkkkxxkkkkkkkkkkkkOOOOkkOOOOOOOO0OOOOOOOOOOOOO0OkO000000KKK00000KKK000KKXXXk..............,:oddddxxxxxxxxxxdddddd');
 AddLine(':;::;;;;::cldxxkkkkkkxol:,,,;;;;:::::;;::::::;oK0kdollcc:::c:ccccccloddoooooodddddddxkkxxxxkkkkkkkkkkkkkkkkOOOOOkOO0OOOOOkkkOOkkkxkOOOOO000KKK00000000KKK0OO0KKKX0;.............,cdddddxxxxxxxxxxxxxxdxx');
 AddLine(';;;;;;;;;:codxxkkkkkkxdl:,,,;;;;:::;:;;::::::;dKOkxdoolcc:::ccc::loooooollodddddodddxxxxxkkkkxxkkkkxxxkxkxkkkkkOOOOOOkkkOOkkxkkkOOOOO0000000000000000KKKOxxkkkO0Kl.............,cdddddxxxxxxxxxxxxxxxxxx');
 AddLine(';;;;;;;;;:codxxkkkkkxxdl:,,,;;;;:::;;:;:::::;;x0Okxddoolc:::::cloooooollooddooodddddodxxxxxkxxxxxxxxxxxxxxxkkkkkkkkkkkkxkkxxkkOOOO000000000000000000KKKOxxkxoxk0x............'';ldddddxxxxxxxxxxxxxxxxxdx');
 AddLine(';:;;;;;;;:lodxxkkkkkkxdl:,,,;;;;;;;;;;;::::;;;O0Okkddooolc:::lloooolllooddooolodddodxxdddxxxdddxxxxxxxxxxxxxxxxxxxxxxxxxxkkOOOO00000O000000000000KKKKKkxxxdddx0O''...........'';odddddxxxxxxdxxxxxdxxxdddx');
 AddLine(';;;;;;;:::lodxxkkkkkkxdl:,,,,;;;;;;;:;;;;::;;:0K0Okxxdddoc::lollolcllooooollloddoodddoolllooolooc:dxxxxdddxxxxdodxxdddxOOOOO0000OOOO00000000KKKKKKKKKkxdocccoOK:............,odddddxxxxxdddddxxddddxxddd');
 AddLine(':;;;:::::clodxkkkkkkkxdl:,'',,;;;;;:;:::;:;;;,;OK00Okxddddlccclllccloooolllllooooodollllcc:;,,cdxdllclccllc::::;,'',dxxkkkO00000000000000000KKKKKKKK0kdl:;;;lxKO:............;lddddxxxxxxxxddddddddddddddd');
 AddLine(':::::;:::clodxkkkkkkkxdl:,'',,;;;;;:;::;:::;;;,xK000Oxoloocccccccloooolllllllloooolcooccc:c:,,:cll:;'',,;,''''......;lxxkO00000000000000000000KKK0kdoc:;;;;:lxOOd,............,oddodxxxxxxxxxxxxdddddddddddd');
 AddLine(':::::;;::clodxkkkkkkkxdl:,,,,;;;;:::::;::;;;;,c0K000xolooolc::clooolllllollloollclol:c::;,''..'';::;,;:;,''.,....:oddkOOO00000OO0000000000000Oko:;;;;;:cldkO0l..............,lddddxxxxxxxxxxxxxxddddddddddd');
 AddLine(':::::::::clodxxkkkkkkxdo:,'',,;;;;;;;::;;:;::;;,xK000kdloool:clooolclllllllooool:lc:,,,,''''...''cc;''.'';,;''..,.''cdddkOOOOOOOOOOOOOOOO00000Okoc:llccclodxxkOOo,..............,lddodxxxxxxxxxxxxxxxddddddddddd');
 AddLine(':::::::::clodxxkkkkkkxdo:,'',,;;;;;:::;;;;;:::;,:0K00Okxddcccloolcclllllclllccll;;'''''',......'';,''.'';:;''.''.,cloodk00OOOOOOOOOOOOOOO000Ooc;''c:ccoxxxxxkkO0d,...............''cddddxxxxxxxxxxxxxxxxxdddddddddd');
 AddLine('::::::::::codxkkkkkkkxdo:,'',,;;;;;;;;;;;:;::::;;cOKKOxkkl:llllccllllclllllc:,,,,'',''...;''..'',''...,'';''.:''''loodk00OOOOOOOkkkkkOOO0OOOx;'',;;:lccldxkkkOkc,................'':ooooxxxxxxxxxxxxxxxxxxxxxxdddddd');
 AddLine('::::::::;:cldxxkkkkkkxdo:,'',,;;;;;;;;;;:::::::::;:kK0OOxlolllccllllcllllc:;;,,,,,....,:...''''..''''..;.;:cccdOOOOOOOkkkkkkkkOOOOOOO00ko:;;:::clloxkxl;..................'';llloxxxxxxxxxxxxxxxxxxxxxxxdddddd');
 AddLine(':::::::;;;cldxxkkkkkkxdoc,'',,;;;;;;;;;:;::::ccc::;:0K00kollc:cllcclllccl:''''''..,;''''..'''',,''.........,,;;loxkOkOOkkkkkkkkkkkOO00000000ko:,'',;,coodo:...................'';lllldxxxxxxxxxxxxxxxxxxxxxxxxddddd');
 AddLine('::::::;;;;cldxxkkkkkkxdoc,'',,;;;;::::::;::::ccc::;:OXKOl:ccccccclolll:'''''',.....,'',,.''..::''.......;::lodkkOOOOkxxxkkkxxkkO0000000000Oxc;''..,,lodo,...................;lollodxxxxxxxxxxxxxxxxxxxxxxxxxdddd');
 AddLine('::::::::;;cldxxkkkkkkxdoc;'',,;;;::::::::::::ccccc:;xXKo::cccclllc:::;;..,.......''''''.''''..c;.....:lloxxookkOOOkxxxkkxxxkOO0000000KKKK0Oo:,...'';dxl...................,lollddddddxxxxxxxxxxxxxxxxxxxxxxdddd');
 AddLine(':::::::;;;cldxxkkkkkkxdoc;,,,;;:::::::::::colccccc:cOKlcccccllll:;,''....,...........,;;.,:...,lloxkkkddkkOOkkkkxxdxxkOOO000000KKKKKK0xc;....''cxo''........''.........:ooodxxdddddddddddddxxxxxxxxxdddddddd');
 AddLine('::::::;;;;:loxxkkkkkkxdoc;,,;;;:::::::::::cccccccccclOdccclllll:,''.''''...,........''..,'',''.:.''clodkkOOOxoxO0OxxxxdxxkkkOO00000KKKKKKKKKOo:''...'':xo;.................:ooodxxxxxxddddddddddddddddddddddddddd');
 AddLine(':::::;;;;;:ldxxkkkkkkxdoc;,,;;;::::::::::::cccccccclccoclllllc;.''..,.....''''''....''.''..'',..''clldxxxxOOOkdkOkxxxxxxkkkkkkOO0000000KKKKKK0xc;....,ox:................;loooxxxxxxxxxxxxxxddddddddoooddddddddd');
 AddLine(':::::;;;;;:ldxxkkkkkkxdoc;,,,;;:::::::::::cccccccodo;,cllllcc;'',,..;''...''''''.......'',.''..,ccdkkkkxxOOOOkoccloodxxkkkkkkkOO0000000KKKKK0xc,....'':kl''.''...''........,lolodxxxxxxxxxxxxxxxxdddddddddooooooooo');
 AddLine(':::::::;;;:ldxxkkkkkkxdoc;,,,;;;:::::::::::ccccllxo,..''ldo;,,.,,..,:''...........''''''''...:llxkkOOxxkOOkdlllllc;;;:coxkkkkkOO0OO0000Okxoc:;''.....,xd;.''''.''........''cooldxxxxxxxxxxxxxxxxddddddddddddooooooo');
 AddLine(':::::::;;;:lddxkkkkkkxdoc;,,,;;::::::;::::::cloddoxl::;cc,''.'';;'''';.'';..''..'';.....''''...cldkkO00kxkOxlcccl::oc:::;;;coxxxkOO00OOOkoc:;;;:;;''....''dd:..''.''........;loloxxxxxxxxdddddxxxdddddddddxddddddoooo');
 AddLine(':::::;;;;,:lodxkkkkkkxdoc;,,,;;;::::::;;;:lddodddddocc''..'',''::'',;;..,..''...'';''......''llxkkO00OOOo;''''''.....''...'':lllloddxk0000Od:,''............''dd:''.''.........''looodxxxxdddddddddddddddddddddddddddooooo');
 AddLine(';;;;;;;,,,;lodxkkkkkkxdoc,'',,;;;;:;;;;;;,lO0dodddlo;''...,,'',..;;c,.....,.....,''''...,llkkkO000Od:''...''....''oxo,.'':llloodxk0KKk:...,:o:..........ox:,.''.........:ooodxxxxddddddddddddddddddddddddooooooool');
 AddLine('::;;;;;,,'';loxxkkkOOkkdoc;,,;;;:::::::;,'',ooxOkd:,,...,''.''''''.'':;l''.....'',.........;clxxkO000xlc:;,.'':;,'',:OKKk:::ccclodxOKXk:;,,,,cko,.......''.lx:,,''........;looodxxdxddddddddddddddddddddddooooolllood');
 AddLine('::::;;;,,'';codxkkkOOkkxoc;,;;:::::c:'''',:cldxkxl,''''.'',;''..,'',,,c:o;...............:cdkkO00Odlclloooc:ccccoxkOOxdollclllox0XKxlllllodoc''.......''.ckl,;''.......''cooodxdddddddddxdddddddddddoooooooooodxxkkO');
 AddLine('::::;;,,,'';codxkkOOOOkxoc;,;;:::c:cc;lodlc:c;....;c;::...,'';'',:clc;.............ccdkkO00dc:llooddddoollllolodxxdollllloxOXXOxdollcc,,;;,.....''.:kd,,.......''cooodxxdddddddddddddddddddoooooooodxkOOOOOOO');
 AddLine(':;;;;,,,''.,codxkkOOOOkxol;,,;;:::::loolc,,,,...'''',::;:...'','';c:;::;...........''lcdkOO0k:;:cloodddxxxxdddxxxxxxxdoooolllxOKX0Okxdollccc:;''....''.:kx;,.......,lolodxdddddddddddddddddddoooooooxkO0000OOOOO');
 AddLine(';;;,,,,''''.,codxkkkOOOkxoc;,,;;::clloloo:c:,...,;:::;;''....,;,:::c:;,''........''lcokO0Oc'',:cllooddxxxkkkkkkkkkkkxdooolllldkKXKOkxddoolllc:''......;xx;''.......cooodxdddddddddddddddddooooooooxOO00000OOOOO0');
 AddLine(',;,,,,''''''.,codxkkkOOkkxoc;,,;;:cllolc:,'',''..'',,;cc:;........,,;..''cl:''......''llokO0x''.'';cclloodddxxkkkkkkkkkkxxdddoolllokKXKOkxxdoolllc:''...''''.,xxc.......,loodxxddddddddddddddddooooolodkO0000000000000');
 AddLine(',,,,''''''''..''codxkkkkkkkxoc;,,;;:::cc;::;,;,,;;''.:l:''''.............''cco:.....''lcoO0Ol...,:clllloodddxxkkkkkkkkxxddoooolllox0XXOxxxddoollc;....''''.''xdo''......:oodxxxddddddddddddddooooooloxO000000000000KKK');
 AddLine(',,,,,''''''..''codxkkkkkkkxol;,,cc:clll:,,:c:;,.,,'';lc:''........'',...;ol;cl...''lcoO0O;..''.'';cclllooddddxxkkkkkkxxxdoooollllodOKX0xxdddooll:''....,...odo:.....;looxxxxddddddddddddoooooooloxO000000000KKKKK00');
 AddLine(',,,,''''''...'':odxkkkkkkkxoc;,,;ccllll,''c:;;,'',;:,:cl;;........,:,,::ld;.,...ccoO0d''...,'''';:cllloooddddxxxxxxxxxdoolllllllldk0XXkxddoollc;....''''...cxdl....''loodxxxdddddddddddddoooooolokO00000000KKKKKKKKK');
 AddLine(',,,,,''''...'':odxkkkkkkkxol;'',:cccclc,,,;:,,,'':'',;;o,,........,:;cc;,''....:llcxkl.....;'''';:cllllooodddddxxxxxxddolclooollloxOXXkdddooll:.....''''...;ddo,...:oooxxddddddddddddddddoooolokO0000000KKKKKKKKKKK');
 AddLine(',,,,,''''...''codxkkkkkkkxdl:;:::::cc;'',;c:,.'':;.'':,oc,c.......'',.,:''.....lkkkxxc''.....:,,;:clllloooodddddddxxxddoccll:clllldOK0xddooll:''.....''''....oxo;..''ldodxxdddddddddddddddooooloxO0000000KKKKKKKKKKKK');
 AddLine(',,,,,'''''''''';lodxkkkkkkkxdl:,,;;::c:,,,,:,..::,,.:;cd;c,..'';''...''c,.....;oxkOd''.......:;,::clllloooodddddddxxxxddollc::c:cloxOkxddoolc''.....''''''....cxoc..:odddxddddddddddddddooooooodk000000KKKKKKKKKKKKKK');
 AddLine(',,,,,'''''''',:ldxxkkkkkkkxdl;,,;;;:cc,.,,''.,;'''',,,:;::llc...ll''..'''',,:ldo:coOc.........c:,:ccllllloooodddddddxxxdddooooodddkO0Oxddoolc''......,,''....;xoc'',odddxdddddddddddddddoooooloxO00000KKKKKKKKKKKKKKK');
 AddLine(',''''''''''''.'';codxxxkkkkOkxdl:,,,;:cll,.,;:,,...'''',,;:,:cl;'';;,....codxko;;oo''..........::;:ccllllloooooooddddddddddddddx00kO00Oxddooc''......'',''''....''doc;coodddddddddddddddddddooooldkO000KKKKKKKKKKKKKKKKK');
 AddLine(''''''''''''''''''',:ldxxxkkkkOkxdl:'',,:lccc'''';c,..'''''''','''''';'',:lcc:..'';::oxkkc;:o;........''...;:;;:clllllooooooooooddddddodddxk00O000Odoooc''.......'',''''.....ooc:oodddddddddddddddddodoooolldO000KKKKKKKKKKKKKKKKKK');
 AddLine('...''''''''.'',:odxxkkkkOOkxdl;'',cc;:lc..,;''..''.'''':;;,,,,'';:l:'';cokOOOo:;lo''...''.....''...,;;,:ccllllloooooooocllloooooooooodxdoooclol''.......'''',,,.''...ldclododddddddddddddddddooooollxO00KKKKKKKKKKKKKKKKKKK');
 AddLine('....''''..,;codxkkkkkOOkxdl;;c:;:lo:.''...''''''..''lc;:;;,:c,,,:ood0KOc;:ol............''..,,;,;:clllllloooddol:::::ccccccccloolcclloo,.........'''',,..''..:doodddddddddddddddddddooooooloxO0KKKKKKKKKKKKKKKKKKKK');
 AddLine('.......'',;codxxkkkkOkkxdllc,,;llc;'',,...'','',,d:'',;::;'',;codllOkccod:.............''..'',,,,;ccccllllloooddolllllllodxxxxkkdoodol''..........,'',,.''''..;xddddddddddddddddddddddoooollok0KKKKKKKKKKKKKKKKKKKKK');
 AddLine('........,;:ldxxkkkOOOkxxl:'''':lc::''.c,...,'''',co::,;'';:cc:ldoldOodkl''..............''''.'''','''',:::cccllllooooooollllllloooooooddoc,...........,'',,''.''..;ddddddddddddddddddddddooooolloOKKXKKKKKKXKKKKKKKKKKKK');
 AddLine('.......'';;:lodxkkkkOOkxdl;'',lc;:,.'':...'',..,do;:lc;;;clc;lllkOko,....................''''''.'',;:::ccllloooooooooooooooooooddoo;''............;'',,'''',..,xxddddddddddddddddddddoooollcoOKXXXKKXXXXKKKKKKKKKKKK');
 AddLine('.......;::clodxkkkkkkkxdl;'''':c:;'',;''...,''..''l::cllcc;,cc:c;cxOc........................''..'''',;;::cllloooooooddddxxkxxxxddo;.''...........'';,,,''''''''.,xxxdddxddddddddddddddooooollco0KXXXKKKKKKKKKKKKKKKKKK');
 AddLine('.......,;:clodxkkkkkkkxdl;'''';:;''''.:,...,...,c;'''';clllccllo;:c:''.......''...................''...'',;:clllooododdxxxxkxxkkxddc..............'':,,,'','''''',xxxdddxdddddddddddddoooooollcd0XXXKKKKKKKKKKKKKKKK000');
 AddLine('.......'';:clodxkkkkkkkxdl;''''::''..'';''.''.''....ll,'',,:ccllcodc::,........''''..................''''....'',,;;:cclooodddxxkxxxxdoo;........''.....,:,,,,,,,'',xxxooooddddddddddddoooooollclkKXXXKKKKKKKKKKK00Okdc:,');
 AddLine('........,;;lodxkkkkkkkxoc;:ol:l..'',.........:ol;,'',c:;l:ldlcloc''.....'',''...................'','''',;;::ccllllooddddxxxxxxdxdc,.............'':,;,,,,'''';xxdlccclllllooooddoooooollccd0KXKKKKKKKKKK0Okdc,.....');
 AddLine('........'''',codxkkkkkkkxoddl;'';;...;''.''..''...;cll:''.,clc;:ll:,,odc''...'',...''.................'',;cclllllooooooddddddddxkkO000kdl:''........,:,,,,,,,'':xdlclcccccccccccllllllllllccxKKKKKKKKKKK00Oxc''....'',,');
 AddLine('c:;''''..''..'';coxxkkkkkkkxo;,:c;.....''''...;,''''.''ccc;:coc;;;:cc;cdc;c;...,...''.................'',:cclllllloooooooooooddxkOO00000000xo:''....,;,,,'',,''''cxoloooolllcccc::::::::::c:;:x0KKKKKKKKK0kd:''....'',,,,');
 AddLine('oolc:;,,''..,coxxkkkkkkxdlcco:......,:..'':;,;..'';;:c:;'',:c:collcc;'':c..''..''''.............''''...,:ccclllllloooooooodddxkkOOOO00000KKKK0x:...,,'''''',''''.ldoodoooooooolllccc::;;:clc,;x0KKKKKKK0ko;..'',,,,,;;,,');
 AddLine('loddolc:,..,coxkkkkkkkxdxOl;.......'',,;;,'''''',;,.'':,'''''',;:cloooc.:l'':l''...''''...........'''''',''..,:cclllllooooooooooddxxxkkOOOOO0000KKKKKKOc.''''..'',''..ododddddoooooooolllccc:cllc;lOKKKKKKK0k:..'';;,,;;:;;,;');
 AddLine(':lodddol:..,coxkkkkkkkxdkkc;......''''.....,....''.'':,.'''''';:;cooolc,ll;:c...''''......''''...'''''':;..'':cccclloooooooooodddxxxxkkkkOOOO0000KKKKXKk;...''''''.''doodddddooooooooolllllclllllk0KKKKKK0kl''.,;;;;;:c:;;;;');
 AddLine('.;coxxxdl''.''coxkkkkkkkxdxd;''......''.....,:.''..,''.'';,'''',,,;:cclodl,''c,d....''......''.....'';cc''.'';cclolloooooooooodddxxxxxkkkkOOO0000KKKKKXX0c......,dooddddoodooooooooollllloood0KXKKKKKkl,,,;;;;:cc:;;;::');
 AddLine('..,lxkkxo,..coxkkkkkkkxdooc''.....''......;:.''....'''','',,;::,;;clldc''.''ok;...''''.....''.....'':c:,..;clllloooooooooodddddxxxxxkkkOOOO000KKKKKXXXKl.....;dodddddoooooooooooollllldxkOKKXKKKKOo;,;;;;::c:;;;::::');
 AddLine('..''cdkkxo''..:oxkkkkkOkxdolc............''l;..''.....''.'',;::;,,cdodl''..dx''..''''''''..........;::c;.'';clllloooooooooodddddddxxxkkkkOOOO000KKKKKXXXKc....cdoddddddooooooooolllllokO00KKXXXKK0d:;;;;::cc:;;;:::::');
 AddLine('...:dxkxo,..:oxkkkkkOkxdoo,...........'':c,....''......'''',c;''''coodcc,:xll..''.''..........,:clc;.,:clllooooooooooooodddddxxxxkkkkOOO000KKKKKKXXXK:...lodddddodoooooolollllllkKKKKKKXXKKOdc;;;;::cc:;;;:::::;');
 AddLine('...:oxkxo;..:oxkkkkkkkxdol,..........,'''';''...''........''.,;:clooccldxo,''''.''..........'',:lllc,.;:cllloooooooooooooodddddxxxxkkkkOO0000KKKKKKXXXk..''ooddoodooooooooolllllld0KXKKKXXXKOdl::;;;:cc:;;;:::;;;,');
 AddLine('...;oxkkd;..;oxkkkkkkkxdol;............'',,...........,''...;olllc;.,;,;;,;,;;;''.....'',;clllc'''';clloooooooooooooooooddddxxxxxkkkOOO000KKKKKKXXXKl.;oodddoooooooooooolllllx0KKKKKXXKOdlcc:;;::::;;;:::;;;;;');
 AddLine('...''lxkkd:..;oxkkkkkkkkddl,.............''............,''.'',;:cc::l:.''......''.'',''...'',;:clll:.,:cllooooooooooooooooodddddxxxxxkkkOO0000KKKKKKKKX0,:oodddoooooooooooollllldOKK0KXXK0klccc:;;::;,,;:::;;;;;;');
 AddLine('....cdxxdc''.;oxkkkkkkkxddd;''.....''''................''''.'';.''::cl:'',cl::''............,;:clllc,'';clooooooooooooooooooooddddddxxxxkkkOO0000KKKKKKKKKdcollooooooooooooooooooooddxOKXXKOdcc::;;;;;,,;::;;;;;;;;');
 AddLine('....:dxxdc'''';ldkkkkkkkxdod;,...............''.......,...::''...,:..;:o:............'',:cclll;.,:lloooooooooooooooooooodddddddxxxkkkOOO0000KKKKKKKXKdl;;:::ccllooooooooodddooodOKXK0xlc:;;;;;,,,;::;;;;;;;,''');
 AddLine('....;dkkxo,'';ldxkkkkkkkxoc;,...........''...''........''.,;cl;''..'''',;'',............'';:ccccc;.,:loooooooooooooooooooooooddddddxxxxkkkOOO000KKKKKKXXXO:,,,,,,,,;;;:::cllodddoookKXX0ko:;,,,;;,,;::;;;;;::;,''.');
 AddLine('....;dkkkd:'';ldxkkkkkkkxl;:,...........''..''............'':col::;;,..............'';:cccc:''.'':loooooooooooooooooooooooooodddddxxxxxkkOOO000KKKKKKXXXo,;;;;;,,,''''.....,;lxOkxx0KX0kl;''.'',,,,;::;;;;;;::;,''..');
 AddLine(''',,'';okOOxc,;ldxkkkkOOkxc:c..............................''clol::c''...........'',;:cccc,..,:llooooooooooooooooooooooooooodddddxxxxkkkOO0000KKKKKXXX0:;:::::;;,,''.....''d00kxOKKKxc,..'',,'',;::;,,,,;::;,''''..');
 AddLine(';;;:coxOOxl;;ldxkkkkOOkdcc:''...............''..''.......''..'''',:ccc;...........'',;:cc:,..'';cllloooooooooooooooooooooooooooddddddxxxxxkkOO000KKKKKKKXKo,;:::::;;;,,''...''d00OOOOko,...'''''''',::;,,,,,;:c:;,,''.''');
 AddLine(',;:ccoxkkxo;;ldxkkkkOOkx:c;...............'',..,,...'',.'',.'''',cc,,,..........'',;;;,''..,;ccllllooooooooooooooooooooooooooooodddddxxxkkkkOO000KKKKKKKXO:,;:::::;;;,,,,,;d0KKOdc;''..'''''''',;::;,'''',,:c::;;,''''''''');
 AddLine('.,;;:ldkkxo:;cdxkkkOOOkxc;,..........''....'';..;:;...,..,;'''',:ll''...............'''';::clllllllooooooooooooooddddooooooooooooddddxxxxkkkOOO000KKKKKKXKd,;;;::::::;:::::lxxdc,,,'',,,'',;::;,,'''''';:cc::;,''.''''.');
 AddLine('..'',;cdkkkdc:coxkkOOOOkxc''...........''''...,,..;:c,..;:..'';,.;c:;''.........'',;;::ccllllllllllllooooooooooooodddodoodooooooodddddxxxxkkkOOOO000KKKKKK0c,,;;:::::ccccccc::;;;;;;,,,,;;;,,'''''',;cccc:;,''.....');
 AddLine('....'':x000Od:loxkkOOOOko;.............''''..:''..;;,l;..;,..'';,.,;,''.......,;::cccccllllllllllllloooooooooooooooddddddddoddddddddddxxxkkkkkOO0000KKKKKKx,,;;:::ccccccccc::::cc:;;;;;;,,'''''',;:cccc:,''.......');
 AddLine('.....;x0000xcloxkkkkOOkl:''.........''''''.''.,:''..:,'';c,.'':...,,..'';;:''...'',;::ccccccllllllllllllloooooooooooooodddoddddddddddddddddxxxxxkkkOOO000KKKKKK0c,,;;;:ccccllccccllllc:;;;;,,,,,,,:clll:;,......'',;');
 AddLine('.....,x000OxcloxkkOOOOkc,........'''''''',..,c;...:,.,'':,''c....,''..,.,;,.,,;;::ccccclllllllllllllllooooooooooooodooodddddddddddddxxdxxxxxkkkOOO0000KKKKKKd:;;;;:::clollllloolc:;;,,'',;;;,,;:lllc:,......'';::');
end;

procedure MakeSlides;
begin
 Slides.NumberOfSlides:=0;
 MakeUltiboOrg;
 MakeLenna;
end;

initialization
 MakeSlides;
end.
