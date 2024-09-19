program Project1;

uses
  Vcl.Forms,
  CRUD in 'CRUD.pas' {frmCRUD};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCRUD, frmCRUD);
  Application.Run;
end.
