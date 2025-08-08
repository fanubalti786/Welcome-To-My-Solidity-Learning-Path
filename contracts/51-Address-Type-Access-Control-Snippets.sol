// 1️⃣ Sirf wallets (EOA) allowed
require(msg.sender == tx.origin, "Contracts not allowed");

// 2️⃣ Sirf contracts allowed
require(msg.sender != tx.origin, "Wallets not allowed");

// 3️⃣ Sirf contracts allowed (code.length method)
require(msg.sender.code.length > 0, "Only contracts allowed");

// 4️⃣ Sirf wallets allowed (code.length method)
require(msg.sender.code.length == 0, "Only wallets allowed");

// 5️⃣ Strict wallets only (double check)
require(msg.sender == tx.origin && msg.sender.code.length == 0, "Only pure EOA wallets allowed");
