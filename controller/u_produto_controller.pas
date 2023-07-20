unit u_produto_controller;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, u_produto_dao, u_produto;
type

  { TProdutoController }

  TProdutoController = class(TObject)
    public
      function Creating(Value : TProduto) : Integer;
      function Read(Value : Integer): TProduto;
  end;

implementation

{ TProdutoController }

function TProdutoController.Creating(Value: TProduto): Integer;
var DAO : TProdutoDAO;
begin
  DAO := TProdutoDAO.Create();
  try
     Result := DAO.Creating(Value);
  finally
    FreeAndNil(DAO);
  end;
end;

function TProdutoController.Read(Value: Integer): TProduto;
var DAO : TProdutoDAO;
begin
  DAO := TProdutoDAO.Create();
  try
     Result := DAO.Read(Value);
  finally
    FreeAndNil(DAO);
  end;
end;

end.

