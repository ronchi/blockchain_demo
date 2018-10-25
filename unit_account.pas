unit unit_account;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, EditBtn, Spin, INIFiles;

type

  { TForm_Account }

  TForm_Account = class(TForm)
    ButtonSave: TButton;
    ButtonCancel: TButton;
    ButtonSave1: TButton;
    ComboBoxCardType: TComboBox;
    ComboBoxState: TComboBox;
    DateEditExpirationDate: TDateEdit;
    EditPublicKey: TEdit;
    EditPeerToPeerNumber: TEdit;
    EditPrivateKey: TEdit;
    EditSecurityCode: TEdit;
    EditYourAlias: TEdit;
    EditCreditCardNumber: TEdit;
    EditZipCode: TEdit;
    EditCity: TEdit;
    EditStreetAddress: TEdit;
    EditYourFullName: TEdit;
    FloatSpinEditAmount: TFloatSpinEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Panel24: TPanel;
    Panel25: TPanel;
    Panel26: TPanel;
    Panel27: TPanel;
    Panel28: TPanel;
    Panel29: TPanel;
    PanelPublicKey: TPanel;
    PanelPrivateKey: TPanel;
    PanelSaveCancelButtons: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel2: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    Panel22: TPanel;
    Panel23: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    PanelPeerToPeerAddress: TPanel;
    PanelSecurityCode: TPanel;
    PanelAmount: TPanel;
    PanelYourAlias: TPanel;
    PanelExpirationDate: TPanel;
    PanelCardType: TPanel;
    PanelCreditCardNumber: TPanel;
    PanelZipCode: TPanel;
    PanelState: TPanel;
    PanelCity: TPanel;
    PanelStreetAddress: TPanel;
    PanelYourFullName: TPanel;
    procedure ButtonCancelClick(Sender: TObject);
    procedure ButtonSaveClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PanelPublicKeyExit(Sender: TObject);
  private

  public

  end;

const
  ACCOUNT_DATA = 'Account-Settings';

var
  INI: TINIFile;
  Form_Account: TForm_Account;
  Peer_to_Peer_Address: String;
  Full_Name: String;
  Alias_Name: String;
  Street_Address: String;
  City: String;
  State: String;
  Zip_Code: String;
  Credit_Card_Number: String;
  Card_Type: String;
  Expiration_Date: String;
  Security_Code: String;
  Amount: Integer;
  Public_Key: String;
  Private_Key: String;

implementation

{$R *.lfm}

{ TForm_Account }

procedure TForm_Account.ButtonSaveClick(Sender: TObject);
begin
  // Save the data to the ini file...
  INI := TINIFile.Create('GUI.ini');
  try
    INI.WriteString(ACCOUNT_DATA, 'Peer-to-Peer_URL', EditPeerToPeerNumber.Text);
    INI.WriteString(ACCOUNT_DATA, 'Alias', EditYourAlias.Text);
    INI.WriteString(ACCOUNT_DATA, 'Full_Name', EditYourFullName.Text);
    INI.WriteString(ACCOUNT_DATA, 'Street_Address', EditStreetAddress.Text);
    INI.WriteString(ACCOUNT_DATA, 'City', EditCity.Text);
    INI.WriteInteger(ACCOUNT_DATA, 'State', ComboBoxState.ItemIndex);
    INI.WriteString(ACCOUNT_DATA, 'Zip_Code', EditZipCode.Text);
    INI.WriteString(ACCOUNT_DATA, 'Credit_Card_Number', EditCreditCardNumber.Text);
    INI.WriteInteger(ACCOUNT_DATA, 'Credit_Card_Type', ComboBoxCardType.ItemIndex);
    INI.WriteDateTime(ACCOUNT_DATA, 'Expiration_Date', DateEditExpirationDate.Date);
    INI.WriteString(ACCOUNT_DATA, 'Security_Code', EditSecurityCode.Text);
    INI.WriteFloat(ACCOUNT_DATA, 'Amount', FloatSpinEditAmount.Value);
    INI.WriteString(ACCOUNT_DATA, 'Public_Key', EditPublicKey.Text);
    INI.WriteString(ACCOUNT_DATA, 'Private_Key', EditPrivateKey.Text);
  finally
    INI.Free;
  end;
  // Now close this dialog box...
  Close();
end;

procedure TForm_Account.FormActivate(Sender: TObject);
begin
  INI := TINIFile.Create('GUI.ini');
  try
    EditPeerToPeerNumber.Text := INI.ReadString(ACCOUNT_DATA, 'Peer-to-Peer_URL', EditPeerToPeerNumber.Text);
    EditYourAlias.Text := INI.ReadString(ACCOUNT_DATA, 'Alias', '');
    EditYourFullName.Text := INI.ReadString(ACCOUNT_DATA, 'Full_Name', '');
    EditStreetAddress.Text := INI.ReadString(ACCOUNT_DATA, 'Street_Address', '');
    EditCity.Text := INI.ReadString(ACCOUNT_DATA, 'City', '');
    ComboBoxState.ItemIndex := INI.ReadInteger(ACCOUNT_DATA, 'State', -1);
    EditZipCode.Text := INI.ReadString(ACCOUNT_DATA, 'Zip_Code', '');
    EditCreditCardNumber.Text := INI.ReadString(ACCOUNT_DATA, 'Credit_Card_Number', '');
    ComboBoxCardType.ItemIndex := INI.ReadInteger(ACCOUNT_DATA, 'Credit_Card_Type', -1);
    DateEditExpirationDate.Date := INI.ReadDateTime(ACCOUNT_DATA, 'Expiration_Date', 0);
    EditSecurityCode.Text := INI.ReadString(ACCOUNT_DATA, 'Security_Code', '');
    FloatSpinEditAmount.Value := INI.ReadInteger(ACCOUNT_DATA, 'Amount', 100);
    EditPublicKey.Text := INI.ReadString(ACCOUNT_DATA, 'Public_Key', '');
    EditPrivateKey.Text := INI.ReadString(ACCOUNT_DATA, 'Private_Key', '');
  finally
    INI.Free;
  end;

end;

procedure TForm_Account.FormCreate(Sender: TObject);
begin

end;

procedure TForm_Account.PanelPublicKeyExit(Sender: TObject);
begin
  if EditPrivateKey.Text = '' Then
      EditPrivateKey.Text := EditPublicKey.Text;
  ButtonSave.SetFocus;
end;

procedure TForm_Account.ButtonCancelClick(Sender: TObject);
begin
  // Abort the save and close this dialog box...
  Close();
end;

end.

