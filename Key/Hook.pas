unit Hook;

interface

uses
	SysUtils,
	Windows,
	Classes; // ,
// Dialogs;

// {$R *.res}

// D�finition d'un buffer interm�diaire de stockage des touches
// 127 touches maxi en attente de lecture pas GetNextKey()
type
	ptr_hwnd = ^hwnd;
	PKeyBuffer = ^TKeyBuffer;

	TKeyBuffer = record
		kbIN: Integer;
		kbOUT: Integer;
		kbKEY: array [0 .. 127] of Integer;
		kbID: array [0 .. 127] of Integer;
	end;

	// Handle des acc�s aux Hook et FileMapping par l'application principale
	// Ces donn�es bien que globales ne sont pas accessible par les autres
	// process. Elles ne peuvent donc pas �tre utilis�es par la fonction
	// CallBack du hook.
var
	HandleHook: Integer = 0;
	HandleFile: Integer = 0;
	Pointeur: PKeyBuffer = nil;
	// HandleProg  :Hwnd;//Integer;//    =0;
function KeyboardHook(code: Integer; wparam: wparam; lparam: lparam)
	: LRESULT stdcall;
function StartHook(): Boolean;
function GetNextKey(var Key, ID: Integer): Boolean;
function StopHook: Boolean;

// procedure fSendMsg();
// begin
// showmessage(IntToStr(HandleProg));
// end;
// Fonction CallBack du hook plac� sur le clavier. Les touches lues sont plac�es
// dans le buffer pour �tre ensuite lues par la fonction GetNextKey().
implementation

function KeyboardHook(code: Integer; wparam: wparam; lparam: lparam)
	: LRESULT stdcall;
var
	HandleFileLocal: Integer;
	PointeurLocal: PKeyBuffer;
	Adresse: Integer;
	ptr: ptr_hwnd;
	idmsg: Integer;
begin
	// ----------------------------------------
	// message
	HandleFileLocal := OpenFileMapping(FILE_MAP_READ, False, 'HWNDFORM');
	if HandleFileLocal <> 0 then
	begin
		// showmessage('mappage ds dll ok');
		ptr := ptr_hwnd(MapViewOfFile(HandleFileLocal, FILE_MAP_READ, 0, 0, 0));
		if ptr <> nil then
		begin
			idmsg := RegisterWindowMessage('MY_CDOPEN');
			PostMessage(ptr^, idmsg, 0, 0); // )
		end
		else
	end
	else
		CloseHandle(HandleFileLocal);
	HandleFileLocal := OpenFileMapping(FILE_MAP_WRITE, False, 'KEYHOOK');
	if HandleFileLocal <> 0 then
	begin
		PointeurLocal := PKeyBuffer(MapViewOfFile(HandleFileLocal, FILE_MAP_WRITE,
			0, 0, 0));
		if PointeurLocal <> nil then
		begin
			Adresse := (PointeurLocal^.kbIN + 1) and 127;
			PointeurLocal^.kbID[Adresse] := GetCurrentProcessId;
			PointeurLocal^.kbKEY[Adresse] := (wparam and $0000FFFF) +
				(lparam and Longint($80000000));
			PointeurLocal^.kbIN := Adresse;
			UnMapViewOfFile(PointeurLocal);
		end;
		CloseHandle(HandleFileLocal);
	end;
	Result := CallNextHookEx(HandleHook, code, wparam, lparam);
end;

// ========================================
function StartHook(): Boolean;
begin
	HandleFile := CreateFileMapping($FFFFFFFF
		// Handle m�moire => partage de m�moire et non de fichier
		, nil // S�curit� par d�faut
		, PAGE_READWRITE // Acc�s en lecture/�criture
		, 0 // Taille de la zone partag�e   HIGH
		, SizeOf(TKeyBuffer) // Taille de la zone partag�e   LOW
		, 'KEYHOOK'); // Nom du partage
	if HandleFile <> 0 then
		Pointeur := PKeyBuffer(MapViewOfFile(HandleFile
			// Handle obtenu par CreateFileMapping
			, FILE_MAP_WRITE // Acc�s en lecture/�criture
			, 0 // Pas d'offset
			, 0 // Pas d'offset
			, 0)); // Mapping de tout le fichier
	if Pointeur <> nil then
	begin
		Pointeur^.kbIN := 0; // Initialisation de la file d'attente
		Pointeur^.kbOUT := 0;
	end;
	HandleHook := SetWindowsHookEx(WH_KEYBOARD
		// Type de HOOK utilis� ( sur le clavier ici )
		, KeyboardHook // Adresse de la fonction CallBack qui sera appel�e
		, hInstance // Handle de la dll demandant le Hook
		, 0); // Pas d'ID Thread, car on veut un Hook syst�me
	Result := (HandleHook <> 0) and (HandleFile <> 0) and (Pointeur <> nil);
end;

// ========================================
function StopHook: Boolean;
begin
	Result := True;
	if Pointeur <> nil then
		UnMapViewOfFile(Pointeur); // Lib�ration du mapping
	if HandleFile <> 0 then
		CloseHandle(HandleFile); // Fermeture du fichier
	if HandleHook <> 0 then
		Result := UnHookWindowsHookEx(HandleHook); // Suppression du Hook
end;

// ========================================
function GetNextKey(var Key, ID: Integer): Boolean;
var
	Adresse: Integer;
begin
	if Pointeur^.kbIN <> Pointeur^.kbOUT then
	begin
		Adresse := (Pointeur^.kbOUT + 1) and 127;
		ID := Pointeur^.kbID[Adresse];
		Key := Pointeur^.kbKEY[Adresse];
		Pointeur^.kbOUT := Adresse;
		Result := True;
	end
	else
		Result := False;
end;

exports StartHook, StopHook, GetNextKey;

end.
