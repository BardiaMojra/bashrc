#!/usr/bin/env bash
function pause(){
  echo ' ' && echo ' '
  read -s -n 1 -p "press any key to continue..."
  echo ' ' && echo ' '
}

echo ' ' && echo ' ' 
gpg --keyid-format long --verify SHA256SUMS.gpg SHA256SUMS
echo ' ' && echo ' ' && echo '--->> confirm RSA key...' && echo ' ' && echo ' '
pause

sha256sum -c SHA256SUMS 2>&1 | grep OK
echo ' ' && echo '' && echo '--->> confirm checksum OK...' && echo ' ' && echo ' '
pause

echo ' ' && echo ' '&& echo '--->> checksum verification finished.'&& echo ' ' && echo ' '
# EOF

