Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BED22470301
	for <lists+linux-cachefs@lfdr.de>; Fri, 10 Dec 2021 15:41:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1639147282;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=X1n+7vlYJ410i5x3/nwLCkT//QADRgnsyvRTTA0J9hQ=;
	b=MhpfV+ikSOQaSXRQD39cSg5UXm4oQAXFEWSwpkwtyqwMtfkGzrktWW5X6XvbaEjbFkMdX9
	e9cUVm05BYVcInw3MvfrZZaTMH+SGe9MG+uI5KRWJqsxup6MC+wJlYwBXbQ/RaaVRNz1pe
	8cr1wV9tU+XMLOMz+yMEYmkJjaxDaTY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-97-fMy_P41VMami4OMy--FzAw-1; Fri, 10 Dec 2021 09:41:17 -0500
X-MC-Unique: fMy_P41VMami4OMy--FzAw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23315100D680;
	Fri, 10 Dec 2021 14:41:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 43D156B8EF;
	Fri, 10 Dec 2021 14:41:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DAF724BB7B;
	Fri, 10 Dec 2021 14:41:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BAEaS6F008044 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 10 Dec 2021 09:36:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CB71010589CE; Fri, 10 Dec 2021 14:36:27 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.122])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6223F10016F7;
	Fri, 10 Dec 2021 14:36:00 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CAHk-=whtkzB446+hX0zdLsdcUJsJ=8_-0S1mE_R+YurThfUbLA@mail.gmail.com>
References: <CAHk-=whtkzB446+hX0zdLsdcUJsJ=8_-0S1mE_R+YurThfUbLA@mail.gmail.com>
	<163906878733.143852.5604115678965006622.stgit@warthog.procyon.org.uk>
	<163906888735.143852.10944614318596881429.stgit@warthog.procyon.org.uk>
	<CAHk-=wiTquFUu-b5ME=rbGEF8r2Vh1TXGfaZZuXyOutVrgRzfw@mail.gmail.com>
	<159180.1639087053@warthog.procyon.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
MIME-Version: 1.0
Date: Fri, 10 Dec 2021 14:35:59 +0000
Message-ID: <288130.1639146959@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1BAEaS6F008044
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, "open list:NFS,
	SUNRPC, AND..." <linux-nfs@vger.kernel.org>,
	CIFS <linux-cifs@vger.kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>, linux-afs@lists.infradead.org,
	v9fs-developer@lists.sourceforge.net, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	ceph-devel@vger.kernel.org, Omar Sandoval <osandov@osandov.com>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH v2 07/67] fscache: Implement a hash
	function
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <288129.1639146959.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Linus Torvalds <torvalds@linux-foundation.org> wrote:

> > What I'm trying to get at is that the hash needs to be consistent, no matter
> > the endianness of the cpu, for any particular input blob.
> 
> Yeah, if that's the case, then you should probably make that "unsigned
> int *data" argument probably just be "void *" and then:
> 
> >                 a = *data++;   <<<<<<<
> >                 HASH_MIX(x, y, a);
> >         }
> >         return fold_hash(x, y);
> > }
> >
> > The marked line should probably use something like le/be32_to_cpu().
> 
> Yes, it should be using a '__le32 *' inside that function and you
> should use l32_to_cpu(). Obviously, BE would work too, but cause
> unnecessary work on common hardware.

Okay, how about I make the attached change to make the hashing stable?  This
will make fscache_hash() take an opaque buffer and a length (the length must
be a multiple of four).

David
---
diff --git a/fs/fscache/cookie.c b/fs/fscache/cookie.c
index e287952292c5..65cf2ae22a70 100644
--- a/fs/fscache/cookie.c
+++ b/fs/fscache/cookie.c
@@ -269,22 +269,23 @@ EXPORT_SYMBOL(fscache_caching_failed);
 static int fscache_set_key(struct fscache_cookie *cookie,
 			   const void *index_key, size_t index_key_len)
 {
-	u32 *buf;
-	int bufs;
+	void *buf;
+	size_t buf_size;
 
-	bufs = DIV_ROUND_UP(index_key_len, sizeof(*buf));
+	buf_size = round_up(index_key_len, sizeof(__le32));
 
 	if (index_key_len > sizeof(cookie->inline_key)) {
-		buf = kcalloc(bufs, sizeof(*buf), GFP_KERNEL);
+		buf = kzalloc(buf_size, GFP_KERNEL);
 		if (!buf)
 			return -ENOMEM;
 		cookie->key = buf;
 	} else {
-		buf = (u32 *)cookie->inline_key;
+		buf = cookie->inline_key;
 	}
 
 	memcpy(buf, index_key, index_key_len);
-	cookie->key_hash = fscache_hash(cookie->volume->key_hash, buf, bufs);
+	cookie->key_hash = fscache_hash(cookie->volume->key_hash,
+					buf, buf_size);
 	return 0;
 }
 
diff --git a/fs/fscache/internal.h b/fs/fscache/internal.h
index 87884f4b34fb..f121c21590dc 100644
--- a/fs/fscache/internal.h
+++ b/fs/fscache/internal.h
@@ -86,7 +86,7 @@ static inline void fscache_end_operation(struct netfs_cache_resources *cres)
  */
 extern unsigned fscache_debug;
 
-extern unsigned int fscache_hash(unsigned int salt, unsigned int *data, unsigned int n);
+extern unsigned int fscache_hash(unsigned int salt, const void *data, size_t len);
 
 /*
  * proc.c
diff --git a/fs/fscache/main.c b/fs/fscache/main.c
index 01d57433702c..dad85fd84f6f 100644
--- a/fs/fscache/main.c
+++ b/fs/fscache/main.c
@@ -53,15 +53,16 @@ static inline unsigned int fold_hash(unsigned long x, unsigned long y)
 /*
  * Generate a hash.  This is derived from full_name_hash(), but we want to be
  * sure it is arch independent and that it doesn't change as bits of the
- * computed hash value might appear on disk.  The caller also guarantees that
- * the hashed data will be a series of aligned 32-bit words.
+ * computed hash value might appear on disk.  The caller must guarantee that
+ * the source data is a multiple of four bytes in size.
  */
-unsigned int fscache_hash(unsigned int salt, unsigned int *data, unsigned int n)
+unsigned int fscache_hash(unsigned int salt, const void *data, size_t len)
 {
-	unsigned int a, x = 0, y = salt;
+	const __le32 *p = data;
+	unsigned int a, x = 0, y = salt, n = len / sizeof(__le32);
 
 	for (; n; n--) {
-		a = *data++;
+		a = le32_to_cpu(*p++);
 		HASH_MIX(x, y, a);
 	}
 	return fold_hash(x, y);
diff --git a/fs/fscache/volume.c b/fs/fscache/volume.c
index edd3c245010e..26a6b8f315e1 100644
--- a/fs/fscache/volume.c
+++ b/fs/fscache/volume.c
@@ -131,7 +131,7 @@ static long fscache_compare_volume(const struct fscache_volume *a,
 	if (a->key[0] != b->key[0])
 		return (long)a->key[0]   - (long)b->key[0];
 
-	klen = round_up(a->key[0] + 1, sizeof(unsigned int));
+	klen = round_up(a->key[0] + 1, sizeof(__le32));
 	return memcmp(a->key, b->key, klen);
 }
 
@@ -225,7 +225,7 @@ static struct fscache_volume *fscache_alloc_volume(const char *volume_key,
 	 * hashing easier.
 	 */
 	klen = strlen(volume_key);
-	hlen = round_up(1 + klen + 1, sizeof(unsigned int));
+	hlen = round_up(1 + klen + 1, sizeof(__le32));
 	key = kzalloc(hlen, GFP_KERNEL);
 	if (!key)
 		goto err_vol;
@@ -233,8 +233,7 @@ static struct fscache_volume *fscache_alloc_volume(const char *volume_key,
 	memcpy(key + 1, volume_key, klen);
 
 	volume->key = key;
-	volume->key_hash = fscache_hash(0, (unsigned int *)key,
-					hlen / sizeof(unsigned int));
+	volume->key_hash = fscache_hash(0, key, hlen);
 
 	volume->debug_id = atomic_inc_return(&fscache_volume_debug_id);
 	down_write(&fscache_addremove_sem);

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

