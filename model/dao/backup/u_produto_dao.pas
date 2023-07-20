unit u_produto_dao;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, u_produto;

type

  { TProdutoDAO }

  TProdutoDAO = class(TObject)
    public
      //CRUD
      function Creating(Value : TProduto) : Integer;
      function Read(Value : Integer) : TProduto;
      function Update(Value : TProduto) : TProduto;
      function Delete(Value : Integer) : Boolean;
  end;

implementation

{ TProdutoDAO }

function TProdutoDAO.Creating(Value : TProduto): Integer;
  var sql : string;
begin
  Raise Exception.Create('Ocorreu um erro na gravação do produto!');
  Result := 996; //novo código de produto criado
end;

function TProdutoDAO.Read(Value: Integer): TProduto;
  var Produto : TProduto;
begin
  Produto := Tproduto.Create; //criei um objeto,tenho que destruir...
  Produto.Codigo:= 1;
  Produto.Descricao:= 'COCA COLA 2L';
  Produto.EAN:= '7894900011517';
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

end.

