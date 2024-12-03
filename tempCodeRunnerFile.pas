    // Periksa batas layar untuk mengubah arah gerakan
    if (posX = 1) and (posY = 1) then
    begin
        directionX := 1; 
        directionY := 0; // Gerak ke kanan
    end
    else if (posX = 170 - Length('DAFTAR MAHASISWA TI-1B')) and (posY = 1) then
    begin
        directionX := 0; 
        directionY := 1; // Gerak ke bawah
    end
    else if (posX = 170 - Length('DAFTAR MAHASISWA TI-1B')) and (posY = 5 + inputvalue.userindex) then
    begin
        directionX := -1; 
        directionY := 0; // Gerak ke kiri
    end
    else if (posX = 1) and (posY = 5 + inputvalue.userindex) then
    begin
        directionX := 0; 
        directionY := -1; // Gerak ke atas
    end;