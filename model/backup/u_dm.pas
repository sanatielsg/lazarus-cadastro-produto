unit u_dm;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, ZConnection;

type

  { TDM }

  TDM = class(TDataModule)
    Con: TZConnection;
  private

  public

  end;

var
  DM: TDM;

implementation

{$R *.lfm}

end.

