#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>
#include <sys/syscall.h>
#include <stdlib.h>
#include <stddef.h>
#include <sys/types.h>

int ft_strlen(const char* s);

# define STRLEN(x)			printf("`%s` = %d (%d)\n", x, ft_strlen(x), (int)strlen(x));
# define STRCMP(a, b)		printf("`%s`:`%s` = %d (%d)\n", a, b, ft_strcmp(a, b), strcmp(a, b));
# define WRITE(s, x)		printf("^%ld (`%s`:%ld)\n", ft_write(STDOUT_FILENO, s, x), s, x);
# define READ(b, x)			r = ft_read(STDIN_FILENO, buffer, x); printf("`%s`:%ld\n", buffer, r);
# define DUP(s)				tmp = ft_strdup(s); printf("`%s` (`%s`)\n", tmp, s); free(tmp); tmp = NULL;

// int		ft_strcmp(char const *s1, char const *s2);
// char	*ft_strcpy(char *dst, char const *src);
// ssize_t	ft_write(int fd, void const *buf, size_t nbyte);
// ssize_t	ft_read(int fd, void *buf, size_t nbyte);
// char	*ft_strdup(char const *s1);

int main(void)
{
	printf("--strlen\n");
	STRLEN("")
	STRLEN("toto")
	STRLEN("totototo")
	STRLEN("0123456789abcdef")
	STRLEN("42")
	STRLEN("1")
	printf("-done\n");
}
