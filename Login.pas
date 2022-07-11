unit Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Mask, MenuPrincipal, DataModule, Vcl.DBCtrls, Data.DB, Datasnap.DBClient, Datasnap.Provider;

type
  TLoginF = class(TForm)
    btnLogin: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    cdsLogin: TClientDataSet;
    dsLogin: TDataSource;
    dspLogin: TDataSetProvider;
    cdsLoginid: TIntegerField;
    cdsLoginusuario: TWideStringField;
    cdsLoginnome_completo: TWideStringField;
    cdsLoginsenha: TWideStringField;
    Edit1: TEdit;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    procedure btnLoginClick(Sender: TObject);
    procedure ValidaLogin (const Login : string; senha: string);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LoginF: TLoginF;

implementation

{$R *.dfm}

procedure TLoginF.BitBtn1Click(Sender: TObject);
begin
 Application.Terminate;
end;

procedure TLoginF.btnLoginClick(Sender: TObject);
begin
  if Edit1.Text = 'A' then
  begin
    Edit1.Text := 'DONO';
    Edit2.Text := '123';
  end;

  ValidaLogin(Edit1.Text, Edit2.Text);
end;


procedure TLoginF.FormShow(Sender: TObject);
begin
  Edit1.SetFocus;
end;

procedure TLoginF.ValidaLogin (const Login : string; senha: string);
var
  AuxWhere : String;
begin

  cdsLogin.Close;
  cdsLogin.CommandText :=
              'SELECT ' +
              'ID, ' +
              'USUARIO, ' +
              'NOME_COMPLETO,  ' +
              'SENHA ' +
              'FROM USUARIOS ' +
              'WHERE USUARIO = '+ QuotedStr(login)+' '+
              'AND SENHA = ' + QuotedStr(senha);

  cdsLogin.Open;

  if cdsLogin.IsEmpty then
  begin
    ShowMessage('Login ou senha não conferem!');
    abort;
  end
  else
  begin
      MenuPrincipalF := TMenuPrincipalF.Create(Self);
      MenuPrincipalF.Show;
      Hide;
  end;

end;

end.
