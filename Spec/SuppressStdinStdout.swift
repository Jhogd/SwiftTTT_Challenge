import Foundation
class SuppressStdinStdout {
    func redirect_stdin(to inputLines: [String], for block: () -> Void) {
        let inputString = inputLines.joined(separator: "\n") + "\n"
        let inputStringData = inputString.data(using: .utf8)!
        let inputPipe = Pipe()
        inputPipe.fileHandleForWriting.write(inputStringData)
        inputPipe.fileHandleForWriting.closeFile()
        let originalStdinFD = dup(fileno(stdin))
        if dup2(inputPipe.fileHandleForReading.fileDescriptor, fileno(stdin)) != -1 {
            block()
            dup2(originalStdinFD, fileno(stdin))
            close(originalStdinFD)
        }
    }
    func suppress_print(for block: () -> Void) {
        let originalStdoutFD = dup(fileno(stdout))
        if dup2(0, fileno(stdout)) != -1 {
            block()
            dup2(originalStdoutFD, fileno(stdout))
            close(originalStdoutFD)
        }
    }
   func capture(_ capture: () -> Void) -> String {
        let originalStdoutFD = dup(fileno(stdout))
        let pipe = Pipe()
        if dup2(pipe.fileHandleForWriting.fileDescriptor, fileno(stdout)) != -1 {
            capture()
            dup2(originalStdoutFD, fileno(stdout))
            pipe.fileHandleForWriting.closeFile()
            let capturedData = pipe.fileHandleForReading.readDataToEndOfFile()
            if let capturedOutput = String(data: capturedData, encoding: .utf8) {
                return capturedOutput
            }
        }
        return ""
    }
}
