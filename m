Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3C3470306
	for <lists+linux-cachefs@lfdr.de>; Fri, 10 Dec 2021 15:41:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1639147311;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=b2ifWyKqPBAU0jbZUYHcNlq+Ha//XAyPrE7FyxVC0JY=;
	b=Cs/6XWNso8nsJE4ky1yRIpHT3N//+yaqr6EQVgZ2f/8K4MNM1SJ6mlIdd34Uloz1hCcnM+
	RWhfieLU113b7t7SkJkmSe8ocJFNcB1D8t99Y4qI8YFFwswvEnPoa+K3y2+lS+9wdAWKi1
	mzNmmf2kYXM3HuKvj5KNa6D4r3UfI+s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-61-nKEZiWNJPTC4tPeNB8j01Q-1; Fri, 10 Dec 2021 09:41:48 -0500
X-MC-Unique: nKEZiWNJPTC4tPeNB8j01Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCDCA100F942;
	Fri, 10 Dec 2021 14:41:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CFBF7A211;
	Fri, 10 Dec 2021 14:41:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 77D8A4BB7C;
	Fri, 10 Dec 2021 14:41:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BAEfhHw008324 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 10 Dec 2021 09:41:43 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 10C4360C7F; Fri, 10 Dec 2021 14:41:43 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.122])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6873360C04;
	Fri, 10 Dec 2021 14:41:21 +0000 (UTC)
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
Date: Fri, 10 Dec 2021 14:41:20 +0000
Message-ID: <288398.1639147280@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1BAEfhHw008324
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <288397.1639147280.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Linus Torvalds <torvalds@linux-foundation.org> wrote:

> But as mentioned for the other patches, you should then also be a lot
> more careful about always using the end result as an 'unsigned int'
> (or maybe 'u32') too, and when comparing hashes for binary search or
> other, you should always do th4e compare in some stable format.
> 
> Because doing
> 
>         return (long)hash_a - (long)hash_b;
> 
> and looking at the sign doesn't actually result in a stable ordering
> on 32-bit architectures. You don't get a transitive ordering (ie a < b
> and b < c doesn't imply a < c).
> 
> And presumably if the hashes are meaningful across machines, then hash
> comparisons should also be meaningful across machines.
> 
> So when comparing hashes, you need to compare them either in a truly
> bigger signed type (and make sure that doesn't get truncated) - kind
> of like how a lot of 'memcmp()' functions do 'unsigned char'
> subtractions in an 'int' - or you need to compare them _as_ 'unsigned
> int'.
> 
> Otherwise the comparisons will be all kinds of messed up.

I don't think it should matter in this case, as the in-memory hash tables are
an independent of what's on disk (and not even necessarily the same size).
They're only used for duplicate detection.  The idea was to be able to shorten
the scanning of a hash bucket by half on average, but I didn't make it do
that.  It's just that I use the same hash value as a quick check first.

However, since the comparator functions are only used to see if they're the
same or different, the attached change makes them return bool instead, no
cast or subtraction required.

David
---
diff --git a/fs/fscache/cookie.c b/fs/fscache/cookie.c
index 65cf2ae22a70..ca36b598d6b5 100644
--- a/fs/fscache/cookie.c
+++ b/fs/fscache/cookie.c
@@ -289,17 +289,15 @@ static int fscache_set_key(struct fscache_cookie *cookie,
 	return 0;
 }
 
-static long fscache_compare_cookie(const struct fscache_cookie *a,
-				   const struct fscache_cookie *b)
+static bool fscache_cookie_same(const struct fscache_cookie *a,
+				const struct fscache_cookie *b)
 {
 	const void *ka, *kb;
 
-	if (a->key_hash != b->key_hash)
-		return (long)a->key_hash - (long)b->key_hash;
-	if (a->volume != b->volume)
-		return (long)a->volume - (long)b->volume;
-	if (a->key_len != b->key_len)
-		return (long)a->key_len - (long)b->key_len;
+	if (a->key_hash	!= b->key_hash ||
+	    a->volume	!= b->volume ||
+	    a->key_len	!= b->key_len)
+		return false;
 
 	if (a->key_len <= sizeof(a->inline_key)) {
 		ka = &a->inline_key;
@@ -308,7 +306,7 @@ static long fscache_compare_cookie(const struct fscache_cookie *a,
 		ka = a->key;
 		kb = b->key;
 	}
-	return memcmp(ka, kb, a->key_len);
+	return memcmp(ka, kb, a->key_len) == 0;
 }
 
 static atomic_t fscache_cookie_debug_id = ATOMIC_INIT(1);
@@ -399,7 +397,7 @@ static bool fscache_hash_cookie(struct fscache_cookie *candidate)
 
 	hlist_bl_lock(h);
 	hlist_bl_for_each_entry(cursor, p, h, hash_link) {
-		if (fscache_compare_cookie(candidate, cursor) == 0) {
+		if (fscache_cookie_same(candidate, cursor)) {
 			if (!test_bit(FSCACHE_COOKIE_RELINQUISHED, &cursor->flags))
 				goto collision;
 			wait_for = fscache_get_cookie(cursor,
diff --git a/fs/fscache/volume.c b/fs/fscache/volume.c
index 26a6b8f315e1..0e80fd8fd14a 100644
--- a/fs/fscache/volume.c
+++ b/fs/fscache/volume.c
@@ -119,20 +119,18 @@ void fscache_end_volume_access(struct fscache_volume *volume,
 }
 EXPORT_SYMBOL(fscache_end_volume_access);
 
-static long fscache_compare_volume(const struct fscache_volume *a,
-				   const struct fscache_volume *b)
+static bool fscache_volume_same(const struct fscache_volume *a,
+				const struct fscache_volume *b)
 {
 	size_t klen;
 
-	if (a->key_hash != b->key_hash)
-		return (long)a->key_hash - (long)b->key_hash;
-	if (a->cache != b->cache)
-		return (long)a->cache    - (long)b->cache;
-	if (a->key[0] != b->key[0])
-		return (long)a->key[0]   - (long)b->key[0];
+	if (a->key_hash	!= b->key_hash ||
+	    a->cache	!= b->cache ||
+	    a->key[0]	!= b->key[0])
+		return false;
 
 	klen = round_up(a->key[0] + 1, sizeof(__le32));
-	return memcmp(a->key, b->key, klen);
+	return memcmp(a->key, b->key, klen) == 0;
 }
 
 static bool fscache_is_acquire_pending(struct fscache_volume *volume)
@@ -170,7 +168,7 @@ static bool fscache_hash_volume(struct fscache_volume *candidate)
 
 	hlist_bl_lock(h);
 	hlist_bl_for_each_entry(cursor, p, h, hash_link) {
-		if (fscache_compare_volume(candidate, cursor) == 0) {
+		if (fscache_volume_same(candidate, cursor)) {
 			if (!test_bit(FSCACHE_VOLUME_RELINQUISHED, &cursor->flags))
 				goto collision;
 			fscache_see_volume(cursor, fscache_volume_get_hash_collision);
@@ -335,7 +333,7 @@ static void fscache_wake_pending_volume(struct fscache_volume *volume,
 	struct hlist_bl_node *p;
 
 	hlist_bl_for_each_entry(cursor, p, h, hash_link) {
-		if (fscache_compare_volume(cursor, volume) == 0) {
+		if (fscache_volume_same(cursor, volume)) {
 			fscache_see_volume(cursor, fscache_volume_see_hash_wake);
 			clear_bit(FSCACHE_VOLUME_ACQUIRE_PENDING, &cursor->flags);
 			wake_up_bit(&cursor->flags, FSCACHE_VOLUME_ACQUIRE_PENDING);

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

