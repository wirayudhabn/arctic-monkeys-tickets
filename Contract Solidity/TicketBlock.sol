// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract TicketBlock {
    address public admin;
    uint256 public ticketPrice = 0.01 ether; // Simulasi harga dengan Sepolia ETH
    uint256 public maxTickets = 50;
    uint256 public totalSold = 0;

    struct Ticket {
        uint256 id;
        address owner;
        bool isUsed;
    }

    mapping(uint256 => Ticket) public tickets;
    mapping(address => bool) public hasPurchased; // Batasan 1 akun = 1 tiket (Anti-Calo)

    // Pengaman Kontrol Akses: Hanya komputer Admin yang boleh membuka fungsi tertentu
    modifier onlyAdmin() {
        require(msg.sender == admin, "Akses ditolak: Anda bukan Admin resmi!");
        _;
    }

    constructor() {
        admin = msg.sender; // Siapa yang deploy otomatis jadi Promotor/Admin
    }

    // 1. VERIFIKASI AWAL: Admin ke Pembeli Pertama
    function buyTicket() public payable {
        require(totalSold < maxTickets, "Tiket sudah habis!");
        require(!hasPurchased[msg.sender], "Anda sudah memiliki tiket!");
        require(msg.value == ticketPrice, "Jumlah ETH tidak sesuai harga tiket!");

        totalSold++;
        tickets[totalSold] = Ticket({
            id: totalSold,
            owner: msg.sender,
            isUsed: false
        });
        hasPurchased[msg.sender] = true;
    }

    // 2. VERIFIKASI TENGAH: Transfer Kepemilikan (Solusi dari Dosen)
    function transferTicket(uint256 _ticketId, address _to) public {
        require(tickets[_ticketId].owner == msg.sender, "Anda bukan pemilik sah tiket ini!");
        require(!tickets[_ticketId].isUsed, "Tiket sudah hangus/terpakai!");
        require(_to != address(0), "Alamat MetaMask tujuan tidak valid!");
        require(!hasPurchased[_to], "Penerima sudah memiliki tiket konser lain!");

        // Eksekusi perpindahan data kepemilikan secara permanen
        tickets[_ticketId].owner = _to;
        hasPurchased[msg.sender] = false; // Pemilik lama kehilangan hak akses
        hasPurchased[_to] = true;         // Pembeli baru mendapatkan hak akses
    }

    // 3. VERIFIKASI AKHIR: Gerbang Pintu Masuk Konser
    function validateTicket(uint256 _ticketId) public onlyAdmin {
        require(_ticketId > 0 && _ticketId <= totalSold, "Tiket tidak terdaftar!");
        require(!tickets[_ticketId].isUsed, "Peringatan: Tiket ini sudah pernah dipakai!");

        tickets[_ticketId].isUsed = true; // Status terkunci, tidak bisa dipakai replay attack
    }
}