# AM-TICKETS: ON-CHAIN AUDIT SYSTEM

## 🎫 Sistem Penjualan Tiket Berbasis Blockchain dengan Validasi Keamanan Terdistribusi

<div align="center">

![Build Status](https://img.shields.io/badge/build-passing-brightgreen?style=flat-square)
![License](https://img.shields.io/badge/license-MIT-blue?style=flat-square)
![Solidity](https://img.shields.io/badge/solidity-v0.8.0+-red?style=flat-square)
![Web3](https://img.shields.io/badge/web3-ethers.js_v6-purple?style=flat-square)
![Network](https://img.shields.io/badge/network-sepolia_testnet-orange?style=flat-square)
![Status](https://img.shields.io/badge/status-active-success?style=flat-square)

**Solusi blockchain untuk mencegah pemalsuan tiket dan calo digital melalui mekanisme on-chain verification yang transparan dan terdesentralisasi.**

[Lihat Live Demo](#panduan-instalasi-lokal) • [Smart Contract](#informasi-smart-contract) • [Dokumentasi Teknis](#arsitektur-sistem)

</div>

---

## 📋 Daftar Isi

- [Tentang Proyek](#tentang-proyek)
- [Masalah & Solusi](#masalah--solusi)
- [Fitur Utama](#fitur-utama)
- [Fitur Keamanan Data](#fitur-keamanan-data)
- [Arsitektur Sistem](#arsitektur-sistem)
- [Teknologi yang Digunakan](#teknologi-yang-digunakan)
- [Informasi Smart Contract](#informasi-smart-contract)
- [Panduan Instalasi Lokal](#panduan-instalasi-lokal)
- [Panduan Penggunaan](#panduan-penggunaan)
- [Konsep Keamanan Implementasi](#konsep-keamanan-implementasi)
- [Anggota Tim](#anggota-tim)
- [Lisensi](#lisensi)

---

## 🎯 Tentang Proyek

**AM-TICKETS** adalah aplikasi desentralisasi (dApp) yang mensimulasikan sistem penjualan tiket konser **Arctic Monkeys World Tour 2026** berbasis teknologi blockchain Ethereum. Proyek ini dibangun sebagai **Tugas Akhir (UAS)** untuk mata kuliah **Keamanan Data dan Informasi** di bawah bimbingan **Pak Made Adi**.

Aplikasi ini mendemonstrasikan implementasi praktis dari konsep-konsep keamanan modern dalam konteks Web3, termasuk:

- **Smart Contract Security**: Verifikasi dan validasi transaksi on-chain
- **Role-Based Access Control (RBAC)**: Manajemen hak akses berbasis peran
- **Double-Spending Prevention**: Mekanisme ownership transfer yang aman
- **Audit Trail**: Pencatatan transaksi yang immutable di blockchain

---

## 🚨 Masalah & Solusi

### Masalah Industri Tiket Digital

| Masalah                           | Dampak                              | Solusi AM-TICKETS                                                                                  |
| --------------------------------- | ----------------------------------- | -------------------------------------------------------------------------------------------------- |
| 🎟️ **Calo Digital & Scalper**     | Harga tiket melonjak 3-5x lipat     | Pembatasan maksimal tiket per wallet + tracking ownership on-chain                                 |
| 🔄 **Pemalsuan Tiket**            | Tiket ganda atau palsu beredar      | Blockchain sebagai single source of truth; setiap token adalah unik dan terdaftar di ledger publik |
| 👻 **Double-Spending**            | Satu tiket digunakan berkali-kali   | Smart contract memastikan transfer ownership atomik; pemilik lama otomatis kehilangan akses        |
| 🔐 **Kerentanan Sistem Terpusat** | Database rentan terhadap manipulasi | Desentralisasi penuh: tidak ada single point of failure; validasi didistribusikan ke jaringan      |
| 👤 **Akses Tidak Terbatas**       | Siapa saja bisa memvalidasi tiket   | RBAC strict: hanya promotor/admin authorized untuk mark tiket sebagai "used"                       |

---

## ⭐ Fitur Utama

### 1️⃣ **Akuisisi Tiket (Minting)**

- Pembelian tiket on-chain dengan harga **0.01 Sepolia ETH** per tiket
- Integrasi metamask untuk transaksi yang seamless
- Pembatasan ketat: maksimal **5 tiket per wallet** untuk mencegah calo
- Validasi saldo dan allowance sebelum transaksi

### 2️⃣ **Sirkulasi Tiket (Transfer Ownership)**

- Transfer hak milik tiket dengan aman antar wallet
- Implementasi atomic swap: pemilik lama secara otomatis kehilangan akses
- Prevent double-spending melalui state management di blockchain
- Historical tracking: setiap transfer tercatat di on-chain events

### 3️⃣ **Konsumsi Tiket (Gatekeeper Validation)**

- Role-Based Access Control (RBAC) yang ketat
- Hanya **dompet promotor/admin authorized** yang dapat mark tiket sebagai "used"
- UI/UX akan **blur dan dikunci** (gembok visual) jika pengguna login sebagai penonton biasa
- Validasi real-time sebelum checkpoint masuk venue

---

## 🔐 Fitur Keamanan Data

Proyek ini mengimplementasikan prinsip-prinsip keamanan data fundamental dalam konteks blockchain:

### A. **Access Control & Authentication**

```
✓ Metamask Wallet Authentication
  → Verifikasi identitas pengguna melalui digital signature
  → Setiap address adalah unique identifier dalam sistem

✓ Role-Based Access Control (RBAC)
  → Dua role utama: Promotor/Admin (privileged) & Attendee (basic)
  → Smart contract enforces permission checks di setiap function
  → Frontend mencegah akses UI untuk role yang tidak berwenang
```

### B. **Data Integrity & Immutability**

```
✓ Blockchain Ledger
  → Setiap tiket (token) adalah NFT dengan metadata immutable
  → Hash kriptografi mencegah modifikasi data historis
  → Consensus mechanism menjamin agreement distributed

✓ State Verification
  → Smart contract memverifikasi state sebelum state transition
  → Prevent invalid operations: transfer tiket "used" diblokir
```

### C. **Confidentiality & Transaction Privacy**

```
✓ Encrypted Wallet Connection
  → Metamask menghandle key management secara aman
  → Private key tidak pernah exposed ke aplikasi frontend

✓ Sepolia Testnet Isolation
  → Testing environment yang terpisah dari mainnet
  → Mencegah ancaman production melalui sandbox environment
```

### D. **Availability & Resilience**

```
✓ Decentralized Infrastructure
  → Tidak ada single point of failure
  → Jaringan Ethereum Sepolia memiliki ribuan validator
  → Smart contract berjalan pada setiap node secara independen
```

### E. **Audit & Non-Repudiation**

```
✓ On-Chain Audit Trail
  → Setiap transaksi (Mint, Transfer, Validation) tercatat di blockchain
  → Event logs yang immutable: Transfer(from, to, tokenId), UsedTicket(tokenId)
  → Tidak bisa deny action yang sudah tercatat: cryptographic proof
```

---

## 🏗️ Arsitektur Sistem

```
┌─────────────────────────────────────────────────────────────────┐
│                        USER INTERFACE                           │
│              (HTML5 + Vanilla JS + Tailwind CSS)                │
├─────────────────────────────────────────────────────────────────┤
│  [Minting UI]  │  [Transfer UI]  │  [Validation UI]             │
│  [Wallet]      │  [History]      │  [Dashboard]                 │
└────────────────────────┬────────────────────────────────────────┘
                         │
         ┌───────────────┼───────────────┐
         │               │               │
    [Ethers.js v6 Library]              │
    • Contract Interaction              │
    • Wallet Management           [Metamask]
    • Event Listening            • Signing Txs
    • State Queries              • Key Storage
         │               │               │
         └───────────────┼───────────────┘
                         │
         ┌───────────────▼───────────────┐
         │   SMART CONTRACT LAYER       │
         │  (Solidity - Sepolia Testnet)│
         ├─────────────────────────────┤
         │ ✓ Minting Logic             │
         │ ✓ Transfer Logic            │
         │ ✓ RBAC Enforcement          │
         │ ✓ State Management          │
         │ ✓ Event Emission            │
         └─────────────────────────────┘
                         │
         ┌───────────────▼───────────────┐
         │  BLOCKCHAIN LAYER            │
         │  (Ethereum Sepolia Testnet)  │
         ├─────────────────────────────┤
         │ • Consensus (PoS)           │
         │ • Validator Network         │
         │ • Immutable Ledger          │
         │ • State Root Hashing        │
         └─────────────────────────────┘
```

### Data Flow Diagram

```
User Action → Metamask Sign → Smart Contract Execution → Blockchain Recording
    ↓           ↓                    ↓                          ↓
[Minting]   [Signature]      [Access Control]          [Immutable State]
[Transfer]  [Validation]     [State Verification]      [Event Logs]
[Validate]  [Private Key     [Business Logic]          [Distributed
            Protected]       [Emit Events]              Consensus]
```

---

## 🛠️ Teknologi yang Digunakan

### Backend & Smart Contract

| Teknologi        | Versi   | Fungsi                                     |
| ---------------- | ------- | ------------------------------------------ |
| **Solidity**     | v0.8.0+ | Bahasa pemrograman smart contract          |
| **OpenZeppelin** | Latest  | Library standar industri untuk ERC-721 NFT |
| **Remix IDE**    | Online  | Development & deployment environment       |

### Frontend & Web3

| Teknologi              | Versi    | Fungsi                                  |
| ---------------------- | -------- | --------------------------------------- |
| **HTML5**              | Latest   | Struktur & semantik halaman             |
| **Vanilla JavaScript** | ES6+     | Logika aplikasi & DOM manipulation      |
| **Tailwind CSS**       | v3 (CDN) | Styling & responsive design             |
| **Ethers.js**          | v6       | Web3 library untuk contract interaction |
| **Metamask**           | Latest   | Wallet & authentication provider        |

### Infrastructure & Deployment

| Komponen               | Provider                 | Catatan                                      |
| ---------------------- | ------------------------ | -------------------------------------------- |
| **Blockchain Network** | Ethereum Sepolia Testnet | Public testnet untuk development & QA        |
| **Frontend Hosting**   | Vercel                   | Deployment otomatis dari GitHub              |
| **RPC Endpoint**       | Infura/Alchemy           | Node provider untuk blockchain communication |

---

## 📦 Informasi Smart Contract

### Deployment Details

```
Network:        Ethereum Sepolia Testnet
Contract Type:  ERC-721 NFT (Non-Fungible Token)
Status:         ✅ Deployed & Verified

Contract Address:
┌──────────────────────────────────────────────────┐
│ 0x6C339FfEcbc9C011bB8d08796FE7Fd146812D9B5     │
└──────────────────────────────────────────────────┘
```

### Verifikasi Contract di Blockchain Explorer

Untuk melihat kode, transaksi, dan state contract:

- **Sepolia Etherscan**: [Verifikasi Manual](https://sepolia.etherscan.io/address/0x6C339FfEcbc9C011bB8d08796FE7Fd146812D9B5)
- Filter: `Sepolia Testnet` → Copy-paste address di atas

### Fitur Smart Contract

```solidity
// Core Functions:
• mint(quantity)              → Beli tiket (0.01 ETH each, max 5/wallet)
• transferTicket(to, tokenId) → Transfer ownership dengan atomic guarantee
• markTicketAsUsed(tokenId)   → Mark tiket sebagai "used" (Admin only)
• isTicketUsed(tokenId)       → Query status penggunaan tiket
• getOwnerTickets(address)    → List semua tiket milik address
• setAdminRole(address)       → Assign admin/promotor role

// View Functions:
• balanceOf(address)          → Jumlah tiket yang dimiliki
• ownerOf(tokenId)            → Pemilik suatu token
• totalSupply()               → Total tiket terjual
• isAdmin(address)            → Check apakah address adalah admin

// Events (Audit Trail):
• Transfer(from, to, tokenId)
• TicketUsed(tokenId, timestamp)
• AdminRoleGranted(address)
```

### ABI Interface

Smart contract mengimplement standar ERC-721 dengan extension custom:

```json
{
  "name": "AMTickets",
  "symbol": "AMTKT",
  "baseURI": "ipfs://...",
  "maxTicketsPerWallet": 5,
  "ticketPrice": "0.01"
}
```

---

## 🚀 Panduan Instalasi Lokal

### Prerequisite

- Node.js v16+ atau lebih baru
- Metamask extension terinstall di browser
- Akses ke Sepolia Testnet (Metamask → Networks → Sepolia)
- Sepolia ETH test token (dapatkan dari [faucet](https://sepolia-faucet.pk910.de/))

### Step 1: Clone Repository

```bash
git clone https://github.com/your-repo/am-tickets.git
cd am-tickets
```

### Step 2: Setup Local Web Server

Pilih salah satu metode:

#### **Opsi A: Python (Recommended)**

```bash
# Python 3.x
python -m http.server 8000

# Atau Python 2.x
python -m SimpleHTTPServer 8000
```

#### **Opsi B: Node.js (http-server))**

```bash
npm install -g http-server
http-server -p 8000
```

#### **Opsi C: VS Code Live Server Extension**

```bash
1. Install extension "Live Server" (Five Server)
2. Klik kanan index.html → Open with Live Server
3. Browser otomatis buka http://localhost:5500
```

### Step 3: Akses Aplikasi

```
Local URL: http://localhost:8000
            (atau port sesuai tool yang digunakan)
```

### Step 4: Konfigurasi Metamask

1. Buka Metamask extension
2. Switch network ke **Sepolia Testnet**
3. Pastikan akun Anda memiliki **Sepolia ETH** test token
4. Refresh halaman aplikasi

### Step 5: Mulai Menggunakan

```
✓ Connect wallet dengan tombol "Connect Wallet"
✓ Pilih role: Penonton atau Promotor
✓ Beli tiket, transfer, atau validasi sesuai role
```

### Troubleshooting

| Masalah                      | Solusi                                               |
| ---------------------------- | ---------------------------------------------------- |
| "Cannot find local resource" | Pastikan running live server di root directory       |
| Metamask tidak terdeteksi    | Refresh browser, pastikan extension aktif            |
| Contract tidak merespond     | Cek Metamask terhubung ke Sepolia testnet            |
| Transaksi gagal              | Pastikan saldo Sepolia ETH cukup & gas price memadai |

---

## 📖 Panduan Penggunaan

### Untuk Penonton (Attendee)

```
1. Connect Wallet via Metamask
2. Pilih role "Attendee"
3. Browse tiket yang tersedia
4. Click "Beli Tiket" (harga: 0.01 Sepolia ETH)
5. Confirm transaksi di Metamask
6. Tunggu konfirmasi (~15 detik)
7. Tiket muncul di "My Tickets" dashboard
8. Saat checkpoint: tunjukkan QR code tiket
```

### Untuk Promotor/Admin

```
1. Connect wallet yang sudah di-assign sebagai Admin
2. Pilih role "Promotor"
3. Akses dashboard khusus promotor
4. Lihat daftar semua tiket yang sudah dijual
5. Scan QR code atau input Token ID untuk validasi
6. Click "Validate Ticket" untuk mark tiket sebagai "used"
7. Sistem akan mencatat waktu validasi di blockchain
```

---

## 🔒 Konsep Keamanan Implementasi

### 1. Mencegah Calo (Anti-Scalping)

```javascript
// Smart Contract Logic:
require(balanceOf(msg.sender) + quantity <= MAX_TICKETS_PER_WALLET);
// Penonton hanya bisa beli max 5 tiket dalam 1 wallet
// Calo harus buat multiple wallets (biaya gas tinggi, tidak profitable)
```

### 2. Mencegah Double-Spending

```javascript
// Smart Contract State Management:
mapping(uint256 => bool) public isUsed;

function markAsUsed(uint256 tokenId) public onlyAdmin {
    require(!isUsed[tokenId], "Ticket already used");
    require(ownerOf(tokenId) != address(0), "Invalid ticket");

    isUsed[tokenId] = true;
    emit TicketUsed(tokenId, block.timestamp);
}
// Atomic state change: tidak bisa ada race condition
```

### 3. Role-Based Access Control (RBAC)

```javascript
// Smart Contract Access Control:
mapping(address => bool) public admins;

modifier onlyAdmin() {
    require(admins[msg.sender], "Only admin can call");
    _;
}

function setAdmin(address addr) public onlyOwner {
    admins[addr] = true;
    emit AdminRoleGranted(addr);
}

// Frontend enforcement:
if (userRole === "attendee") {
    validationUI.classList.add("blur-md", "pointer-events-none");
    validationBtn.disabled = true;
}
```

### 4. Immutable Audit Trail

```javascript
// Setiap action tercatat di blockchain:
event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);
event TicketUsed(uint256 indexed tokenId, uint256 timestamp);

// Query historis:
// - Siapa pemilik ticket di waktu X?
// - Kapan ticket divalidasi?
// - Berapa kali transfer terjadi?
// → Semua bisa diverifikasi dari blockchain history
```

### 5. Kriptografi & Digital Signature

```
Metamask signing process:
1. User approve action di browser
2. Private key + message di-hash
3. Digital signature created (Metamask saja yang punya private key)
4. Signature dikirim ke smart contract
5. Contract verify signature = confirm pengguna yang authorized action
```

---

## 👥 Anggota Tim

| No  | Nama             | NIM   | Peran                  | Kontribusi                                |
| --- | ---------------- | ----- | ---------------------- | ----------------------------------------- |
| 1   | [Nama Ketua Tim] | [NIM] | **Lead Developer**     | Architecture, Smart Contract, Integration |
| 2   | [Nama Anggota 2] | [NIM] | **Frontend Developer** | UI/UX, JavaScript Logic, Styling          |
| 3   | [Nama Anggota 3] | [NIM] | **Security Engineer**  | Smart Contract Audit, Testing             |
| 4   | [Nama Anggota 4] | [NIM] | **DevOps**             | Deployment, Network Configuration         |

**Dosen Pengampu**: Pak Made Adi  
**Mata Kuliah**: Keamanan Data dan Informasi  
**Tahun Akademik**: 2025/2026

---

## 📚 Referensi & Resources

### Dokumentasi Resmi

- [Ethereum Smart Contracts](https://ethereum.org/developers)
- [Solidity Documentation](https://docs.soliditylang.org)
- [OpenZeppelin ERC-721](https://docs.openzeppelin.com/contracts/4.x/erc721)
- [Ethers.js v6 Guide](https://docs.ethers.org/v6/)
- [Metamask Developer](https://docs.metamask.io)

### Sepolia Testnet

- [Faucet (Free Test ETH)](https://sepolia-faucet.pk910.de)
- [Block Explorer](https://sepolia.etherscan.io)
- [Network Status](https://ethstats.net)

### Security Resources

- [Smart Contract Security Best Practices](https://consensys.net/smart-contract-best-practices/)
- [OWASP Smart Contract Top 10](https://owasp.org/www-project-smart-contract-top-10/)
- [Reentrancy & Common Vulnerabilities](https://swcregistry.io)

---

## 📄 Lisensi

Proyek ini dilisensikan di bawah **MIT License**.

```
MIT License

Copyright (c) 2026 AM-Tickets Team

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.

See LICENSE file for full details.
```

---

## 📮 Support & Feedback

Untuk pertanyaan, issue, atau saran:

- 📧 **Email**: [your-email@university.ac.id]
- 🐛 **Report Bug**: [GitHub Issues](https://github.com/your-repo/am-tickets/issues)
- 💬 **Discussion**: [GitHub Discussions](https://github.com/your-repo/am-tickets/discussions)

---

<div align="center">

### Made with 🔐 Security & 💙 Blockchain Love

**AM-TICKETS | Secure On-Chain Ticket Ecosystem for Arctic Monkeys World Tour 2026**

[⬆ Kembali ke Atas](#am-tickets-on-chain-audit-system)

</div>
