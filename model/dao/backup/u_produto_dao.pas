unit u_produto_dao;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, u_produto, u_dm;

type

  { TProdutoDAO }

  TProdutoDAO = class(TObject)
    public
      //CRUD
      function Creating(Value : TProduto) : Integer;
      function Read(Value : Integer) : TProduto;
      function Update(Value : TProduto) : TProduto;
      function Delete(Value : Integer) : Boolean;

      function GetNextId() : Integer;
  end;

implementation

{ TProdutoDAO }

function TProdutoDAO.Creating(Value : TProduto): Integer;
  var sql : string;
      nextId : Integer;
begin
  nextId := GetNextId();
  with (DM) do
  begin
    Qry.Close;
    Qry.SQL.Clear;
    sql := 'insert into produto (codigo, descricao, ean)'
         + 'values (:codigo, :descricao, :ean)';
    Qry.SQL.Add(sql);
    Qry.ParamByName('codigo').AsInteger:= nextId;
    Qry.ParamByName('descricao').AsString:= Value.Descricao;
    Qry.ParamByName('ean').AsString:= Value.EAN;
    Qry.ExecSQL;
  end;
  Result := nextId;
end;

function TProdutoDAO.Read(Value: Integer): TProduto;
  var Produto : TProduto;
      sql : string;
begin
  Produto := Tproduto.Create;
  with (DM) do
  begin
    Qry.Close;
    Qry.SQL.Clear;
    sql := 'select * from produto where codigo = :codigo';
    Qry.SQL.Add(sql);
    Qry.ParamByName('codigo').AsInteger:= Value;
    Qry.Open;
    if (Qry.RecordCount > 0) then
    begin
      Produto.Codigo    := Qry.FieldByName('codigo').AsInteger;
      Produto.Descricao := Qry.FieldByName('descricao').AsString;
      Produto.EAN       := Qry.FieldByName('ean').AsString;
    end;
  end;
  Result := Produto;
end;

function TProdutoDAO.Update(Value: TProduto): TProduto;
  var sql : string;
begin
  sql := 'update produto set ....';
  //passar para o banco de dados
  //Qry1.execSQL(sql);
  Result := Read(Value.Codigo);
end;

function TProdutoDAO.Delete(Value: Integer): Boolean;
  var sql : string;
begin
  //fazer os comandos e confirmar
  //if rows affected
  Result := True;
end;

function TProdutoDAO.GetNextId: Integer;
begin
  Result := 10;
end;

end.

