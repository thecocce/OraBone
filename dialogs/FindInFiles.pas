unit FindInFiles;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, JvExMask, JvToolEdit, BCComboBox, JvExStdCtrls, JvCombobox;

type
  TFindInFilesDialog = class(TForm)
    CancelButton: TButton;
    CaseSensitiveCheckBox: TCheckBox;
    FileTypeComboBox: TBCComboBox;
    FileTypeLabel: TLabel;
    FindButton: TButton;
    FindWhatComboBox: TBCComboBox;
    FindWhatLabel: TLabel;
    FolderDirectoryEdit: TJvDirectoryEdit;
    FolderLabel: TLabel;
    LookInSubfoldersCheckBox: TCheckBox;
    procedure FindWhatComboBoxKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    function GetFileTypeText: string;
    function GetFindWhatText: string;
    function GetFolderText: string;
    function GetLookInSubfolders: Boolean;
    function GetSearchCaseSensitive: Boolean;
    procedure SetExtensions(Value: string);
    procedure SetFolderText(Value: string);
  public
    { Public declarations }
    property Extensions: string write SetExtensions;
    property FileTypeText: string read GetFileTypeText;
    property FindWhatText: string read GetFindWhatText;
    property FolderText: string read GetFolderText write SetFolderText;
    property LookInSubfolders: Boolean read GetLookInSubfolders;
    property SearchCaseSensitive: Boolean read GetSearchCaseSensitive;
  end;

function FindInFilesDialog: TFindInFilesDialog;

implementation

{$R *.dfm}

uses
  Common;

var
  FFindInFilesDialog: TFindInFilesDialog;

function FindInFilesDialog: TFindInFilesDialog;
begin
  if FFindInFilesDialog = nil then
    Application.CreateForm(TFindInFilesDialog, FFindInFilesDialog);
  Result := FFindInFilesDialog;
end;

procedure TFindInFilesDialog.FormDestroy(Sender: TObject);
begin
  FFindInFilesDialog := nil;
end;

function TFindInFilesDialog.GetFindWhatText: string;
begin
  Result := FindWhatComboBox.Text;
end;

function TFindInFilesDialog.GetFileTypeText: string;
begin
  Result := FileTypeComboBox.Text;
end;

function TFindInFilesDialog.GetFolderText: string;
begin
  Result := AddSlash(FolderDirectoryEdit.Text);
end;

procedure TFindInFilesDialog.SetFolderText(Value: string);
begin
  FolderDirectoryEdit.Text := Value;
end;

function TFindInFilesDialog.GetSearchCaseSensitive: Boolean;
begin
  Result := CaseSensitiveCheckBox.Checked;
end;

function TFindInFilesDialog.GetLookInSubfolders: Boolean;
begin
  Result := LookInSubfoldersCheckBox.Checked;
end;

procedure TFindInFilesDialog.FindWhatComboBoxKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FindButton.Enabled := Trim(FindWhatComboBox.Text) <> '';
end;

procedure TFindInFilesDialog.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ModalResult = mrOK then
    InsertTextToCombo(FindWhatComboBox);
end;

procedure TFindInFilesDialog.SetExtensions(Value: string);
var
  Temp: string;
begin
  Temp := Value;
  with FileTypeComboBox.Items do
  begin
    Clear;
    while Pos('|', Temp) <> 0 do
    begin
      Add(Copy(Temp, 1, Pos('|', Temp) - 1));
      Temp := Copy(Temp, Pos('|', Temp) + 1, Length(Temp));
    end;
  end;
end;

end.
