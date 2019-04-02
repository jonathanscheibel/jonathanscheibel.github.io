unit frmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Tabs, ToolWin, Menus, ImgList, XPMan, StdCtrls,
  Buttons;

type
  TFFrmPrincipal = class(TForm)
    StatusBar1: TStatusBar;
    il1: TImageList;
    XPManifest1: TXPManifest;
    tlb1: TToolBar;
    btn1: TToolButton;
    btn2: TToolButton;
    btn3: TToolButton;
    btn4: TToolButton;
    ToolButton1: TToolButton;
    btn5: TButton;
    procedure btn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FFrmPrincipal: TFFrmPrincipal;

implementation

{$R *.dfm}

uses uInternet;

procedure TFFrmPrincipal.btn5Click(Sender: TObject);
begin
  downloadArquivo(
    'https://jonathanscheibel.github.io/clientes/20180421/chave/liberacao.html',
    'aqui.html')

end;

end.
