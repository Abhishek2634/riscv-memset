.section .text
.global custom_memset

custom_memset:
  mv t1, a0            # Copy start address to t1
  andi t2, a0, 3       # Check alignment (a0 mod 4)
  beqz t2, 1f          # If aligned, jump to word processing

# Handle misaligned prefix bytes
  sb a1, 0(t1)         
  add t1, t1, 1        
  addi a2, a2, -1      
  j custom_memset      

1: 
  srli t3, a2, 2       # Calculate number of 4-byte words (a2 / 4)
  beqz t3, 3f          # If no 4-byte words, jump to byte processing
  
  # Prepare a 32-bit word where all 4 bytes are set to a1
  li t4, -1            
  sll t4, t4, 24       # Shift to form a word with `a1` repeated in all 4 bytes
  or t4, t4, t4        # This line can be omitted. Just `t4 = a1` works.
  
2:
  sw t4, 0(t1)         # Store the 4-byte word at the address pointed by t1
  add t1, t1, 4        # Move to the next 4-byte word
  addi t3, t3, -1      # Decrease the word count
  bnez t3, 2b          # If there are more words to write, repeat

3: 
  andi t2, a2, 3       # Calculate the remaining bytes (a2 % 4)
  beqz t2, 4f          # If no remaining bytes, jump to end

4:
  sb a1, 0(t1)         # Store the remaining byte at the address pointed by t1
  add t1, t1, 1        # Move to the next byte
  addi t2, t2, -1      # Decrease remaining byte count
  bnez t2, 4b          # If there are more bytes to process, repeat

4f: 
  ret                  # Return from the function
