unit Synonym;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.StdCtrls, DB, MemDS, DBAccess, Ora, ActnList, BCEdit, JvExStdCtrls, JvEdit, JvCombobox,
  BCComboBox;

type
  TSynonymDialog = class(TForm)
    OKButton: TButton;
    CancelButton: TButton;
    PrivateRadioButton: TRadioButton;
    PublicRadioButton: TRadioButton;
    OwnerComboBox: TBCComboBox;
    NameEdit: TBCEdit;
    OwnerLabel: TLabel;
    NameLabel: TLabel;
    ActionList: TActionList;
    OKAction: TAction;
    procedure FormDestroy(Sender: TObject);
    procedure OKActionExecute(Sender: TObject);
  private
    { Private declarations }
    FSchemaParam: string;
    FObjectName: string;
  public
    { Public declarations }
     function Open(SchemaParam: string; ObjectName: string; SchemaItems: TStrings): Boolean;
     function GetSQL: string;
  end;

function SynonymDialog: TSynonymDialog;

implementation

{$R *.dfm}

uses
  Common;

const
  CAPTION_TEXT = 'Create Synonym For %s.%s';

var
  FSynonymDialog: TSynonymDialog;

function SynonymDialog: TSynonymDialog;
begin
  if FSynonymDialog = nil then
    Application.CreateForm(TSynonymDialog, FSynonymDialog);
  Result := FSynonymDialog;
end;

procedure TSynonymDialog.FormDestroy(Sender: TObject);
begin
  FSynonymDialog := nil;
end;

procedure TSynonymDialog.OKActionExecute(Sender: TObject);
begin
  if Trim(NameEdit.Text) = '' then
  begin
    Common.ShowErrorMessage('Enter name.');
    Exit;
  end;

  ModalResult := mrOk;
end;

function TSynonymDialog.Open(SchemaParam: string; ObjectName: string; SchemaItems: TStrings): Boolean;
begin
  FSchemaParam := SchemaParam;
  FObjectName := ObjectName;
  Caption := Format(CAPTION_TEXT, [SchemaParam, ObjectName]);
  OwnerComboBox.Clear;
  OwnerComboBox.Items.AddStrings(SchemaItems);
  OwnerComboBox.ItemIndex := OwnerComboBox.Items.IndexOf(SchemaParam);
  NameEdit.Text := ObjectName;
  Result := ShowModal = mrOk;
end;

function TSynonymDialog.GetSQL: string;
var
  Visibility, Name1, Name2: string;
begin
  Visibility := '';
  if PublicRadioButton.Checked then
    Visibility := 'PUBLIC';

  if PrivateRadioButton.Checked then
    Name1 := OwnerComboBox.Text + '.';
  Name1 := NameEdit.Text;
  Name2 := Format('%s.%s', [FSchemaParam, FObjectName]);

  { CREATE [ OR REPLACE ] [ PUBLIC ] SYNONYM [ schema. ]synonym FOR [ schema. ]object [ @ dblink ] ; }
  Result := Format('CREATE OR REPLACE %s SYNONYM %s FOR %s', [Visibility, Name1, Name2]);
end;

end.
