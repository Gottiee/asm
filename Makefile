NAME = libasm.a

SRCS = src/ft_strlen.s \
	# src/ft_strcpy.s \
	# src/ft_strcmp.s \
	# src/ft_write.s \
	# src/ft_read.s \
	# src/ft_strdup.s

OBJS = $(SRCS:src/%.s=obj/%.o)

NASM = nasm
NASM_FLAGS = -f elf64
TEST=test

all: $(NAME)

$(NAME): $(OBJS)
	@ar rc $(NAME) $(OBJS)
	@ranlib $(NAME)

obj/%.o: src/%.s
	@mkdir -p obj
	@$(NASM) $(NASM_FLAGS) $< -o $@

clean:
	@/bin/rm -f $(OBJS)
	@/bin/rm -rf obj

fclean: clean
	@/bin/rm -f $(NAME)

re: fclean all

test:			$(NAME)
				gcc $(FLAGS) -L. -lasm -o $(TEST) main.c

.PHONY:			clean fclean re test