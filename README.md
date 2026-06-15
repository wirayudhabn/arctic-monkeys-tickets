# AM-Tickets: On-Chain Ticketing System

![Build Status](https://img.shields.io/badge/build-passing-brightgreen?style=flat-square)
![License](https://img.shields.io/badge/license-MIT-blue?style=flat-square)
![Solidity](https://img.shields.io/badge/solidity-v0.8.0+-ff69b4?style=flat-square)

A blockchain-based ticketing system for Arctic Monkeys World Tour 2026, leveraging Ethereum smart contracts to prevent ticket fraud and scalping through on-chain verification and immutable audit trails.

---

## 🎯 Key Features & Security

### Core Functionality
| Feature | Description |
|---------|-------------|
| **🎫 Minting** | Purchase tickets on-chain for 0.01 Sepolia ETH with per-wallet limits (max 5 tickets) to prevent scalping |
| **🔄 Transfer** | Secure ticket ownership transfer with atomic state management; prevents double-spending |
| **✅ Gatekeeper Validation** | Admin-only ticket validation; Role-Based Access Control (RBAC) enforces strict permissions |

### Security Implementation
| Aspect | Mechanism |
|--------|-----------|
| **Access Control** | Metamask wallet authentication + RBAC for promoter/attendee roles |
| **Double-Spending Prevention** | Atomic smart contract state transitions; immutable blockchain ledger |
| **Anti-Scalping** | Hard-coded limit (5 tickets/wallet) enforced at contract level |
| **Audit Trail** | All transactions recorded on-chain; cryptographic proof prevents denial of action |
| **Data Integrity** | ERC-721 NFT standard ensures unique token ownership with keccak256 hashing |

---

## 🛠️ Tech Stack

| Layer | Technology | Purpose |
|-------|-----------|---------|
| **Blockchain** | Ethereum Sepolia Testnet | Distributed ledger & consensus |
| **Smart Contract** | Solidity v0.8.0+ | ERC-721 NFT contract logic |
| **Frontend** | HTML5, Vanilla JS (ES6+) | User interface & interactions |
| **Styling** | Tailwind CSS (CDN) | Responsive design |
| **Web3 Integration** | Ethers.js v6 | Contract interaction & wallet management |
| **Wallet** | Metamask | Digital signature & transaction signing |
| **Deployment** | Vercel (Frontend), Remix IDE (Contract) | Production & development environments |

---

## 📦 Smart Contract

### Deployment Information
```
Network:        Ethereum Sepolia Testnet
Contract Type:  ERC-721 (Non-Fungible Token)
Address:        0x6C339FfEcbc9C011bB8d08796FE7Fd146812D9B5
Status:         ✅ Active & Verified
```

### Verify & Interact
- **Block Explorer**: [Sepolia Etherscan](https://sepolia.etherscan.io/address/0x6C339FfEcbc9C011bB8d08796FE7Fd146812D9B5)
- View transactions, state, and contract code directly on-chain
- Use Read/Write tabs for direct smart contract interaction

### Core Functions
```solidity
mint(uint256 quantity)                    // Purchase tickets (0.01 ETH each)
transferTicket(address to, uint256 id)    // Transfer ownership
markTicketAsUsed(uint256 id)              // Validate ticket (Admin only)
isTicketUsed(uint256 id)                  // Check if ticket consumed
ownerOf(uint256 id)                       // Query ticket owner
```

---

## 🚀 Getting Started

### Prerequisites
- **Browser**: Chrome, Firefox, or Brave with Metamask extension
- **Metamask**: Installed and connected to Sepolia Testnet
- **Test ETH**: Obtain from [Sepolia Faucet](https://sepolia-faucet.pk910.de/)
- **Local Server**: Python 3, Node.js, or VS Code Live Server

### Installation & Setup

#### 1. Clone Repository
```bash
git clone https://github.com/your-username/am-tickets.git
cd am-tickets
```

#### 2. Start Local Server

**Option A: Python (Recommended)**
```bash
python -m http.server 8000
```

**Option B: Node.js**
```bash
npx http-server -p 8000
```

**Option C: VS Code Live Server**
- Right-click `index.html` → "Open with Live Server"
- Browser opens automatically at `http://localhost:5500`

#### 3. Configure Metamask
1. Open Metamask extension
2. Switch network to **Sepolia Testnet**
3. Ensure your account has **Sepolia ETH** for gas fees
4. Return to application and click "Connect Wallet"

#### 4. Start Using
- **Attendee**: Browse and purchase tickets
- **Promoter**: Access validation dashboard to mark tickets as used

### Troubleshooting
| Issue | Solution |
|-------|----------|
| Metamask not detected | Refresh browser; ensure extension is enabled |
| Contract unresponsive | Verify Metamask is connected to Sepolia testnet |
| Transaction fails | Check Sepolia ETH balance and gas limit |
| "Cannot find local resource" | Verify live server running in project root directory |

---

## 

**Course**: Keamanan Data dan Informasi  
**Instructor**: Pak Made Adi  
**Academic Year**: 2025/2026

---

## 📚 Resources

- [Ethereum Documentation](https://ethereum.org/developers)
- [Solidity Docs](https://docs.soliditylang.org)
- [OpenZeppelin ERC-721](https://docs.openzeppelin.com/contracts/4.x/erc721)
- [Ethers.js v6](https://docs.ethers.org/v6/)
- [Metamask API](https://docs.metamask.io)
- [Smart Contract Security Best Practices](https://consensys.net/smart-contract-best-practices/)

---

## 📄 License

This project is licensed under the **MIT License** - see the LICENSE file for details.

---

## 💬 Support

For questions or issues:
- 📧 Email: [your-email@university.ac.id]
- 🐛 [GitHub Issues](https://github.com/your-username/am-tickets/issues)
- 💡 [GitHub Discussions](https://github.com/your-username/am-tickets/discussions)

---

<div align="center">

**AM-Tickets | Secure On-Chain Ticketing for Arctic Monkeys World Tour 2026**

Built with blockchain security · Powered by Ethereum Sepolia

</div>
