/*
  Warnings:

  - The primary key for the `mahasiswa` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- DropForeignKey
ALTER TABLE `pinjambuku` DROP FOREIGN KEY `PinjamBuku_MhsId_fkey`;

-- DropIndex
DROP INDEX `PinjamBuku_MhsId_fkey` ON `pinjambuku`;

-- AlterTable
ALTER TABLE `mahasiswa` DROP PRIMARY KEY,
    MODIFY `nim` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`nim`);

-- AlterTable
ALTER TABLE `pinjambuku` MODIFY `MhsId` VARCHAR(191) NOT NULL;

-- AddForeignKey
ALTER TABLE `PinjamBuku` ADD CONSTRAINT `PinjamBuku_MhsId_fkey` FOREIGN KEY (`MhsId`) REFERENCES `Mahasiswa`(`nim`) ON DELETE RESTRICT ON UPDATE CASCADE;
