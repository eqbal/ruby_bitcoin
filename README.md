# Bitcoin On Ruby

This is a simple Ruby implementation for bitcoin and blockchain main features:

 - Blocks 
 - Proof of Work

The original paper for Satoshi Nakamoto describing the blockchain could be found http://nakamotoinstitute.org/bitcoin/

### Notes 

- We can simplify model of it as a Linked List, each node of the List is what we call a Block. Each Block is a stupid struct with the usual previous/next pointers and a body comprised of a tree-like structure (a Merkle Tree, to be more exact).

- The catch is that each block has the hash signature of the previous block, thus creating a secure "chain". Hence "block-chain"

### Test

# Test it out

```ruby
b0 = Block.first( "Genesis" )
b1 = Block.next( b0, "Transaction Data..." )
b2 = Block.next( b1, "Transaction Data......" )
b3 = Block.next( b2, "More Transaction Data..." )

blockchain = [b0, b1, b2, b3]

pp blockchain
```
