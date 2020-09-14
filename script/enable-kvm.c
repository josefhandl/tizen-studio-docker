#include <sys/types.h>
#include <unistd.h>
#include <stdio.h>

int main(void) {
	uid_t uid = getuid();
	setuid(0);
	execl("/opt/script/enable-kvm.sh", "", NULL);
	setuid(uid);
	return 0;
}
