

program program_scope.aleo {
    mapping balances: address => u64;

// Declare a mapping that contains an array value
mapping data: address => [bool; 8];
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
        let current_amount: u64 = Mapping::get_or_use(balances, receiver, 0u64);
        Mapping::set(balances, receiver, current_amount + amount);
   }

    function compute(a: u64, b: u64) -> u64 {
        return a + b;
    }
}