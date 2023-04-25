CC = gcc
CFLAGS = -g -Wall
DEPS = app.h commande.h noeud.h
O =  app.o commande.o noeud.o
EXEC = app

all : $(EXEC)

%.o: %.c $(DEPS)
	$(CC) $(CFLAGS) -c $< 

app : $(O)
	$(CC) $(CFLAGS) -o $@ $^

run :
	./$(EXEC)
	
clean :
	rm -rf $(EXEC) *.o

leak :
	valgrind --leak-check=full ./$(EXEC) 