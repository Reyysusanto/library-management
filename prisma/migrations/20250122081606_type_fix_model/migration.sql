/*
  Warnings:

  - The primary key for the `mahasiswa` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to alter the column `nim` on the `mahasiswa` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Char(9)`.
  - You are about to alter the column `MhsId` on the `pinjambuku` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Char(9)`.

*/
-- DropForeignKey
ALTER TABLE `pinjambuku` DROP FOREIGN KEY `PinjamBuku_MhsId_fkey`;

-- DropIndex
DROP INDEX `PinjamBuku_MhsId_fkey` ON `pinjambuku`;

-- AlterTable
ALTER TABLE `mahasiswa` DROP PRIMARY KEY,
    MODIFY `nim` CHAR(9) NOT NULL,
    ADD PRIMARY KEY (`nim`);

-- AlterTable
ALTER TABLE `pinjambuku` MODIFY `MhsId` CHAR(9) NOT NULL;

-- AddForeignKey
ALTER TABLE `PinjamBuku` ADD CONSTRAINT `PinjamBuku_MhsId_fkey` FOREIGN KEY (`MhsId`) REFERENCES `Mahasiswa`(`nim`) ON DELETE RESTRICT ON UPDATE CASCADE;
