Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 052611CBA8A
	for <lists+linux-cachefs@lfdr.de>; Sat,  9 May 2020 00:17:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588976234;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=v4AIhqC2OtRkQr31z9zGHsoe2aW445ZngzF3lDeYnpk=;
	b=Bv95/PYRzYJdTns/v2fGP3hXpdXNn6DuYXhxohyj8q9EOTM405crNnC+WtLIWj2h1DLaCx
	seDFs01tzmMjPpqRe3xHZBVKIzCHqKNyztfzxN8P9dNulVNYZNDDOyKWs8ZigOy4T6XRm9
	aRjKuPVRAT9hwnppun4TC5v9J2IQT/0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-u_Y4aFRgN-yvWMAETyAfwg-1; Fri, 08 May 2020 18:17:11 -0400
X-MC-Unique: u_Y4aFRgN-yvWMAETyAfwg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34211EC1A0;
	Fri,  8 May 2020 22:17:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 220681CD;
	Fri,  8 May 2020 22:17:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 02B231809543;
	Fri,  8 May 2020 22:17:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 048MH7fv023791 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 8 May 2020 18:17:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E63812E188; Fri,  8 May 2020 22:17:07 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-118-225.rdu2.redhat.com
	[10.10.118.225])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 99BAF2E183;
	Fri,  8 May 2020 22:17:03 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: torvalds@linux-foundation.org,
	Trond Myklebust <trond.myklebust@hammerspace.com>
Date: Fri, 08 May 2020 23:17:02 +0100
Message-ID: <158897622270.1119820.974990693177541039.stgit@warthog.procyon.org.uk>
In-Reply-To: <158897619675.1119820.2203023452686054109.stgit@warthog.procyon.org.uk>
References: <158897619675.1119820.2203023452686054109.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: [Linux-cachefs] [PATCH 2/5] NFS: Fix fscache super_cookie index_key
 from changing after umount
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Dave Wysochanski <dwysocha@redhat.com>

Commit 402cb8dda949 ("fscache: Attach the index key and aux data to
the cookie") added the index_key and index_key_len parameters to
fscache_acquire_cookie(), and updated the callers in the NFS client.
One of the callers was inside nfs_fscache_get_super_cookie()
and was changed to use the full struct nfs_fscache_key as the
index_key.  However, a couple members of this structure contain
pointers and thus will change each time the same NFS share is
remounted.  Since index_key is used for fscache_cookie->key_hash
and this subsequently is used to compare cookies, the effectiveness
of fscache with NFS is reduced to the point at which a umount
occurs.   Any subsequent remount of the same share will cause a
unique NFS super_block index_key and key_hash to be generated for
the same data, rendering any prior fscache data unable to be
found.  A simple reproducer demonstrates the problem.

1. Mount share with 'fsc', create a file, drop page cache
systemctl start cachefilesd
mount -o vers=3,fsc 127.0.0.1:/export /mnt
dd if=/dev/zero of=/mnt/file1.bin bs=4096 count=1
echo 3 > /proc/sys/vm/drop_caches

2. Read file into page cache and fscache, then unmount
dd if=/mnt/file1.bin of=/dev/null bs=4096 count=1
umount /mnt

3. Remount and re-read which should come from fscache
mount -o vers=3,fsc 127.0.0.1:/export /mnt
echo 3 > /proc/sys/vm/drop_caches
dd if=/mnt/file1.bin of=/dev/null bs=4096 count=1

4. Check for READ ops in mountstats - there should be none
grep READ: /proc/self/mountstats

Looking at the history and the removed function, nfs_super_get_key(),
we should only use nfs_fscache_key.key plus any uniquifier, for
the fscache index_key.

Fixes: 402cb8dda949 ("fscache: Attach the index key and aux data to the cookie")
Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/nfs/fscache.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/nfs/fscache.c b/fs/nfs/fscache.c
index 1abf126c2df4..8eff1fd806b1 100644
--- a/fs/nfs/fscache.c
+++ b/fs/nfs/fscache.c
@@ -188,7 +188,8 @@ void nfs_fscache_get_super_cookie(struct super_block *sb, const char *uniq, int
 	/* create a cache index for looking up filehandles */
 	nfss->fscache = fscache_acquire_cookie(nfss->nfs_client->fscache,
 					       &nfs_fscache_super_index_def,
-					       key, sizeof(*key) + ulen,
+					       &key->key,
+					       sizeof(key->key) + ulen,
 					       NULL, 0,
 					       nfss, 0, true);
 	dfprintk(FSCACHE, "NFS: get superblock cookie (0x%p/0x%p)\n",


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

