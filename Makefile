CFLAGS = -O2 -g -std=gnu99 -Wall
LDFLAGS = -lpthread

programs = test-spinlock-cmpxchg test-spinlock-xchg test-spinlock-k42 \
		   test-spinlock-mcs test-spinlock-ticket test-spinlock-pthread \
		   test-spinlock-xchg-backoff test-rtm test-spinlock-xchg-hle

all: $(programs)

test-spinlock-cmpxchg: test-spinlock.c
	$(CC) $(CFLAGS) -DCMPXCHG $^ -o $@ $(LDFLAGS)

test-spinlock-xchg: test-spinlock.c
	$(CC) $(CFLAGS) -DXCHG $^ -o $@ $(LDFLAGS)

test-spinlock-k42: test-spinlock.c
	$(CC) $(CFLAGS) -DK42 $^ -o $@ $(LDFLAGS)

test-spinlock-mcs: test-spinlock.c
	$(CC) $(CFLAGS) -DMCS $^ -o $@ $(LDFLAGS)

test-spinlock-ticket: test-spinlock.c
	$(CC) $(CFLAGS) -DTICKET $^ -o $@ $(LDFLAGS)

test-spinlock-pthread: test-spinlock.c
	$(CC) $(CFLAGS) -DPTHREAD $^ -o $@ $(LDFLAGS)

test-spinlock-xchg-backoff: test-spinlock.c
	$(CC) $(CFLAGS) -DXCHGBACKOFF $^ -o $@ $(LDFLAGS)

test-spinlock-xchg-hle: test-spinlock.c
	$(CC) $(CFLAGS) -DHLE $^ -o $@ $(LDFLAGS)

test-rtm: test-spinlock.c
	$(CC) $(CFLAGS) -DRTM $^ -o $@ $(LDFLAGS)

%:%.c
	$(CC) $(CFLAGS) $< -o $@

clean:
	-rm -f *.o
	-rm -f $(programs)
