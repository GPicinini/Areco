unit uTProduto;

interface

uses
  uMain, SysUtils, FireDac.Comp.Client;

type
  TProduto = class
  private
    { private declarations }
    Fidproduto  : LongInt;
    Fcodigo     : ShortString;
    Fdescricao  : ShortString;
    Fpreco      : Double;
    Fsaldo      : Double;

    function Prox_ID():Longint;

    procedure Setcodigo(const Value: ShortString);
    procedure Setdescricao(const Value: ShortString);
    procedure Setidproduto(const Value: LongInt);
    procedure Setpreco(const Value: Double);
    procedure Setsaldo(const Value: Double);
  protected
    { protected declarations }
  public
    { public declarations }
    property idproduto : LongInt read Fidproduto write Setidproduto;
    property codigo : ShortString read Fcodigo write Setcodigo;
    property descricao : ShortString read Fdescricao write Setdescricao;
    property preco : Double read Fpreco write Setpreco;
    property saldo : Double read Fsaldo write Setsaldo;
    constructor Create;
  published
    { published declarations }

  end;
implementation

{ TProduto }

constructor TProduto.Create;
begin
  Fidproduto := 0;
  Fcodigo := '';
  Fdescricao := '';
  Fpreco := 0;
  Fsaldo := 0;
end;


function TProduto.Prox_id : longint;
var
  fdq_tmp : TFDQuery;
begin
  fdq_tmp := TFDQuery.Create(nil);
  fdq_tmp.Connection := fmMain.FDConnection1;
  fdq_tmp.SQL.Add('select (isnull(max(idproduto),0)+1) as newid from produto');
  try
     fdq_tmp.Open;
     result := fdq_tmp.FieldByName('newid').Value;
  except
     result := -1;
  end;
  fdq_tmp.Close;
  Freeandnil(fdq_tmp);
end;

procedure TProduto.Setcodigo(const Value: ShortString);
begin
  Fcodigo := Value;
end;

procedure TProduto.Setdescricao(const Value: ShortString);
begin
  Fdescricao := Value;
end;

procedure TProduto.Setidproduto(const Value: LongInt);
begin
  Fidproduto := Value;
end;

procedure TProduto.Setpreco(const Value: Double);
begin
  Fpreco := Value;
end;

procedure TProduto.Setsaldo(const Value: Double);
begin
  Fsaldo := Value;
end;

end.
