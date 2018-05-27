CFLAGS	= -fPIC -pedantic -Wall -Wextra
LDFLAGS = -shared

TARGET	= libcredid.so
SOURCES	= credid.c
HEADERS	= credid.h
OBJECTS	= $(SOURCES:.c=.o)

#PREFIX			= $(DESTDIR)/usr/local
BINDIR			= $(PREFIX)/bin
LIBDIR			= $(PREFIX)/lib
INCLUDEDIR	= $(PREFIX)/include

all:	$(TARGET)

$(TARGET):	$(OBJECTS)
	$(CC) $(FLAGS) $(CFLAGS) $(LDFLAGS) -o $(TARGET) $(OBJECTS)

install:
	@mkdir -p $(PREFIX)/bin $(PREFIX)/include
	@cp $(TARGET) $(LIBDIR)
	@echo $(TARGET) copied to $(LIBDIR)

	@$(foreach header,  $(HEADERS),  \
		cp $(header)    $(INCLUDEDIR); \
		echo $(header)  copied to $(INCLUDEDIR)/`basename $(header)` \
	)

uninstall:
	rm $(PREFIX)/bin/$(NAME)

clean:
	rm -f $(OBJECTS)
	rm -f $(TARGET)

.PHONY: all clean install uninstall
