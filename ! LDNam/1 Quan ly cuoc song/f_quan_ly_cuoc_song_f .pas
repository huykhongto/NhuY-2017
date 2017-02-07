unit f_quan_ly_cuoc_song_f;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ComCtrls, StdCtrls, Buttons, ExtCtrls,
  ImgList, JvTFManager, JvTFDays, JvTFGlance, JvTFGlanceTextViewer, JvTFMonths, JvTFWeeks,
  JvComponent, JvExControls, JvComponentBase, System.ImageList,LDNam_sys,
  LDNam_xu_ly_du_lieu,LDNam_sys_thoi_gian,f_dl_f, JvTFAlarm, Vcl.MPlayer;

type
  Tf_quan_ly_cuoc_song = class(TForm)
    utfScheduleManager1: TJvTFScheduleManager;
    StateImageList: TImageList;
  {  NeedApptsQuery: Db.TQuery;
    ApptSchedulesQuery: TQuery;
    DeleteApptLinkQuery: TQuery;
		DeleteApptQuery: TQuery;
    SchedulesQuery: TQuery;     }
    JvTFDaysPrinter1: TJvTFDaysPrinter;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    JvTFDays1: TJvTFDays;
    JvTFWeeks1: TJvTFWeeks;
    JvTFMonths1: TJvTFMonths;
    GlanceTextViewer1: TJvTFGlanceTextViewer;
    GlanceTextViewer2: TJvTFGlanceTextViewer;
    Panel1: TPanel;
    ResourceCombo: TComboBox;
    PrevDateButton: TBitBtn;
    NextDateButton: TBitBtn;
    NewApptButton: TBitBtn;
    EditApptButton: TBitBtn;
    DeleteApptButton: TBitBtn;
    ViewSchedsButton: TBitBtn;
    HideSchedButton: TBitBtn;
    ShareButton: TBitBtn;
    TimeIncCombo: TComboBox;
    GotoDatePicker: TDateTimePicker;
    ModeCombo: TComboBox;
    DaysCombo: TComboBox;
    PrintButton: TBitBtn;
    sttb1: TStatusBar;
    tm1: TTimer;
    JvTFAlarm1: TJvTFAlarm;
		mp_1: TMediaPlayer;
    procedure utfScheduleManager1PostAppt(Sender: TObject; Appt: TJvTFAppt);
    procedure utfScheduleManager1DeleteAppt(Sender: TObject; Appt: TJvTFAppt);
    procedure utfScheduleManager1RefreshAppt(Sender: TObject; Appt: TJvTFAppt);
    procedure ModeComboChange(Sender: TObject);
    procedure ViewSchedsButtonClick(Sender: TObject);
    procedure HideSchedButtonClick(Sender: TObject);
    procedure ResourceComboChange(Sender: TObject);
    procedure DaysComboChange(Sender: TObject);
    procedure ShareButtonClick(Sender: TObject);
    procedure PrevDateButtonClick(Sender: TObject);
    procedure NextDateButtonClick(Sender: TObject);
    procedure GotoDatePickerChange(Sender: TObject);
    procedure GotoDatePickerUserInput(Sender: TObject;
      const UserString: String; var DateAndTime: TDateTime;
      var AllowChange: Boolean);
    procedure TimeIncComboChange(Sender: TObject);
    procedure NewApptButtonClick(Sender: TObject);
    procedure EditApptButtonClick(Sender: TObject);
    procedure DeleteApptButtonClick(Sender: TObject);
    procedure JvTFDays1DateChanging(Sender: TObject; var NewDate: TDate);
    procedure JvTFDays1DateChanged(Sender: TObject);
    procedure JvTFDays1GranularityChanged(Sender: TObject);
    procedure JvTFDays1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
    procedure JvTFDaysPrinter1ApptProgress(Sender: TObject; Current,
      Total: Integer);
    procedure JvTFDaysPrinter1AssembleProgress(Sender: TObject; Current,
      Total: Integer);
    procedure JvTFDaysPrinter1PrintProgress(Sender: TObject; Current,
      Total: Integer);
    procedure utfScheduleManager1LoadBatch(Sender: TObject; BatchName: String;
			BatchStartDate, BatchEndDate: TDate);
    procedure FormCreate(Sender: TObject);
		procedure tm1Timer(Sender: TObject);
		procedure luu_thong_so;
		procedure doc_thong_so;
    procedure JvTFDays1InsertAppt(Sender: TObject);
    procedure JvTFDays1InsertSchedule(Sender: TObject);
		procedure JvTFDays1UpdateColTitles(Sender: TObject; Col: TJvTFDaysCol;
			var NewGroupTitle, NewTitle: string);
    procedure JvTFDays1GranularityChanging(Sender: TObject;
      var NewGran: Integer);
    procedure utfScheduleManager1PostApptQuery(Sender: TObject; Appt: TJvTFAppt;
			var CanPost: Boolean);
    procedure utfScheduleManager1RefreshSched(Sender: TObject;
      Schedule: TJvTFSched);
		procedure utfScheduleManager1SetApptDescription(Sender: TObject;
			Appt: TJvTFAppt; var Description: string);
  	procedure mo_am(ten_am:string);
    procedure JvTFAlarm1Alarm(Sender: TObject; AAppt: TJvTFAppt;
      var SnoozeMins: Integer; var Dismiss: Boolean);

	private
    { Private declarations }
  public
    { Public declarations }
  end;

var
	f_quan_ly_cuoc_song: Tf_quan_ly_cuoc_song;

implementation

Uses VisibleResourcesUnit, ShareUnit, ApptEditUnit, PrintProgressUnit;

{$R *.DFM}
procedure Tf_quan_ly_cuoc_song.doc_thong_so;
var 
	dong:string;
	a: array [0..50] of string;
	j:integer;
	vi_tri_cuoi:integer;
	i:integer;
	so_dl:integer;
	function tach_b(c:string) :boolean;
	begin
		Result:=sai;
		if c='d' then
			Result:=dung;
	end;
	function tach_s(c:string) :integer;
	begin
		Result:=0;
		if c<>'' then
			Result:=StrToInt(c);
	end;
	function tach_s_md(c:string;md:integer) :integer;
	begin
		Result:=md;
		if c<>'' then
			Result:=StrToInt(c);
	end;
	function tach_c_md(c:string;md:string) :string;
	begin
		Result:=md;
		if c<>'' then
			Result:=c;
	end;
begin
	dong:=f_dl.lb_thien_su.Items[0];
	so_dl:=dem_chuoi_trong_chuoi(phan_cot,dong)-1 ;
	for j := 0 to so_dl do
	begin
		vi_tri_cuoi := AnsiPos(phan_cot, dong);
		a[j]:=copy(dong, 1, vi_tri_cuoi-1);
		dong:=copy(dong,vi_tri_cuoi+2,Length(dong));
	end;
	//f_quan_ly_thien_su.Left:=tach_s(a[1]);
	//f_quan_ly_thien_su.top:=tach_s(a[2]);
	//ma_thien_su:= tach_c_md(a[3],'TS000000');
	for i := 0 to so_dl-4 do
	begin
		//lv_thien_su.Columns[i].Width:=tach_s_md(a[i+4],50);
	end;
end;
//======================================== 
procedure Tf_quan_ly_cuoc_song.luu_thong_so;
var
	dong:string;
	i:integer;
	so_dl:integer;
	procedure them_c(ts:string);
	begin
		dong:=dong+ts+phan_cot;
	end;
	procedure them_s(s:integer);
	begin
		them_c(IntToStr(s));
	end;
	procedure them_b(b:boolean);
	Var
		b_c: string;
	begin
		b_c:='s';
		if b=dung then
			b_c:='d';
		them_c(b_c);
	end;
begin
	dong:=phien_ban_du_lieu+phan_cot;
	//them_s(f_quan_ly_thien_su.Left); // 1
	//them_s(f_quan_ly_thien_su.Top); // 2
	//them_c(ma_thien_su); // 3
	so_dl:=dem_chuoi_trong_chuoi(phan_cot,f_dl.lb_thien_su.Items[0])-1 ;
	for i := 0 to so_dl-4 do
	begin
		//them_s(lv_thien_su.Columns[i].Width);
	end;
	f_dl.lb_thien_su.Items[0]:=dong;
	f_dl.lb_thien_su_luu;
	//them_c('1111');
end;
//======================================== 
procedure Tf_quan_ly_cuoc_song.mo_am(ten_am:string);
begin
	//if mp_1.Position=0 then
	with mp_1 do
	begin
		FileName:=duong_dan_goc+'\Du lieu\Nhac\Am thanh\'+ten_am;
		Open;
		Play;
		//che_do_am_thanh_:=am_thanh_bat;
		//tg_am_thanh_:=2;
	end;
end;
//======================================== 
procedure Tf_quan_ly_cuoc_song.utfScheduleManager1PostAppt(Sender: TObject;
  Appt: TJvTFAppt);
var
  I : Integer;
  dong:string;
  procedure them_c(ts:string);
	begin
		dong:=dong+ts+phan_cot;
	end;
	procedure them_b(b:boolean);
	Var
		b_c: string;
	begin
		b_c:='s';
		if b=dung then
			b_c:='d';
		them_c(b_c);
	end;
  procedure them_s(s:integer);
	begin
		them_c(IntToStr(s));
	end;
begin
	dong:=phien_ban_du_lieu+phan_cot;
	f_dl.lb_dl_cuoc_song.Items[0]:=dong;
	dong:='';
	them_c(Appt.ID);
	them_c(FormatDateTime(dinh_dang_ntn,Appt.StartDate));
	them_c(timetostr(Appt.StartTime));
	them_c(FormatDateTime(dinh_dang_ntn,Appt.EndDate));
	them_c(timetostr(Appt.EndTime));
	them_c(Appt.Description);
	them_b(Appt.AlarmEnabled);
	them_s(Appt.AlarmAdvance);
	if lb_sua(f_dl.lb_dl_cuoc_song,dong)=sai then
	begin
		f_dl.lb_dl_cuoc_song.Items.Add(dong);	
	end;
	//---------------------------------------- 
	dong:=phien_ban_du_lieu+phan_cot;
	f_dl.lb_dl_lien_ket_nhom.Items[0]:=dong;
	For I := 0 to Appt.ScheduleCount - 1 do
	Begin
		dong:='';
		them_c(Appt.ID);
		them_c(Appt.Schedules[I]);
		if lb_sua(f_dl.lb_dl_lien_ket_nhom,dong)=sai then
		begin
			f_dl.lb_dl_lien_ket_nhom.Items.Add(dong);
		end;
	End;
	f_dl.lb_dl_cuoc_song.Items.SaveToFile
				(ten_f_dlcs3, TEncoding.UTF8);
	f_dl.lb_dl_lien_ket_nhom.Items.SaveToFile
				(ten_f_dlcs2, TEncoding.UTF8)
end;

procedure Tf_quan_ly_cuoc_song.utfScheduleManager1PostApptQuery(Sender: TObject;
  Appt: TJvTFAppt; var CanPost: Boolean);
begin
  GotoDatePicker.DateTime:=now;
end;


procedure Tf_quan_ly_cuoc_song.utfScheduleManager1DeleteAppt(Sender: TObject;
	Appt: TJvTFAppt);
var
	i:integer;
	dong:string;
	id:string;
begin
	lb_xoa(f_dl.lb_dl_cuoc_song,Appt.ID);
	lb_xoa(f_dl.lb_dl_lien_ket_nhom,Appt.ID);
	f_dl.lb_dl_lien_ket_nhom.Items.SaveToFile
				(ten_f_dlcs2, TEncoding.UTF8);
	f_dl.lb_dl_cuoc_song.Items.SaveToFile
				(ten_f_dlcs3, TEncoding.UTF8);
end;

procedure Tf_quan_ly_cuoc_song.utfScheduleManager1RefreshAppt(Sender: TObject;
  Appt: TJvTFAppt);
var dong:string;
j:integer;
dong5:string;
begin
	With f_dl.lb_dl_cuoc_song do
    Begin
			dong:=lb_tro(f_dl.lb_dl_cuoc_song,Appt.ID);
			tach_cot(dong);
      Appt.SetStartEnd(strtodate(tach_cot(dong)),strtotime(tach_cot(dong)),
                       strtodate(tach_cot(dong)),strtotime(tach_cot(dong)));
       Appt.Description:=tach_cot(dong);
       if tach_cot(dong)='d' then
          Appt.AlarmEnabled := dung
       else
          Appt.AlarmEnabled := sai;
				Appt.AlarmAdvance := strtoint(tach_cot(dong));
    End;
  {
  // Now update the Appt --> Schedule(s) relationship
  Appt.ClearSchedules;
  {
  With ApptSchedulesQuery do
    Begin
      ParamByName('ApptID').AsString := Appt.ID;
      Open;
      First;
      While not EOF do
        Begin
          Appt.AddSchedule(FieldByName('SchedName').AsString);
          Next;
        End;
      Close; // ApptSchedulesQuery
    End;    }
	for j := 1 to f_dl.lb_dl_lien_ket_nhom.items.Count-1 do
  begin
		dong5:=f_dl.lb_dl_lien_ket_nhom.Items[j];
  	if Appt.ID=tach_cot(dong5) then
  	Appt.AddSchedule(tach_cot(dong5));
  end;

end;

procedure Tf_quan_ly_cuoc_song.utfScheduleManager1RefreshSched(Sender: TObject;
	Schedule: TJvTFSched);
begin
GotoDatePicker.DateTime:=now;
end;

procedure Tf_quan_ly_cuoc_song.utfScheduleManager1SetApptDescription(
  Sender: TObject; Appt: TJvTFAppt; var Description: string);
begin
GotoDatePicker.DateTime:=now;
end;

procedure Tf_quan_ly_cuoc_song.ModeComboChange(Sender: TObject);
begin
  If ModeCombo.ItemIndex = 0 Then
    // Single mode
    Begin
      // display the appropriate tool bar controls
      ViewSchedsButton.Visible := False;
      HideSchedButton.Visible := False;
      ShareButton.Visible := False;
      ResourceCombo.Visible := True;
      DaysCombo.Visible := True;
      // synchronize the date
      JvTFDays1.Template.LinearStartDate := GotoDatePicker.Date;
      // "activate" the Linear template
			JvTFDays1.Template.ActiveTemplate := agtLinear;
      // set the column grouping
      JvTFDays1.Grouping := grResource;
    End
  Else
    // Group mode
    Begin
      // display the appropriate tool bar controls
      ViewSchedsButton.Visible := True;
      HideSchedButton.Visible := True;
      ShareButton.Visible := True;
      ResourceCombo.Visible := False;
      DaysCombo.Visible := False;
      // synchronize the date
      JvTFDays1.Template.CompDate := GotoDatePicker.Date;
      // "activate" the Comparative template
      JvTFDays1.Template.ActiveTemplate := agtComparative;
      // set the column grouping
      JvTFDays1.Grouping := grDate;
    End;
end;

procedure Tf_quan_ly_cuoc_song.ViewSchedsButtonClick(Sender: TObject);
begin
  VisibleResources.ShowModal;
end;

procedure Tf_quan_ly_cuoc_song.HideSchedButtonClick(Sender: TObject);
var
  I,
  NameIndex : Integer;
  NameList : TStringList;
begin
  NameList := TStringList.Create;

  Try
    With JvTFDays1 do
      Begin
        If ValidSelection Then
          Begin
            For I := SelStart.X to SelEnd.X do
              NameList.Add(Cols[I].SchedName);

						For I := 0 to NameList.Count - 1 do
              Begin
                NameIndex := Template.CompNames.IndexOf(NameList[I]);
                If NameIndex > -1 Then
                  Template.CompNames.Delete(NameIndex);
              End;
          End
        Else
          MessageDlg('Please select a schedule to hide.', mtInformation, [mbOK], 0);
      End;
  Finally
    NameList.Free;
  End;
end;

procedure Tf_quan_ly_cuoc_song.ResourceComboChange(Sender: TObject);
begin
  JvTFDays1.Template.LinearName := ResourceCombo.Text;
  JvTFWeeks1.SchedNames.Clear;
  JvTFWeeks1.SchedNames.Add(ResourceCombo.Text);
  JvTFWeeks1.Refresh;
  JvTFMonths1.SchedNames.Clear;
  JvTFMonths1.SchedNames.Add(ResourceCombo.Text);
  JvTFMonths1.Refresh;
end;

procedure Tf_quan_ly_cuoc_song.DaysComboChange(Sender: TObject);
begin
  Case DaysCombo.ItemIndex of
    0 : JvTFDays1.Template.LinearDayCount := 31;
    1 : JvTFDays1.Template.LinearDayCount := 14;
    2 : JvTFDays1.Template.LinearDayCount := 7;
    3 : JvTFDays1.Template.LinearDayCount := 5;
    4 : JvTFDays1.Template.LinearDayCount := 3;
    5 : JvTFDays1.Template.LinearDayCount := 2;
    6 : JvTFDays1.Template.LinearDayCount := 1;
  End;
end;

procedure Tf_quan_ly_cuoc_song.ShareButtonClick(Sender: TObject);
begin
  If JvTFDays1.SelAppt <> nil Then
    Share.ShowModal
  Else
    MessageDlg('Please select an appointment.', mtInformation, [mbOK], 0);
end;

procedure Tf_quan_ly_cuoc_song.PrevDateButtonClick(Sender: TObject);
begin
  JvTFDays1.PrevDate;
end;

procedure Tf_quan_ly_cuoc_song.NextDateButtonClick(Sender: TObject);
begin
  JvTFDays1.NextDate;
end;

procedure Tf_quan_ly_cuoc_song.GotoDatePickerChange(Sender: TObject);
begin
  // GotoDatePicker.OnCloseUp should also point to this handler
  JvTFDays1.GotoDate(GotoDatePicker.Date);
  JvTFWeeks1.DisplayDate := GotoDatePicker.Date;
  JvTFWeeks1.DisplayDate := GotoDatePicker.Date;
end;

procedure Tf_quan_ly_cuoc_song.GotoDatePickerUserInput(Sender: TObject;
  const UserString: String; var DateAndTime: TDateTime;
  var AllowChange: Boolean);
begin
  AllowChange := True;
  GotoDatePicker.OnChange(nil);
end;

procedure Tf_quan_ly_cuoc_song.TimeIncComboChange(Sender: TObject);
begin
  Case TimeIncCombo.ItemIndex of
     0 : JvTFDays1.Granularity := 60;
     1 : JvTFDays1.Granularity := 30;
     2 : JvTFDays1.Granularity := 20;
     3 : JvTFDays1.Granularity := 15;
     4 : JvTFDays1.Granularity := 12;
     5 : JvTFDays1.Granularity := 10;
     6 : JvTFDays1.Granularity := 6;
     7 : JvTFDays1.Granularity := 5;
     8 : JvTFDays1.Granularity := 4;
     9 : JvTFDays1.Granularity := 3;
    10 : JvTFDays1.Granularity := 2;
    11 : JvTFDays1.Granularity := 1;
  End;
end;

procedure Tf_quan_ly_cuoc_song.tm1Timer(Sender: TObject);
begin
	tm1.Enabled:=sai;
	sttb1.Panels[0].Text:='';
end;

procedure Tf_quan_ly_cuoc_song.NewApptButtonClick(Sender: TObject);
begin
  // Simply open the EditAppt window.  The Appt var of the
  // EditAppt form will already be nil (which indicates
  // that the appoinment is being created).
  ApptEdit.ShowModal;
end;

procedure Tf_quan_ly_cuoc_song.EditApptButtonClick(Sender: TObject);
begin
  If Assigned(JvTFDays1.SelAppt) Then
		Begin
      // Set EditAppt's Appt var to the selected appointment to
      // indicate that the appointment should be edited.
      ApptEdit.Appt := JvTFDays1.SelAppt;
      ApptEdit.ShowModal;
    End
  Else
	begin
		sttb1.Panels[0].Text:='Cần chọn một cuộc hẹn để sửa';
		tm1.Enabled:=dung;
	end;
end;

procedure Tf_quan_ly_cuoc_song.DeleteApptButtonClick(Sender: TObject);
var
  Appt : TJvTFAppt;
  dbDel : Boolean;
  SelSchedName : String;
begin
  // This routine employs a simple business that asks the user what to
  // do in the case where the user is attempting to delete a shared appt.
  // NOTE:  This is NOT required.  You are completely free to implement
	// any business rules you see fit.
  // Another shortcut to save typing
	Appt := JvTFDays1.SelAppt;

  If Assigned(Appt) Then
    Begin
      dbDel := True;
      If Appt.Shared Then
        If MessageDlg('This appointment is shared with other schedules.' + #13#10 +
                      'Do you want to delete the appointment from ' +
                      'all schedules?' + #13#10#13#10 +
                      'Choose ''No'' to delete the appointment from the ' +
                      'selected schedule only.' + #13#10 +
                      'Choose ''All'' to delete the appointment from all schedules.',
                      mtConfirmation, [mbNo, mbAll], 0) = mrNo Then
          Begin
            // Don't delete the appointment, but remove it from the schedule
            // of the selected resource.
            dbDel := False;

            With JvTFDays1 do
              Begin
                SelSchedName := '';
                If ValidSelection and Cols[SelStart.X].Connected Then
                  SelSchedName := Cols[SelStart.X].Schedule.SchedName;
              End;

            If SelSchedName <> '' Then
              Appt.RemoveSchedule(SelSchedName)
            Else
              MessageDlg('No schedule is selected.' + #13#10 +
                         'Could not remove appointment from schedule.',
                         mtInformation, [mbOK], 0);
          End;

      If dbDel Then
				If MessageDlg('Có chắc muốn xóa cuộc hẹn này?',
											mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
          JvTFDays1.ScheduleManager.dbDeleteAppt(JvTFDays1.SelAppt);
		End
	Else
		//MessageDlg('Please select an appointment to delete.',mtInformation, [mbOK], 0);
	begin
		sttb1.Panels[0].Text:='Cần chọn một cuộc hẹn để xóa';
		tm1.Enabled:=dung;
	end;
end;

procedure Tf_quan_ly_cuoc_song.JvTFDays1DateChanging(Sender: TObject;
  var NewDate: TDate);
begin
  // Make sure all appts are posted before moving on.
  JvTFDays1.ScheduleManager.PostAppts;
end;

procedure Tf_quan_ly_cuoc_song.JvTFAlarm1Alarm(Sender: TObject;
  AAppt: TJvTFAppt; var SnoozeMins: Integer; var Dismiss: Boolean);
begin
	mo_am('at01.wma');
end;

procedure Tf_quan_ly_cuoc_song.JvTFDays1DateChanged(Sender: TObject);
begin
  // Synchronize the tool bar
  With JvTFDays1.Template do
		If ActiveTemplate = agtLinear Then
      GotoDatePicker.Date := LinearStartDate
    Else
      GotoDatePicker.Date := CompDate;
end;

procedure Tf_quan_ly_cuoc_song.JvTFDays1GranularityChanged(Sender: TObject);
begin
  // Update the TimeIncCombo when the granularity is changed.
  //  (This can be done by <Ctrl> + <Insert> and <Ctrl> + <Delete>)
  Case JvTFDays1.Granularity of
    60 : TimeIncCombo.ItemIndex := 0;
    30 : TimeIncCombo.ItemIndex := 1;
    20 : TimeIncCombo.ItemIndex := 2;
    15 : TimeIncCombo.ItemIndex := 3;
    12 : TimeIncCombo.ItemIndex := 4;
    10 : TimeIncCombo.ItemIndex := 5;
     6 : TimeIncCombo.ItemIndex := 6;
     5 : TimeIncCombo.ItemIndex := 7;
     4 : TimeIncCombo.ItemIndex := 8;
     3 : TimeIncCombo.ItemIndex := 9;
     2 : TimeIncCombo.ItemIndex := 10;
  Else
    TimeIncCombo.ItemIndex := 11;
  End;
end;

procedure Tf_quan_ly_cuoc_song.JvTFDays1GranularityChanging(Sender: TObject;
	var NewGran: Integer);
begin
	GotoDatePicker.DateTime:=now;
end;

procedure Tf_quan_ly_cuoc_song.JvTFDays1InsertAppt(Sender: TObject);
begin
	GotoDatePicker.DateTime:=now;
end;

procedure Tf_quan_ly_cuoc_song.JvTFDays1InsertSchedule(Sender: TObject);
begin
GotoDatePicker.DateTime:=now;
end;

procedure Tf_quan_ly_cuoc_song.JvTFDays1UpdateColTitles(Sender: TObject;
  Col: TJvTFDaysCol; var NewGroupTitle, NewTitle: string);
begin
//GotoDatePicker.DateTime:=now;
end;

procedure Tf_quan_ly_cuoc_song.JvTFDays1DblClick(Sender: TObject);
begin
  With JvTFDays1 do
    If ValidSelection Then
      If Assigned(SelAppt) Then
        EditApptButtonClick(nil)
      Else
        NewApptButtonClick(nil);
end;

procedure Tf_quan_ly_cuoc_song.FormShow(Sender: TObject);
var
  ResName : String;
  i:integer;
  dong_dl:string;
begin
	GotoDatePicker.Date := EncodeDate(2002, 1, 1);
	GotoDatePicker.DateTime:=now;
  TimeIncCombo.ItemIndex := 1; // 30 mins

  // Initialize the mode
  ModeCombo.ItemIndex := 0; // Single mode
  DaysCombo.ItemIndex := 6; // One day

	// Populate the resource related controls
	With f_dl.lb_dl_nhom do
  begin
    for I := 1 to f_dl.lb_dl_nhom.Items.Count-1 do
    Begin
      dong_dl:=f_dl.lb_dl_nhom.Items[i];
			ResName:=tach_cot(dong_dl);
      //ResName := SchedulesQuery.FieldByName('SchedName').AsString;
      ResourceCombo.Items.Add(ResName);
      VisibleResources.ResourcesCheckList.Items.Add(ResName);
			Share.ResourcesCheckList.Items.Add(ResName);
    End;
  end;

  // Initialize the resource related controls
  ResourceCombo.ItemIndex := 0;
	//VisibleResources.ResourcesCheckList.Checked[0] := True;

  // Initialize the comparative template
  //JvTFDays1.Template.CompNames.Add(VisibleResources.ResourcesCheckList.Items[0]);

  // Now run the events to synchronize JvTFDays, etc.
  ResourceComboChange(nil);
	DaysComboChange(nil);
  ModeComboChange(nil);
	GotoDatePicker.Date := EncodeDate(2012,12,22);
	GotoDatePicker.DateTime:=now;
	GotoDatePickerChange(nil);
  TimeIncComboChange(nil);
end;

procedure Tf_quan_ly_cuoc_song.PrintButtonClick(Sender: TObject);
begin
  With JvTFDaysPrinter1 do
    Begin
      // "Copy" the display properties from the JvTFDays control
      SetProperties(JvTFDays1);
      // Set gridline color to black for sharp display on printed page
      GridLineColor := clBlack;
      // print 48 rows on each page
      PageLayout.RowsPerPage := 48;
      // fit all the columns onto one page wide
      PageLayout.ColsPerPage := 0;
      // "Copy" the schedules from the JvTFDays control
      Cols.Assign(JvTFDays1.Cols);
      PrintProgress.Show;
      Application.ProcessMessages;
      // print the document
      PrintDirect;
      PrintProgress.Close;
    End;
end;

procedure Tf_quan_ly_cuoc_song.JvTFDaysPrinter1ApptProgress(Sender: TObject;
  Current, Total: Integer);
begin
  If Current > Total Then
    Total := Current;
  PrintProgress.Label2.Caption := 'Processing appointment ' + IntToStr(Current) +
                                  ' of ' + IntToStr(Total) + ' (estimated)';
  PrintProgress.ProgressBar1.Max := Total;
  PrintProgress.ProgressBar1.Position := Current;
end;

procedure Tf_quan_ly_cuoc_song.JvTFDaysPrinter1AssembleProgress(Sender: TObject;
  Current, Total: Integer);
begin
  PrintProgress.Label2.Caption := 'Assembling page ' + IntToStr(Current) +
                                  ' of ' + IntToStr(Total); 
  PrintProgress.ProgressBar1.Max := Total;
  PrintProgress.ProgressBar1.Position := Current;
end;

procedure Tf_quan_ly_cuoc_song.JvTFDaysPrinter1PrintProgress(Sender: TObject;
  Current, Total: Integer);
begin
  PrintProgress.Label2.Caption := 'Printing page ' + IntToStr(Current) +
                                  ' of ' + IntToStr(Total);
  PrintProgress.ProgressBar1.Max := Total;
  PrintProgress.ProgressBar1.Position := Current;
end;

procedure Tf_quan_ly_cuoc_song.utfScheduleManager1LoadBatch(Sender: TObject;
	BatchName: String; BatchStartDate, BatchEndDate: TDate);
var
	Appt : TJvTFAppt;
  NewAppt : Boolean;
	dong:string;
	dong5:string;
	j,a:integer;
	dong4:string;
	id:string;
	ngay_bd:string;
	ngay_kt:string;
	noi_dung:string;
begin
		Begin
	// Thiết lập các tham số truy vấn để truy vấn sẽ trả 
	// tất cả các cuộc hẹn cho các nguồn tài nguyên cho rằng rơi vào ngày nhất định.
			for a := 1 to f_dl.lb_dl_cuoc_song.items.count-1 do
			begin
				dong4:=f_dl.lb_dl_cuoc_song.items[a];
				id:=tach_cot(dong4);
				ngay_bd:=tach_cot(dong4);
				tach_cot(dong4);
				ngay_kt:=tach_cot(dong4);
				tach_cot(dong4);
				noi_dung:=tach_cot(dong4);
				NewAppt:=dung;
				if (ngay_bd=datetostr(BatchStartDate))or(ngay_kt=datetostr(BatchEndDate))
				or (noi_dung=BatchName) then
			 {	begin
					dong:=f_dl.lb_dl_cuoc_song.items[a];
					id:=tach_cot(dong);
					If NewAppt Then
					Begin
						Appt.SetStartEnd(strtodate(tach_cot(dong)),strtotime(tach_cot(dong)),
										 strtodate(tach_cot(dong)),strtotime(tach_cot(dong)));
							 Appt.Description:=tach_cot(dong);
							 if tach_cot(dong)='d' then
									Appt.AlarmEnabled := dung
							 else
									Appt.AlarmEnabled := sai;
								Appt.AlarmAdvance := strtoint(tach_cot(dong));
						for j := 1 to f_dl.lb_dl_lien_ket_nhom.items.Count-1 do
						begin
							dong5:=f_dl.lb_dl_lien_ket_nhom.Items[j];
							if id=tach_cot(dong5) then
								Appt.AddSchedule(tach_cot(dong5));
						end;
					End;
					dong:=f_dl.lb_dl_cuoc_song.items[a];
					utfScheduleManager1.RequestAppt(tach_cot(dong),
						Appt, NewAppt);
				end;}
				begin
					dong:=f_dl.lb_dl_cuoc_song.items[a];
					utfScheduleManager1.RequestAppt(tach_cot(dong),
						Appt, NewAppt);
					If NewAppt Then
					Begin
						Appt.SetStartEnd(strtodate(tach_cot(dong)),strtotime(tach_cot(dong)),
										 strtodate(tach_cot(dong)),strtotime(tach_cot(dong)));
							 Appt.Description:=tach_cot(dong);
							 if tach_cot(dong)='d' then
									Appt.AlarmEnabled := dung
							 else
									Appt.AlarmEnabled := sai;
								Appt.AlarmAdvance := strtoint(tach_cot(dong));
						for j := 1 to f_dl.lb_dl_lien_ket_nhom.items.Count-1 do
						begin
							dong5:=f_dl.lb_dl_lien_ket_nhom.Items[j];
							if Appt.ID=tach_cot(dong5) then
								Appt.AddSchedule(tach_cot(dong5));
						end;
					End;
				end;  
				
			end;
		End;
end;


procedure Tf_quan_ly_cuoc_song.FormCreate(Sender: TObject);
begin	
	ten_f_dlcs1 := duong_dan_goc + f_dl_nhom;
	lb_luu_file(f_dl.lb_dl_nhom,ten_f_dlcs1);

	ten_f_dlcs2 := duong_dan_goc + f_dl_lien_ket_nhom;
	lb_luu_file(f_dl.lb_dl_lien_ket_nhom,ten_f_dlcs2);

	ten_f_dlcs3 := duong_dan_goc + f_dl_cuoc_song;
	lb_luu_file(f_dl.lb_dl_cuoc_song,ten_f_dlcs3);
	//JvTFAlarm1.Enabled:=dung;
	///JvTFAlarm1.TimerInterval:=1000;
	//JvTFAlarm1.AlarmCheck;
	//GetAlarmForApptID('ssdsd');
	//utfScheduleManager1.
end;

end.