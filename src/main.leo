import foo.leo;

program program_scope.aleo {
    mapping balances: address => u64;

    record token {
        owner: address,
        amount: u64,
    }

    struct message {
        sender: address,
        object: u64,
    }

    transition mint_public(
        public receiver: address,
        public amount: u64,
    ) -> token {
        return token {
            owner: receiver,
            amount,
        } then finalize(receiver, amount);
    }

    finalize mint_public(
        public receiver: address,
        public amount: u64,
    ) {
        let current_amount: u64 = Mapping::get_or_use(account, receiver, 0u64);
        Mapping::set(account, receiver, current_amount + amount);
   }

    function compute(a: u64, b: u64) -> u64 {
        return a + b;
    }
}