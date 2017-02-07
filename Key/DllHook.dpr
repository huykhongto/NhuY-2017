library DllHook;

uses
  SysUtils,
  Windows,
  Classes;//,
//  Dialogs;

{$R *.res}

// Définition d'un buffer intermédiaire de stockage des touches
// 127 touches maxi en attente de lecture pas GetNextKey()
type
  PKeyBuffer = ^TKeyBuffer;
  TKeyBuffer = record
    kbIN: Integer;
    kbOUT: Integer;
    kbKEY: array[0..127] of Integer;
    kbID: array[0..127] of Integer;
  end;

// Handle des accès aux Hook et FileMapping par l'application principale
// Ces données bien que globales ne sont pas accessible par les autres
// process. Elles ne peuvent donc pas être utilisées par la fonction
// CallBack du hook.
var
  HandleHook: Integer = 0;
  HandleFile: Integer = 0;
  Pointeur: PKeyBuffer = nil;
  //HandleProg  :Hwnd;//Integer;//    =0;

// procedure fSendMsg();
 // begin
 // showmessage(IntToStr(HandleProg));
 // end;
// Fonction CallBack du hook placé sur le clavier. Les touches lues sont placées
// dans le buffer pour être ensuite lues par la fonction GetNextKey().

function KeyboardHook(code: Integer; wparam: WPARAM; lparam: LPARAM): LRESULT stdcall;
type
  ptr_hwnd = ^hwnd;

var
  HandleFileLocal: Integer;
  PointeurLocal: PKeyBuffer;
  Adresse: Integer;
  ptr: ptr_hwnd;
  idmsg: Integer;


begin
//----------------------------------------
//message
  HandleFileLocal := OpenFileMapping(FILE_MAP_READ, False, 'HWNDFORM');
  if HandleFileLocal <> 0 then
  begin
     // showmessage('mappage ds dll ok');
    ptr := ptr_hwnd(MapViewOfFile(HandleFileLocal, FILE_MAP_READ, 0, 0, 0));
    if ptr <> nil then
    begin
      idmsg := RegisterWindowMessage('MY_CDOPEN');
      PostMessage(ptr^, idmsg, 0, 0); //)
    end
    else
      //showmessage('mappage ds dll OK');
  end
  else
    //showmessage('Erreur de mappage ds dll');
  CloseHandle(HandleFileLocal);


//-----------------------------------------
 //   fSendMsg();
  // Il faut penser que cette fonction s'exécute dans chaque process actif.
  // Les données globales de la dll ne sont donc pas accessibles. Le file
  // mapping permet de palier à ce problème en offre un espace mémoire
  // facile d'accès en n'en connaissant que le nom.
  HandleFileLocal := OpenFileMapping(FILE_MAP_WRITE, False, 'KEYHOOK');
  if HandleFileLocal <> 0 then
  begin
    PointeurLocal := PKeyBuffer(MapViewOfFile(HandleFileLocal, FILE_MAP_WRITE, 0, 0, 0));
    if PointeurLocal <> nil then
    begin

      // Une fois le FileMapping effectué, le buffer est en accès direct, on ajoute
      // alors la nouvelle touche à la suite de la file
      // WParam contient le code de touche virtuel
      // Le bit 31 de LParam est à 0 pour un KeyDown et à 1 pour un KeyUp
      Adresse := (PointeurLocal^.kbIN + 1) and 127;
      PointeurLocal^.kbID[Adresse] := GetCurrentProcessId;
      PointeurLocal^.kbKEY[Adresse] := (WParam and $0000FFFF) + (LParam and Longint($80000000));
      PointeurLocal^.kbIN := Adresse;
      UnMapViewOfFile(PointeurLocal);
    end;
    CloseHandle(HandleFileLocal);
  end;
  Result := CallNextHookEx(HandleHook, code, wparam, lparam);
end;

// Procédure d'initialisation du Hook et de création du FileMapping
// Elle doit être appelée une fois et une seule en début de votre application

function StartHook(): Boolean; stdcall;
begin
  // HandleProg:=hwndprog;
//showmessage(IntToStr(HandleProg));
     // showmessage('create');

  HandleFile := CreateFileMapping($FFFFFFFF // Handle mémoire => partage de mémoire et non de fichier
    , nil // Sécurité par défaut
    , PAGE_READWRITE // Accès en lecture/écriture
    , 0 // Taille de la zone partagée   HIGH
    , SizeOf(TKeyBuffer) // Taille de la zone partagée   LOW
    , 'KEYHOOK'); // Nom du partage
  if HandleFile <> 0
    then Pointeur := PKeyBuffer(MapViewOfFile(HandleFile // Handle obtenu par CreateFileMapping
      , FILE_MAP_WRITE // Accès en lecture/écriture
      , 0 // Pas d'offset
      , 0 // Pas d'offset
      , 0)); // Mapping de tout le fichier
  if Pointeur <> nil
    then begin
    Pointeur^.kbIN := 0; // Initialisation de la file d'attente
    Pointeur^.kbOUT := 0;
  end;
  HandleHook := SetWindowsHookEx(WH_KEYBOARD // Type de HOOK utilisé ( sur le clavier ici )
    , KeyboardHook // Adresse de la fonction CallBack qui sera appelée
    , hInstance // Handle de la dll demandant le Hook
    , 0); // Pas d'ID Thread, car on veut un Hook système
  Result := (HandleHook <> 0) and (HandleFile <> 0) and (Pointeur <> nil);
end;

// Procédure de fermeture du Hook
// Doit être appelée en fin d'application

function StopHook: Boolean; stdcall;
begin
  Result := True;
  if Pointeur <> nil then UnMapViewOfFile(Pointeur); // Libération du mapping
  if HandleFile <> 0 then CloseHandle(HandleFile); // Fermeture du fichier
  if HandleHook <> 0 then Result := UnHookWindowsHookEx(HandleHook); // Suppression du Hook
end;

// Procédure de lecture du buffer des touches par l'application.
// Chaque appel de la fonction envoi la touche suivante. La fonction renvoi True si une touche
// est effectivement disponible dans le buffer. Dans ce cas Key contient le code virtuel de la touche
// avec en plus dans le bit 31 de key, l'état KeyUP/KeyDown.
// Si le buffer est vide, la fonction renvoie False.

function GetNextKey(var Key, ID: Integer): Boolean; stdcall;
var Adresse: Integer;
begin
  if Pointeur^.kbIN <> Pointeur^.kbOUT
    then begin
    Adresse := (Pointeur^.kbOUT + 1) and 127;
    ID := Pointeur^.kbID[Adresse];
    Key := Pointeur^.kbKEY[Adresse];
    Pointeur^.kbOUT := Adresse;
    Result := True;
  end
  else Result := False;
end;

exports StartHook, StopHook, GetNextKey;

end.

