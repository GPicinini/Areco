unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Phys.ODBCBase, FireDAC.Comp.UI, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Buttons;

type
  TfmMain = class(TForm)
    pnl_MainTop: TPanel;
    pnlMain: TPanel;
    FDConnection1: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink;
    dbgProdutos: TDBGrid;
    pnlFiltroPesquisa: TPanel;
    fdqProdutos: TFDQuery;
    fdqProdutosidproduto: TLargeintField;
    fdqProdutoscodigo: TStringField;
    fdqProdutosdescricao: TStringField;
    fdqProdutospreco: TFloatField;
    fdqProdutossaldo: TFloatField;
    dsProdutos: TDataSource;
    Label1: TLabel;
    dbnProdutos: TDBNavigator;
    cbProdutos: TComboBox;
    edPesquisa: TEdit;
    btnPesquisar: TBitBtn;
    btnLimparCriterios: TBitBtn;
    btnFechar: TBitBtn;
    btnIncluir: TBitBtn;
    btnAlterar: TBitBtn;
    btnExcluir: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnLimparCriteriosClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sSQLProdutosOriginal : string;
  end;

var
  fmMain: TfmMain;

implementation

{$R *.dfm}

procedure TfmMain.btnFecharClick(Sender: TObject);
begin
  self.Close;
end;

procedure TfmMain.btnLimparCriteriosClick(Sender: TObject);
begin
    try
      fdqProdutos.Close;
      fdqProdutos.SQL.Clear;
      fdqProdutos.SQL.Add(sSQLProdutosOriginal);
      fdqProdutos.Open;
    except
      showmessage('Não foi possivel limpar filtros...');
    end;
end;

procedure TfmMain.btnPesquisarClick(Sender: TObject);
var
  aux : string;
begin
  if cbProdutos.Text <> '<selecione o campo>' then
  begin
    aux := sSQLProdutosOriginal;
    aux := aux + ' Where ' + cbProdutos.Text + ' like ' + quotedstr('%'+trim(edPesquisa.Text)+'%');
    try
      fdqProdutos.Close;
      fdqProdutos.SQL.Clear;
      fdqProdutos.SQL.Add(aux);
      fdqProdutos.Open;
    except
      showmessage('Não foi possível aplicar o filtro de pesquisa');
      fdqProdutos.Close;
      fdqProdutos.SQL.Clear;
      fdqProdutos.SQL.Add(sSQLProdutosOriginal);
      fdqProdutos.Open;
    end;
  end
  else Showmessage('Favor selecionar um campo para pesquisa...');
end;

procedure TfmMain.FormActivate(Sender: TObject);
var i:integer;
begin
  sSQLProdutosOriginal := fdqProdutos.SQL.Text;
  cbProdutos.Clear;
  for i := 0 to (fdqProdutos.FieldCount -1) do
  begin
     cbProdutos.Items.Add(fdqProdutos.FieldList.Fields[i].FieldName);
  end;
end;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

end.
