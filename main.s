.data
    openPrompt:     .asciz "Welcome to my Program\n"
    newLine:        .asciz "\n"
    programMsg:     .asciz "Encryption/Decryption Program\n"
    process_Msg:    .asciz "1) Enter a String\n2) Enter an Encryption Key\n3) Print the input String\n4) Print the input Key\n5) Encryption/Display the String\n6) Decrypt/Display the String\nx) Exit the program\nPlease Enter one:\n"
    userMsg_1:      .asciz "Please Enter a string: "
    userMsg_2:      .asciz "Please enter an Encryption key: "
    userMsg_3:      .asciz "Here is the input String: "
    userMsg_4:      .asciz "Here is the input Key: "
    userMsg_5:      .asciz "Here is your encrypted data: "
    userMsg_6:      .asciz "Here is your decrypted data: "
    user_Msg_7:     .asciz "Thank you and have a nice day!, program is ending...\n"
    default_ErorMsg:.asciz "Invalid input please try again!\n"

    CaseTable:      .byte '1', 0, '2', 0, '3', 0, '4', 0, '5', 0, '6', 0, 'x', 0
    entrySize:      .equ 8
    numberOfEntries:.equ ($ - CaseTable) / entrySize

    menuBuffer:     .space 1
    readBuffer:     .space 255
    stringBuffer:   .space 255
    Key:            .space 255
    enryptionArray: .space 255
    decryptionArray:.space 255

.text
.global _start

_start:
    // Display Program Header
    adrp    x0, openPrompt
    add     x0, x0, :lo12:openPrompt
    bl      PrintText

LoopMenu:
    // Print menu
    adrp    x0, process_Msg
    add     x0, x0, :lo12:process_Msg
    bl      PrintString

    // Read user input
    ldr     x0, =menuBuffer
    ldr     x1, =menuBuffer+len
    bl      ReadText
    bl      ClearKBuffer

    // Process user input
    ldrb    w0, [menuBuffer]  // Load user choice

    // Switch statement
    adr     x1, CaseTable
    mov     x2, numberOfEntries

Switch1:
    ldrb    w3, [x1]          // Load case value
    cmp     w0, w3            // Compare user input with case value
    b.ne    Switch1_GoAgain   // If not equal, go to next case

    ldr     x4, [x1, #1]      // Load address of case function
    blr     x4                // Call case function
    b       LoopMenu          // Continue loop

Switch1_GoAgain:
    add     x1, x1, #entrySize // Move to next case
    subs    x2, x2, #1         // Decrement counter
    b.ne    Switch1            // Loop until end of table

    // Default case
    b       Case_default

PrintString:
    // Your implementation for printing a string goes here
    ret

ReadText:
    // Your implementation for reading text goes here
    ret

ClearKBuffer:
    // Your implementation for clearing keyboard buffer goes here
    ret

Case_A:
    // Your implementation for Case_A goes here
    ret

Case_B:
    // Your implementation for Case_B goes here
    ret

// Implement other cases similarly

Case_default:
    // Your implementation for default case goes here
    ret

Exit:
    // Your implementation for program exit goes here
    ret


//in completed status
//Please note that you'll need to implement the functions PrintText, //PrintString, ReadText, ClearKBuffer, and the individual case functions //(Case_A, Case_B, etc.) according to the ARM64 assembly language conventions //and system calls. Additionally, the function names and logic might need //adjustment depending on your specific requirements and system environment.
