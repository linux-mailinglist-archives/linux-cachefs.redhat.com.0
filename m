Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0D69D359C74
	for <lists+linux-cachefs@lfdr.de>; Fri,  9 Apr 2021 12:59:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617965962;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SIbI1PTDRzxWh2f2uDA9Siz0QWFgX8fBEL9mtBVIqz8=;
	b=Oy+1Y+ghg35hAk6SSQKQ25kjoKhsuxZ0ulehTde8hP+WZJMvBUYOKfyD7zZaOcmewmEAYO
	aJ1uwlIezmKjshLVqopuPNSXTxDqH0sTpNIWitSfYL6gRk5R/5rbQz+iPdmYN7gtdT6VMF
	B9HLYofeEHomAZR81nlP8i0BJ4I3GsI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-130-2x4hFTASPliLqGJlLTXBGg-1; Fri, 09 Apr 2021 06:59:20 -0400
X-MC-Unique: 2x4hFTASPliLqGJlLTXBGg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A84268189C7;
	Fri,  9 Apr 2021 10:59:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C9AD660BF1;
	Fri,  9 Apr 2021 10:59:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DF90455345;
	Fri,  9 Apr 2021 10:59:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 139AxBvS027368 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 9 Apr 2021 06:59:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E583E60BF1; Fri,  9 Apr 2021 10:59:11 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-119-35.rdu2.redhat.com
	[10.10.119.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 65D2260BE5;
	Fri,  9 Apr 2021 10:59:02 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: torvalds@linux-foundation.org, willy@infradead.org
Date: Fri, 09 Apr 2021 11:59:01 +0100
Message-ID: <161796594154.350846.1787112929938233401.stgit@warthog.procyon.org.uk>
In-Reply-To: <CAHk-=wi_XrtTanTwoKs0jwnjhSvwpMYVDJ477VtjvvTXRjm5wQ@mail.gmail.com>
References: <CAHk-=wi_XrtTanTwoKs0jwnjhSvwpMYVDJ477VtjvvTXRjm5wQ@mail.gmail.com>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	jlayton@kernel.org, Akinobu Mita <akinobu.mita@gmail.com>,
	linux-afs@lists.infradead.org, linux-mm@kvack.org,
	ceph-devel@vger.kernel.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, akpm@linux-foundation.org,
	Will Deacon <will@kernel.org>, hch@lst.de
Subject: [Linux-cachefs] [RFC PATCH 1/3] Make the generic bitops return bool
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Make the generic bitops return bool when returning the value of a tested
bit.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Linus Torvalds <torvalds@linux-foundation.org>
cc: Matthew Wilcox <willy@infradead.org>
cc: Akinobu Mita <akinobu.mita@gmail.com>
cc: Arnd Bergmann <arnd@arndb.de>
cc: Will Deacon <will@kernel.org>
---

 include/asm-generic/bitops/atomic.h     |    6 +++---
 include/asm-generic/bitops/le.h         |   10 +++++-----
 include/asm-generic/bitops/lock.h       |    4 ++--
 include/asm-generic/bitops/non-atomic.h |    8 ++++----
 4 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/include/asm-generic/bitops/atomic.h b/include/asm-generic/bitops/atomic.h
index 0e7316a86240..9b05e8634c09 100644
--- a/include/asm-generic/bitops/atomic.h
+++ b/include/asm-generic/bitops/atomic.h
@@ -29,7 +29,7 @@ static __always_inline void change_bit(unsigned int nr, volatile unsigned long *
 	atomic_long_xor(BIT_MASK(nr), (atomic_long_t *)p);
 }
 
-static inline int test_and_set_bit(unsigned int nr, volatile unsigned long *p)
+static inline bool test_and_set_bit(unsigned int nr, volatile unsigned long *p)
 {
 	long old;
 	unsigned long mask = BIT_MASK(nr);
@@ -42,7 +42,7 @@ static inline int test_and_set_bit(unsigned int nr, volatile unsigned long *p)
 	return !!(old & mask);
 }
 
-static inline int test_and_clear_bit(unsigned int nr, volatile unsigned long *p)
+static inline bool test_and_clear_bit(unsigned int nr, volatile unsigned long *p)
 {
 	long old;
 	unsigned long mask = BIT_MASK(nr);
@@ -55,7 +55,7 @@ static inline int test_and_clear_bit(unsigned int nr, volatile unsigned long *p)
 	return !!(old & mask);
 }
 
-static inline int test_and_change_bit(unsigned int nr, volatile unsigned long *p)
+static inline bool test_and_change_bit(unsigned int nr, volatile unsigned long *p)
 {
 	long old;
 	unsigned long mask = BIT_MASK(nr);
diff --git a/include/asm-generic/bitops/le.h b/include/asm-generic/bitops/le.h
index 188d3eba3ace..33355cf288f6 100644
--- a/include/asm-generic/bitops/le.h
+++ b/include/asm-generic/bitops/le.h
@@ -50,7 +50,7 @@ extern unsigned long find_next_bit_le(const void *addr,
 #error "Please fix <asm/byteorder.h>"
 #endif
 
-static inline int test_bit_le(int nr, const void *addr)
+static inline bool test_bit_le(int nr, const void *addr)
 {
 	return test_bit(nr ^ BITOP_LE_SWIZZLE, addr);
 }
@@ -75,22 +75,22 @@ static inline void __clear_bit_le(int nr, void *addr)
 	__clear_bit(nr ^ BITOP_LE_SWIZZLE, addr);
 }
 
-static inline int test_and_set_bit_le(int nr, void *addr)
+static inline bool test_and_set_bit_le(int nr, void *addr)
 {
 	return test_and_set_bit(nr ^ BITOP_LE_SWIZZLE, addr);
 }
 
-static inline int test_and_clear_bit_le(int nr, void *addr)
+static inline bool test_and_clear_bit_le(int nr, void *addr)
 {
 	return test_and_clear_bit(nr ^ BITOP_LE_SWIZZLE, addr);
 }
 
-static inline int __test_and_set_bit_le(int nr, void *addr)
+static inline bool __test_and_set_bit_le(int nr, void *addr)
 {
 	return __test_and_set_bit(nr ^ BITOP_LE_SWIZZLE, addr);
 }
 
-static inline int __test_and_clear_bit_le(int nr, void *addr)
+static inline bool __test_and_clear_bit_le(int nr, void *addr)
 {
 	return __test_and_clear_bit(nr ^ BITOP_LE_SWIZZLE, addr);
 }
diff --git a/include/asm-generic/bitops/lock.h b/include/asm-generic/bitops/lock.h
index 3ae021368f48..0e6acd059a59 100644
--- a/include/asm-generic/bitops/lock.h
+++ b/include/asm-generic/bitops/lock.h
@@ -15,8 +15,8 @@
  * the returned value is 0.
  * It can be used to implement bit locks.
  */
-static inline int test_and_set_bit_lock(unsigned int nr,
-					volatile unsigned long *p)
+static inline bool test_and_set_bit_lock(unsigned int nr,
+					 volatile unsigned long *p)
 {
 	long old;
 	unsigned long mask = BIT_MASK(nr);
diff --git a/include/asm-generic/bitops/non-atomic.h b/include/asm-generic/bitops/non-atomic.h
index 7e10c4b50c5d..7d916f677be3 100644
--- a/include/asm-generic/bitops/non-atomic.h
+++ b/include/asm-generic/bitops/non-atomic.h
@@ -55,7 +55,7 @@ static inline void __change_bit(int nr, volatile unsigned long *addr)
  * If two examples of this operation race, one can appear to succeed
  * but actually fail.  You must protect multiple accesses with a lock.
  */
-static inline int __test_and_set_bit(int nr, volatile unsigned long *addr)
+static inline bool __test_and_set_bit(int nr, volatile unsigned long *addr)
 {
 	unsigned long mask = BIT_MASK(nr);
 	unsigned long *p = ((unsigned long *)addr) + BIT_WORD(nr);
@@ -74,7 +74,7 @@ static inline int __test_and_set_bit(int nr, volatile unsigned long *addr)
  * If two examples of this operation race, one can appear to succeed
  * but actually fail.  You must protect multiple accesses with a lock.
  */
-static inline int __test_and_clear_bit(int nr, volatile unsigned long *addr)
+static inline bool __test_and_clear_bit(int nr, volatile unsigned long *addr)
 {
 	unsigned long mask = BIT_MASK(nr);
 	unsigned long *p = ((unsigned long *)addr) + BIT_WORD(nr);
@@ -85,7 +85,7 @@ static inline int __test_and_clear_bit(int nr, volatile unsigned long *addr)
 }
 
 /* WARNING: non atomic and it can be reordered! */
-static inline int __test_and_change_bit(int nr,
+static inline bool __test_and_change_bit(int nr,
 					    volatile unsigned long *addr)
 {
 	unsigned long mask = BIT_MASK(nr);
@@ -101,7 +101,7 @@ static inline int __test_and_change_bit(int nr,
  * @nr: bit number to test
  * @addr: Address to start counting from
  */
-static inline int test_bit(int nr, const volatile unsigned long *addr)
+static inline bool test_bit(int nr, const volatile unsigned long *addr)
 {
 	return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG-1)));
 }


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

