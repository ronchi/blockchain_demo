unit unit_Dashboard;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, pqconnection, sqldb, IBConnection, FileUtil, Forms,
  Controls, Graphics, Dialogs, ExtCtrls, StdCtrls, Buttons,
  ComCtrls, unit_account, IniFiles;

type

  { TFormDashboard }

  TFormDashboard = class(TForm)
    Button1: TButton;
    Button2: TButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    IBConnection1: TIBConnection;
    MemoNode1: TMemo;
    MemoNode2: TMemo;
    MemoNode3: TMemo;
    MemoNode4: TMemo;
    Panel1: TPanel;
    PanelBottom: TPanel;
    PanelTop: TPanel;
    PanelBase: TPanel;
    Splitter1: TSplitter;
    SplitterForTopSet: TSplitter;
    SplitterForBottomSet: TSplitter;
    StatusBar1: TStatusBar;
    procedure Button1Click(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure PanelBaseClick(Sender: TObject);
  private

  public

  end;

const
  DASHBOARD_GUI = 'Dashboard-GUI';

var
  FormDashboard: TFormDashboard;
  INI: TINIFile;
  GroupBox1_Left: integer;
  GroupBox3_Left: integer;
  Panel_Top: integer;

implementation

{$R *.lfm}

{ TFormDashboard }

procedure TFormDashboard.Button1Click(Sender: TObject);
begin
  Form_Account.Show;
end;

procedure TFormDashboard.DataSource1DataChange(Sender: TObject; Field: TField);
begin

end;

procedure TFormDashboard.FormActivate(Sender: TObject);
begin
  INI := TINIFile.Create('GUI.ini');
  try
    GroupBox1.Width := INI.ReadInteger(DASHBOARD_GUI, 'GroupBox1_Left', 185);
    GroupBox3.Width := INI.ReadInteger(DASHBOARD_GUI, 'GroupBox3_Left', 185);
    PanelTop.Height := INI.ReadInteger(DASHBOARD_GUI, 'Panel_Top', 170);
  finally
    INI.Free;
  end;
end;

procedure TFormDashboard.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  INI := TINIFile.Create('GUI.ini');
  try
    INI.WriteInteger(DASHBOARD_GUI, 'GroupBox1_Left', GroupBox1.Width);
    INI.WriteInteger(DASHBOARD_GUI, 'GroupBox3_Left', GroupBox3.Width);
    INI.WriteInteger(DASHBOARD_GUI, 'Panel_Top', PanelTop.Height);
  finally
    INI.Free;
  end;
end;

procedure TFormDashboard.PanelBaseClick(Sender: TObject);
begin

end;

end.

