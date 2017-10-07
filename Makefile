NAME = libfts.a

NASM = nasm

EXECUTABLE = asm_tests

CC = clang

MAC_FLAG = -f macho64 --prefix _

LINUX_FLAG = -f elf64

LIBSRC = ft_bzero.s ft_strcat.s ft_isalpha.s ft_isdigit.s ft_isalnum.s \
			ft_isascii.s ft_isprint.s ft_toupper.s ft_tolower.s \
			ft_strlen.s ft_puts.s ft_memset.s ft_memcpy.s

LIBOBJ = $(LIBSRC:.s=.o)

SRC = main.c

OBJ = main.o

all: $(NAME)
$(NAME): $(LIBOBJ)
	$(CC) -c $(SRC)
	ar rcs $(NAME) $(LIBOBJ)
	ranlib $(NAME)
	$(CC) -o $(EXECUTABLE) $(OBJ) $(NAME) -I libfts.h # if compilation error on mac... swap OBJ and NAME

%.o: %.s
	$(NASM) $(LINUX_FLAG) $<

# linux: $(NAME)
# $(NAME): $(LIBOBJ)
# 	$(CC) -c $(SRC)
# 	ar rcs $(NAME) $(LIBOBJ)
# 	ranlib $(NAME)
# 	$(CC) -o $(EXECUTABLE) $(NAME) $(OBJ) -I libfts.h

# %.o: %.s
# 	$(NASM) $(LINUX_FLAG) $<

clean:
	rm -f asm_main $(LIBOBJ)

fclean: clean
	rm -f $(NAME) 

re:
	fclean all
