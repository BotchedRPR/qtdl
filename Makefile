OUT := qdl

CFLAGS := -O2 -Wall -g `xml2-config --cflags`
LDFLAGS := `xml2-config --libs` -ludev
prefix := /usr/local

SRC_DIR := src
OBJ_DIR := obj

SRCS := $(wildcard $(SRC_DIR)/*.c)
OBJS := $(SRCS:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)

$(warning $(SRCS))
$(warning $(OBJS))

$(OUT): $(OBJS)
	$(CC) -o $@ $^ $(LDFLAGS)

clean:
	rm -f $(OUT) $(OBJS)

install: $(OUT)
	install -D -m 755 $< $(DESTDIR)$(prefix)/bin/$<
