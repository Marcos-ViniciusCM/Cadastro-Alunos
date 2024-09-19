unit CRUD;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.ExtCtrls,
  Data.DB, Data.DBXMySQL, Data.FMTBcd, Datasnap.Provider, Datasnap.DBClient,
  Data.SqlExpr, Vcl.Grids, Vcl.DBGrids;

type
  TfrmCRUD = class(TForm)
    lbMatricula: TLabel;
    lbNome: TLabel;
    lbCurso: TLabel;
    edtMatricula: TEdit;
    edtNome: TEdit;
    edtCurso: TEdit;
    btEditar: TButton;
    btAdicionar: TButton;
    btCancelar: TButton;
    btSalvar: TButton;
    btExcluir: TButton;
    btAnterior: TButton;
    btProximo: TButton;
    DBGrid1: TDBGrid;
    Conect: TSQLConnection;
    qrAluno: TSQLQuery;
    dsAluno: TDataSource;
    cdsAluno: TClientDataSet;
    dspAluno: TDataSetProvider;
    cdsAlunomatricula: TStringField;
    cdsAlunonome: TStringField;
    cdsAlunocurso: TStringField;
    qrCrud: TSQLQuery;
    procedure btAdicionarClick(Sender: TObject);
    procedure btEditarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btProximoClick(Sender: TObject);
    procedure btAnteriorClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

  public
  operacao : String;
  procedure limpaCampos;
  procedure preencheCampos;
  procedure persisteCampos;
  procedure habilitaCampos(status : boolean);
  procedure excluirRegistro;

  end;

var
  frmCRUD: TfrmCRUD;

implementation

{$R *.dfm}

{ TfrmCRUD }

procedure TfrmCRUD.btAdicionarClick(Sender: TObject);
begin
   operacao :='Adicionar';
   habilitaCampos(true);
   limpaCampos;
   edtMatricula.SetFocus;
end;

procedure TfrmCRUD.btAnteriorClick(Sender: TObject);
begin
    cdsAluno.Prior;
    preencheCampos;
end;

procedure TfrmCRUD.btCancelarClick(Sender: TObject);
begin
    habilitaCampos(false);
end;

procedure TfrmCRUD.btEditarClick(Sender: TObject);
begin
    operacao := 'Editar';
    habilitaCampos(true);
    edtNome.SetFocus;
end;

procedure TfrmCRUD.btExcluirClick(Sender: TObject);
begin
    operacao := 'Excluir';
    if Application.MessageBox('Deseja mesmo excluir o registro ?','Atencao',MB_YESNO) = IDYES  then
      begin
            excluirRegistro;
            preencheCampos;
            habilitaCampos(false);
      end;

end;

procedure TfrmCRUD.btProximoClick(Sender: TObject);
begin
    cdsAluno.Next;
    preencheCampos;
end;

procedure TfrmCRUD.btSalvarClick(Sender: TObject);
begin
    persisteCampos;
    qrAluno.Locate('matricula',edtMatricula.Text, []);
    operacao := '';
    habilitaCampos(false);

end;

procedure TfrmCRUD.excluirRegistro;
begin
  with qrCrud do
  begin



    close;
    sql.Clear;
    sql.Add('DELETE FROM aluno where matricula = :matricula');
    ParamByName('matricula').AsString := edtMatricula.Text;
    ExecSQL();
    qrAluno.Close;
    qrAluno.Open;
     cdsAluno.Refresh
  end;
end;

procedure TfrmCRUD.FormCreate(Sender: TObject);
begin
qrAluno.Open;
cdsAluno.Open;
preencheCampos;
habilitaCampos(false);
end;

procedure TfrmCRUD.habilitaCampos(status: boolean);
begin
       if operacao = 'Editar' then
       begin
         edtMatricula.Enabled := not status;
       end
       else
        begin
         edtMatricula.Enabled := status;
        end;

       edtNome.Enabled := status;
       edtCurso.Enabled := status;
       btSalvar.Visible := status;
       btCancelar.Visible := status;
       btAnterior.Visible := not status;
       btProximo.Visible := not status;
       btAdicionar.Visible := not status;
       btEditar.Visible := not status;
       btExcluir.Visible := not status;

end;

procedure TfrmCRUD.limpaCampos;
begin
         edtMatricula.Clear;
         edtNome.Clear;
         edtCurso.Clear;
end;

procedure TfrmCRUD.persisteCampos;
begin
    with qrCrud do
    begin
     Close;
     SQL.clear;
       if operacao = 'Adicionar' then
       begin
          sql.Add('INSERT INTO aluno(matricula, nome , curso) VALUES (:matricula, :nome, :curso )');
       end
       else if operacao = 'Editar' then
       begin
         sql.Add('UPDATE aluno SET nome =:nome , curso =:curso  WHERE matricula = :matricula');
       end;

     ParamByName('matricula').AsString := edtMatricula.Text;
     ParamByName('nome').AsString := edtNome.Text;
     ParamByName('curso').AsString := edtCurso.Text;

     try
      ExecSQL();
      qrAluno.Refresh;
      cdsAluno.Refresh;
     except
      on E:EXCEPTION do
      begin
        ShowMessage('erro na operacao');
        Exit;
      end;


     end;



    end;


end;

procedure TfrmCRUD.preencheCampos;
begin
        edtMatricula.Text := cdsAlunomatricula.AsString;
        edtNome.Text := cdsAlunonome.AsString;
        edtCurso.Text := cdsAlunocurso.AsString;
end;

end.
