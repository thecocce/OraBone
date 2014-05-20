unit OutputTreeViewTabSheet;

interface

uses
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, VirtualTrees;

type
  TOutputTreeViewFrame = class(TFrame)
    Panel: TPanel;
    VirtualDrawTree: TVirtualDrawTree;
    procedure VirtualDrawTreeInitNode(Sender: TBaseVirtualTree; ParentNode, Node: PVirtualNode;
      var InitialStates: TVirtualNodeInitStates);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  BCCommon.OptionsContainer, Lib;

procedure TOutputTreeViewFrame.VirtualDrawTreeInitNode(Sender: TBaseVirtualTree; ParentNode, Node: PVirtualNode;
  var InitialStates: TVirtualNodeInitStates);
var
  Data: POutputRec;
begin
  with Sender do
  if OptionsContainer.OutputShowCheckBox then
  begin
    if GetNodeLevel(Node) = 0 then
    begin
      Data := Sender.GetNodeData(Node);
      if Data.Level <> 2 then
      begin
        CheckType[Node] := ctCheckBox;
        CheckState[Node] := csCheckedNormal;
      end;
    end
  end
  else
    CheckType[Node] := ctNone;
end;

end.
