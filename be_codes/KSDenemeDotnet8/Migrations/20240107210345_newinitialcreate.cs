﻿using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace KSDenemeDotnet8.Migrations
{
    /// <inheritdoc />
    public partial class newinitialcreate : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<decimal>(
                name: "sayfaSayısı",
                table: "Books",
                type: "numeric",
                nullable: false,
                defaultValue: 0m);

            migrationBuilder.AddColumn<string>(
                name: "yazar",
                table: "Books",
                type: "text",
                nullable: false,
                defaultValue: "");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "sayfaSayısı",
                table: "Books");

            migrationBuilder.DropColumn(
                name: "yazar",
                table: "Books");
        }
    }
}
