program ListData;

uses sysUtils,Dos,crt;


procedure NameInput; forward;
procedure NimInput; forward;
procedure GenderInput; forward;
procedure Replay; forward;
procedure PrintDatabase; forward;
procedure JurusanInput; forward;
procedure ProdiInput; forward;
procedure BirthdateInput; forward;

type
    Database_Record = record
        database: array[1..200] of string;
    end;

    Birthdate_Record = record
        day, month, year: integer;
    end;

    Input_Record = record
        userindex: integer;
        usernim, username, usergender, userchoice, userJurusan, userProdi: string;
        birthdate: Birthdate_Record;
    end;

var
    tahun, bulan, hari, hariDalamSeminggu: Word;
    date:string;
    recordvalue: Database_Record;
    inputvalue: Input_Record;

procedure GetCurrentDate;
begin
    GetDate(tahun, bulan, hari, hariDalamSeminggu);
end;

procedure PrintDayOfWeek;
begin
    case hariDalamSeminggu of
        0: date := 'Minggu';
        1: date := 'Senin';
        2: date := 'Selasa';
        3: date := 'Rabu';
        4: date := 'Kamis';
        5: date := 'Jumat';
        6: date := 'Sabtu';
    end;
end;

procedure NameInput;
var
    hasNumber: boolean;
    i: integer;
begin
    writeln('=== Menu Input ===');
    write('Nama (Max 30): ');
    readln(inputvalue.username);

    if (Length(inputvalue.username) <= 0) or (Length(inputvalue.username) > 30) then
    begin
        writeln('! Input Tidak Valid !');
        NameInput;
        exit;
    end;

    hasNumber := False;
    for i := 1 to Length(inputvalue.username) do
    begin
        if inputvalue.username[i] in ['0'..'9'] then
        begin
            hasNumber := True;
            break;
        end;
    end;

    if hasNumber then
    begin
        writeln('! Input Tidak Valid: Nama tidak boleh mengandung angka!');
        NameInput;
        exit;
    end;

    while Length(inputvalue.username) < 30 do
        inputvalue.username := inputvalue.username + ' ';

    NimInput;
end;

procedure NimInput;
var
    hasNonNumber: boolean;
    i: integer;
begin
    write('NIM (Max 12): ');
    readln(inputvalue.usernim);

    if (Length(inputvalue.usernim) <= 0) or (Length(inputvalue.usernim) > 12) then
    begin
        writeln('! Input Tidak Valid: Panjang NIM harus antara 1 dan 12 karakter!');
        NimInput;
        exit;
    end;

    hasNonNumber := False;
    for i := 1 to Length(inputvalue.usernim) do
    begin
        if not (inputvalue.usernim[i] in ['0'..'9','.']) then
        begin
            hasNonNumber := True;
            break;
        end;
    end;

    if hasNonNumber then
    begin
        writeln('! Input Tidak Valid: NIM hanya boleh berisi angka!');
        NimInput;
        exit;
    end;

    while Length(inputvalue.usernim) < 12 do
        inputvalue.usernim := inputvalue.usernim + ' ';

    BirthdateInput;
end;

procedure BirthdateInput;
begin
    write('Masukkan Tanggal Lahir (Hari(1-31)): ');
    readln(inputvalue.birthdate.day);
    write('Masukkan Tanggal Lahir (Bulan(1-12)): ');
    readln(inputvalue.birthdate.month);
    write('Masukkan Tanggal Lahir (Tahun(1900-2100)): ');
    readln(inputvalue.birthdate.year);

    if (inputvalue.birthdate.day < 1) or (inputvalue.birthdate.day > 31) or
       (inputvalue.birthdate.month < 1) or (inputvalue.birthdate.month > 12) or
       (inputvalue.birthdate.year < 1900) or (inputvalue.birthdate.year > 2100) then
    begin
        writeln('! Input Tidak Valid: Tanggal, Bulan, atau Tahun tidak sesuai!');
        BirthdateInput;
        exit;
    end;

    JurusanInput;
end;

procedure JurusanInput;
var
    hasNumber: boolean;
    i: integer;
begin
    write('Jurusan (Max 30): ');
    readln(inputvalue.userJurusan);

    if (Length(inputvalue.userJurusan) <= 0) or (Length(inputvalue.userJurusan) > 30) then
    begin
        writeln('! Input Tidak Valid !');
        JurusanInput;
        exit;
    end;

    hasNumber := False;
    for i := 1 to Length(inputvalue.userJurusan) do
    begin
        if inputvalue.userJurusan[i] in ['0'..'9'] then
        begin
            hasNumber := True;
            break;
        end;
    end;

    if hasNumber then
    begin
        writeln('! Input Tidak Valid: Jurusan tidak boleh mengandung angka!');
        JurusanInput;
        exit;
    end;

    while Length(inputvalue.userJurusan) < 30 do
        inputvalue.userJurusan := inputvalue.userJurusan + ' ';

    ProdiInput;
end;

procedure ProdiInput;
var
    hasNumber: boolean;
    i: integer;
begin
    write('Prodi (Max 30): ');
    readln(inputvalue.userProdi);

    if (Length(inputvalue.userProdi) <= 0) or (Length(inputvalue.userProdi) > 30) then
    begin
        writeln('! Input Tidak Valid !');
        ProdiInput;
        exit;
    end;

    hasNumber := False;
    for i := 1 to Length(inputvalue.userProdi) do
    begin
        if inputvalue.userProdi[i] in ['0'..'9'] then
        begin
            hasNumber := True;
            break;
        end;
    end;

    if hasNumber then
    begin
        writeln('! Input Tidak Valid: Prodi tidak boleh mengandung angka!');
        ProdiInput;
        exit;
    end;

    while Length(inputvalue.userProdi) < 30 do
        inputvalue.userProdi := inputvalue.userProdi + ' ';

    GenderInput;
end;

procedure GenderInput;
begin
    write('Jenis Kelamin (L / P): ');
    readln(inputvalue.usergender);
    if (Length(inputvalue.usergender) <> 1) or ((inputvalue.usergender <> 'L') and (inputvalue.usergender <> 'P')) then
    begin
        writeln('! Input Tidak Valid !');
        GenderInput;
        exit;
    end;

    inputvalue.userindex := inputvalue.userindex + 1;
    recordvalue.database[inputvalue.userindex] := Concat('| ', IntToStr(inputvalue.userindex), ' | ', inputvalue.username,
        ' | ', IntToStr(inputvalue.birthdate.day), '/', IntToStr(inputvalue.birthdate.month), '/', IntToStr(inputvalue.birthdate.year),
        ' | ', inputvalue.usernim, ' | ', inputvalue.userJurusan, ' | ', inputvalue.userProdi, ' | ', inputvalue.usergender, ' |');
    Replay;
end;

procedure Replay;
begin
    write('Apakah Anda Ingin Mengisi Form Lagi? (Y / N): ');
    readln(inputvalue.userchoice);
    if (Length(inputvalue.userchoice) <> 1) or ((inputvalue.userchoice <> 'Y') and (inputvalue.userchoice <> 'N')) then
    begin
        writeln('! Input Tidak Valid !');
        Replay;
        exit;
    end;

    if inputvalue.userchoice = 'Y' then
        NameInput
    else
        PrintDatabase;
end;


procedure PrintDatabase;
var
    i, posX, posY, directionX, directionY: integer;
    showTitle: boolean;
begin
    clrscr;

    // Variabel untuk animasi judul
    posX := 1;           // Posisi awal teks (kolom)
    posY := 1;           // Posisi awal teks (baris)
    directionX := 1;     // Arah gerakan horizontal: 1 ke kanan, -1 ke kiri
    directionY := 0;     // Arah gerakan vertikal: 1 ke bawah, -1 ke atas
    showTitle := True;   // Status tampil judul

    while True do
    begin
        // Bersihkan seluruh layar untuk mencegah bekas teks
        clrscr;

        // Tampilkan judul animasi di posisi baru
        gotoxy(posX, posY);
        write('DAFTAR MAHASISWA TI-1B');

        // Tampilkan tanggal di bawah judul tabel
        gotoxy(25, 2);
        write('Hari ini: ', date, '/', hari, '/', bulan, '/', tahun);

        // Perbarui posisi teks judul
        posX := posX + directionX;
        posY := posY + directionY;

        // Periksa batas layar untuk mengubah arah gerakan
        if (posX = 1) and (posY = 1) then
        begin
            directionX := 1; 
            directionY := 0; // Gerak ke kanan
        end
        else if (posX = 185 - Length('DAFTAR MAHASISWA TI-1B')) and (posY = 1) then
        begin
            directionX := 0; 
            directionY := 1; // Gerak ke bawah
        end
        else if (posX = 185 - Length('DAFTAR MAHASISWA TI-1B')) and (posY = 5 + inputvalue.userindex) then
        begin
            directionX := -1; 
            directionY := 0; // Gerak ke kiri
        end
        else if (posX = 1) and (posY = 5 + inputvalue.userindex) then
        begin
            directionX := 0; 
            directionY := -1; // Gerak ke atas
        end;

        // Tampilkan judul tabel tetap
        gotoxy(1, 4); // Posisi awal judul tabel
        if showTitle then
        begin
            TextColor(white); // Warna teks tabel
            gotoxy(25, 3);
            writeln('|No |Nama Mahasiswa                  |Tanggal    |NIM           |Jurusan                         |Prodi                           |JK |');
        end;

        // Tampilkan isi tabel
        for i := 1 to inputvalue.userindex do
        begin
            gotoxy(25, 3 + i); // Baris berikutnya untuk setiap data mahasiswa
            writeln(recordvalue.database[i]);
        end;

        // Tunggu sejenak sebelum iterasi berikutnya
        Delay(100); // Delay sedikit lebih lama untuk animasi yang halus

        // Ganti status tampil/hilang untuk judul tabel
        showTitle := not showTitle;

        // Cek input untuk keluar dari loop animasi
        if KeyPressed then
        begin
            if ReadKey = #27 then // Tekan ESC untuk keluar
                exit;
        end;
    end;
end;





begin
    inputvalue.userindex := 0;
    GetCurrentDate;
    PrintDayOfWeek;
    NameInput;
end.
