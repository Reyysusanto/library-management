-- CreateTable
CREATE TABLE `Mahasiswa` (
    `nim` INTEGER NOT NULL AUTO_INCREMENT,
    `nama` VARCHAR(60) NOT NULL,
    `email` VARCHAR(70) NOT NULL,
    `password` VARCHAR(50) NOT NULL,

    PRIMARY KEY (`nim`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Buku` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `judul` VARCHAR(100) NOT NULL,
    `penulis` VARCHAR(50) NOT NULL,
    `isbn` VARCHAR(13) NOT NULL,
    `status` ENUM('available', 'borrowed') NOT NULL DEFAULT 'available',

    UNIQUE INDEX `Buku_isbn_key`(`isbn`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `PinjamBuku` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `MhsId` INTEGER NOT NULL,
    `BukuId` INTEGER NOT NULL,
    `borrowedAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `returnAt` DATETIME(3) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `PinjamBuku` ADD CONSTRAINT `PinjamBuku_MhsId_fkey` FOREIGN KEY (`MhsId`) REFERENCES `Mahasiswa`(`nim`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PinjamBuku` ADD CONSTRAINT `PinjamBuku_BukuId_fkey` FOREIGN KEY (`BukuId`) REFERENCES `Buku`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
