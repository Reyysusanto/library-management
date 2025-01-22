/*
  Warnings:

  - You are about to drop the `pinjambuku` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `pinjambuku` DROP FOREIGN KEY `PinjamBuku_BukuId_fkey`;

-- DropForeignKey
ALTER TABLE `pinjambuku` DROP FOREIGN KEY `PinjamBuku_MhsId_fkey`;

-- AlterTable
ALTER TABLE `mahasiswa` ADD COLUMN `token` VARCHAR(100) NULL;

-- DropTable
DROP TABLE `pinjambuku`;

-- CreateTable
CREATE TABLE `pinjam` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `MhsId` CHAR(9) NOT NULL,
    `BukuId` INTEGER NOT NULL,
    `borrowedAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `returnAt` DATETIME(3) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `pinjam` ADD CONSTRAINT `pinjam_MhsId_fkey` FOREIGN KEY (`MhsId`) REFERENCES `mahasiswa`(`nim`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `pinjam` ADD CONSTRAINT `pinjam_BukuId_fkey` FOREIGN KEY (`BukuId`) REFERENCES `buku`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- RenameIndex
ALTER TABLE `buku` RENAME INDEX `Buku_isbn_key` TO `buku_isbn_key`;
