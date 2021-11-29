Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D28461912
	for <lists+linux-cachefs@lfdr.de>; Mon, 29 Nov 2021 15:33:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638196414;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=y5QlfGWnYgeTTpbs9UR1RKzZswDWNbSyVt6uW4ZD2Ow=;
	b=PyMLx7mRzc/hfD/MCCoYvNEgjcyeT5w4uxAR1hNRm8h2gBgMkIdCw7e3t6wz5Fu3FTOMaf
	IjHFyHQ5RTlnURFEfVKg5aWEQb05Cxe/BHF9GrrHXVEmWzmoRZHiVfgOrUT1UyQOURTXlq
	aD5ofpAhJY6CL8HyJ3z6G39UU9pqU98=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-189-IfQx1mK5Mf6xS7-_kc9L_A-1; Mon, 29 Nov 2021 09:33:33 -0500
X-MC-Unique: IfQx1mK5Mf6xS7-_kc9L_A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2346E760C6;
	Mon, 29 Nov 2021 14:33:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 15FED5DF37;
	Mon, 29 Nov 2021 14:33:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F32E04BB7B;
	Mon, 29 Nov 2021 14:33:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1ATEXR5F002663 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 29 Nov 2021 09:33:27 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EEE7D60854; Mon, 29 Nov 2021 14:33:27 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.25])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B7FCF608BA;
	Mon, 29 Nov 2021 14:33:24 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Mon, 29 Nov 2021 14:33:23 +0000
Message-ID: <163819640393.215744.15212364106412961104.stgit@warthog.procyon.org.uk>
In-Reply-To: <163819575444.215744.318477214576928110.stgit@warthog.procyon.org.uk>
References: <163819575444.215744.318477214576928110.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-cifs@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, linux-afs@lists.infradead.org,
	v9fs-developer@lists.sourceforge.net,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
	Omar Sandoval <osandov@osandov.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: [Linux-cachefs] [PATCH 44/64] cachefiles: Implement key to filename
	encoding
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Implement a function to encode a binary cookie key as something that can be
used as a filename.  Four options are considered:

 (1) All printable chars with no '/' characters.  Prepend a 'D' to indicate
     the encoding but otherwise use as-is.

 (2) Appears to be an array of __be32.  Encode as 'S' plus a list of
     hex-encoded 32-bit ints separated by commas.  If a number is 0, it is
     rendered as "" instead of "0".

 (3) Appears to be an array of __le32.  Encoded as (2) but with a 'T'
     encoding prefix.

 (4) Encoded as base64 with an 'E' prefix plus a second char indicating how
     much padding is involved.  A non-standard base64 encoding is used
     because '/' cannot be used in the encoded form.

If (1) is not possible, whichever of (2), (3) or (4) produces the shortest
string is selected (hex-encoding a number may be less dense than base64
encoding it).

Note that the prefix characters have to be selected from the set [DEIJST@]
lest cachefilesd remove the files because it recognise the name.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com
---

 fs/cachefiles/Makefile   |    1 
 fs/cachefiles/internal.h |    5 ++
 fs/cachefiles/key.c      |  139 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 145 insertions(+)
 create mode 100644 fs/cachefiles/key.c

diff --git a/fs/cachefiles/Makefile b/fs/cachefiles/Makefile
index d67210ece9cd..6f025940a65c 100644
--- a/fs/cachefiles/Makefile
+++ b/fs/cachefiles/Makefile
@@ -7,6 +7,7 @@ cachefiles-y := \
 	cache.o \
 	daemon.o \
 	interface.o \
+	key.o \
 	main.o \
 	namei.o \
 	security.o \
diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
index ff378171c71d..28e386b5b1f3 100644
--- a/fs/cachefiles/internal.h
+++ b/fs/cachefiles/internal.h
@@ -173,6 +173,11 @@ extern struct cachefiles_object *cachefiles_grab_object(struct cachefiles_object
 extern void cachefiles_put_object(struct cachefiles_object *object,
 				  enum cachefiles_obj_ref_trace why);
 
+/*
+ * key.c
+ */
+extern bool cachefiles_cook_key(struct cachefiles_object *object);
+
 /*
  * main.c
  */
diff --git a/fs/cachefiles/key.c b/fs/cachefiles/key.c
new file mode 100644
index 000000000000..3b1bdc81fc0a
--- /dev/null
+++ b/fs/cachefiles/key.c
@@ -0,0 +1,139 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* Key to pathname encoder
+ *
+ * Copyright (C) 2021 Red Hat, Inc. All Rights Reserved.
+ * Written by David Howells (dhowells@redhat.com)
+ */
+
+#include <linux/slab.h>
+#include "internal.h"
+
+static const char cachefiles_charmap[64] =
+	"0123456789"			/* 0 - 9 */
+	"abcdefghijklmnopqrstuvwxyz"	/* 10 - 35 */
+	"ABCDEFGHIJKLMNOPQRSTUVWXYZ"	/* 36 - 61 */
+	"_-"				/* 62 - 63 */
+	;
+
+static const char cachefiles_filecharmap[256] = {
+	/* we skip space and tab and control chars */
+	[33 ... 46] = 1,		/* '!' -> '.' */
+	/* we skip '/' as it's significant to pathwalk */
+	[48 ... 127] = 1,		/* '0' -> '~' */
+};
+
+static inline unsigned int how_many_hex_digits(unsigned int x)
+{
+	return x ? round_up(ilog2(x) + 1, 4) / 4 : 0;
+}
+
+/*
+ * turn the raw key into something cooked
+ * - the key may be up to NAME_MAX in length (including the length word)
+ *   - "base64" encode the strange keys, mapping 3 bytes of raw to four of
+ *     cooked
+ *   - need to cut the cooked key into 252 char lengths (189 raw bytes)
+ */
+bool cachefiles_cook_key(struct cachefiles_object *object)
+{
+	const u8 *key = fscache_get_key(object->cookie), *kend;
+	unsigned char ch;
+	unsigned int acc, i, n, nle, nbe, keylen = object->cookie->key_len;
+	unsigned int b64len, len, print, pad;
+	char *name, sep;
+
+	_enter(",%u,%*phN", keylen, keylen, key);
+
+	BUG_ON(keylen > NAME_MAX - 3);
+
+	print = 1;
+	for (i = 0; i < keylen; i++) {
+		ch = key[i];
+		print &= cachefiles_filecharmap[ch];
+	}
+
+	/* If the path is usable ASCII, then we render it directly */
+	if (print) {
+		len = 1 + keylen + 1;
+		name = kmalloc(len, GFP_KERNEL);
+		if (!name)
+			return false;
+
+		name[0] = 'D'; /* Data object type, string encoding */
+		name[1 + keylen] = 0;
+		memcpy(name + 1, key, keylen);
+		goto success;
+	}
+
+	/* See if it makes sense to encode it as "hex,hex,hex" for each 32-bit
+	 * chunk.  We rely on the key having been padded out to a whole number
+	 * of 32-bit words.
+	 */
+	n = round_up(keylen, 4);
+	nbe = nle = 0;
+	for (i = 0; i < n; i += 4) {
+		u32 be = be32_to_cpu(*(__be32 *)(key + i));
+		u32 le = le32_to_cpu(*(__le32 *)(key + i));
+
+		nbe += 1 + how_many_hex_digits(be);
+		nle += 1 + how_many_hex_digits(le);
+	}
+
+	b64len = DIV_ROUND_UP(keylen, 3);
+	pad = b64len * 3 - keylen;
+	b64len = 2 + b64len * 4; /* Length if we base64-encode it */
+	_debug("len=%u nbe=%u nle=%u b64=%u", keylen, nbe, nle, b64len);
+	if (nbe < b64len || nle < b64len) {
+		unsigned int nlen = min(nbe, nle) + 1;
+		name = kmalloc(nlen, GFP_KERNEL);
+		if (!name)
+			return false;
+		sep = (nbe <= nle) ? 'S' : 'T'; /* Encoding indicator */
+		len = 0;
+		for (i = 0; i < n; i += 4) {
+			u32 x;
+			if (nbe <= nle)
+				x = be32_to_cpu(*(__be32 *)(key + i));
+			else
+				x = le32_to_cpu(*(__le32 *)(key + i));
+			name[len++] = sep;
+			if (x != 0)
+				len += snprintf(name + len, nlen - len, "%x", x);
+			sep = ',';
+		}
+		goto success;
+	}
+
+	/* We need to base64-encode it */
+	name = kmalloc(b64len + 1, GFP_KERNEL);
+	if (!name)
+		return false;
+
+	name[0] = 'E';
+	name[1] = '0' + pad;
+	len = 2;
+	kend = key + keylen;
+	do {
+		acc  = *key++;
+		if (key < kend) {
+			acc |= *key++ << 8;
+			if (key < kend)
+				acc |= *key++ << 16;
+		}
+
+		name[len++] = cachefiles_charmap[acc & 63];
+		acc >>= 6;
+		name[len++] = cachefiles_charmap[acc & 63];
+		acc >>= 6;
+		name[len++] = cachefiles_charmap[acc & 63];
+		acc >>= 6;
+		name[len++] = cachefiles_charmap[acc & 63];
+	} while (key < kend);
+
+success:
+	name[len] = 0;
+	object->d_name = name;
+	object->d_name_len = len;
+	_leave(" = %s", object->d_name);
+	return true;
+}


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

