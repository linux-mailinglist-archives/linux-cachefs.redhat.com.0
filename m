Return-Path: <linux-cachefs+bncBDLIXLMFVAERBHFQ36VAMGQE3XZMUJQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BB97EF95F
	for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 22:16:14 +0100 (CET)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-58a83a73ce9sf2604180eaf.2
        for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 13:16:14 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700255772; cv=pass;
        d=google.com; s=arc-20160816;
        b=m73gebFum5bIuFFk865nUVA5kKbFRM2WToxSrTjzj8Jd5zmnM7RSUD2oic6BPHaty8
         rwXTQWhoctsg5cZjr76DDfD3NyrzJquou7VAn8yFETR6iMWzYmeyja5wvU+1aJTxc0lu
         YehtmyFuH5BPDPIUxyuNgRq89x1fRUhsQFQzBRIyDkaPuBmHfzZS2PtQjEMomcopcBav
         Qyqzd+Ezm0ehbFBfQcd4Y/rxx0IvFSmjUWDYE9UzW7nT0LhUchlf8DRzQk1x+4squKUT
         0ROkf0z48nh9S0lf8LjkPTRyOc7rSJGa22yp3lnELj8Lem03o9Qpx2rk7haFG5VNCSzh
         /OtQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=BAgw2iSqvzFWtu9ukW51F7W+8GLfHWLy6Y1TSxn3gL0=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=v3SXdJ+izzGDH8Gc5WoCBFpWerzd25oSvDpmOBpJu6Iv/jR6Vl9ka2RwybTnZuSH/F
         3GOwxZU0yqnfbe98Kxj0OkcVtNdY3vsFkhgxLFsXT6yk/d00I3YBTZeZoMfSYIvPiCAw
         78fZaHsq/v9n6Z4er0o7LJfBMFr8Wje2tt8D+hz+pQA2WkLwHZbDgd24SyMhvYM2ufgb
         queK9So8SwJr68IELzn3OuEDAY3Z8O8LcXiNXdujB2doBsxde2B+udTem6HZhxe8kW6G
         a+bG5a3LHHcQafUojRi4Lbz4+URM+fw5mc5OD+jgSkcX9xPapDFzhfJV/e63eM9+4dwh
         VzFw==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.81 as internal address) smtp.mailfrom=dhowells@redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700255772; x=1700860572;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BAgw2iSqvzFWtu9ukW51F7W+8GLfHWLy6Y1TSxn3gL0=;
        b=hcpqaBP6jgBa13IK+qYQLbRcWfMX5id3FmcOvOfIXbrj+3FO4I4+6AExKxXmYSdOou
         A2T0QDfJXx7td5+fp+QGmpeHK0+UrBgTbDc6WZ+2y7Me1VT9xcXb/GyRODhtIyibbNXz
         iKWBCVgXDFgEpISo2PoYXL22DTsLX/UcI65QrR0gsyymJz57o8iWyY5y+wd1qeA62cSa
         BPaSDTVdGqpWWodDbW7VPtSOAeRQRfQyk+e3whOyhploZIMF6uWlYK70qGzJq2D2dEX6
         uiYiXeUti64mC/YUxIPxEeYTG795WCSPHJqN0QuZTpaG/Ov54loaxcbONV3uldDxKfg7
         WAHQ==
X-Gm-Message-State: AOJu0YyGL524XJRhAOpr+/jl8ieRLsoLIoAoYShEw08+fPhSJgJUSby1
	ijDLSCK2FFElltNaCbfiWVJtzg==
X-Google-Smtp-Source: AGHT+IH4OevxwLdDP7EAH6da8MNjfyDucK0T71oh2ATtzdL3blTdUBrBX8XMO1qTpBokJaOYaxBeSg==
X-Received: by 2002:a05:6870:b015:b0:1ef:cedd:5c32 with SMTP id y21-20020a056870b01500b001efcedd5c32mr474489oae.3.1700255772657;
        Fri, 17 Nov 2023 13:16:12 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:20c:b0:41c:b879:6082 with SMTP id
 b12-20020a05622a020c00b0041cb8796082ls2203203qtx.2.-pod-prod-09-us; Fri, 17
 Nov 2023 13:16:11 -0800 (PST)
X-Received: by 2002:a05:620a:618f:b0:77b:bdc0:5b96 with SMTP id or15-20020a05620a618f00b0077bbdc05b96mr799070qkn.25.1700255771773;
        Fri, 17 Nov 2023 13:16:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700255771; cv=none;
        d=google.com; s=arc-20160816;
        b=U+S4Fsyf60/EZM+e2mH1OfxGj6AxdH/4sRDjWb4VyD+JtFnAoTQhznsUxETyBl+OJ/
         1RS2V+BMK6zsc7uCzy6UMINcJV2XhFmmDaJe/yRUBXOp/NgbxJa+h400O087Az96IpPA
         IPkxU6kLWimOuip41tBKNdSwe+7Z6B2F2N2TebQ7eZT41nsIEamQEqZB3jge/MP/Rtq9
         qmxR3og9Rowze2PanZgLHr0a/Xd65QffJGkrgCs8HSRWu3NGbQqziT9IPYYtPBZoy9ZB
         BJZZgf5ow7kfwCEbwQAfgbAhb0y2JEDO/gLnSitjeUkPBclMpt7LX19swQMdBpKjFA5W
         rEvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=RAdHKgYpUek4Mt7/SzWhJ3QQTVPyo9j8DPb8bs9innY=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=SzWtEXVcyCXMjPhd7gS7L6+LU+9MGH29V7HuSGtijd0dCgGPDk1uUZQ/VP+6pNwh8i
         E9FpdvbGvDj5RqkDxsuoBK37r9Qos4GrEbkJp0aR5xglfp9GP2Sdddf75b7zpQySlNn4
         f0iGXN6JKcCYBLF5eA0DVy/8KyaB0iUIgeq7yOVYmLm0Fsg4ubQRaohbR/S8roTPmPjo
         mDLVRP3dmoBDxZTTxRFg8i5HV0RmWOcb8cNMAJ9C9xU2vP88ioKXbhMbxm5y1NqrdXiA
         bHEoZMrJUqtOlSjnpKo9qshQgE8716zP0fmBF3E7ZT2KULOdKy+54paxHfDeEHVv0wdo
         kdQw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.81 as internal address) smtp.mailfrom=dhowells@redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id pw9-20020a05620a63c900b00775d3ebaab5si2484116qkn.286.2023.11.17.13.16.11
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 13:16:11 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.81 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-671-oZ9ZRYigM4Cn7FimiSDVIw-1; Fri,
 17 Nov 2023 16:16:10 -0500
X-MC-Unique: oZ9ZRYigM4Cn7FimiSDVIw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B6CC91C060EB
	for <linux-cachefs@gapps.redhat.com>; Fri, 17 Nov 2023 21:16:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id B3BEA5038; Fri, 17 Nov 2023 21:16:09 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1FE995036;
	Fri, 17 Nov 2023 21:16:07 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>,
	Steve French <smfrench@gmail.com>
Cc: David Howells <dhowells@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Marc Dionne <marc.dionne@auristor.com>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	Christian Brauner <christian@brauner.io>,
	linux-cachefs@redhat.com,
	linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	v9fs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/51] netfs: Provide invalidate_folio and release_folio calls
Date: Fri, 17 Nov 2023 21:14:58 +0000
Message-ID: <20231117211544.1740466-7-dhowells@redhat.com>
In-Reply-To: <20231117211544.1740466-1-dhowells@redhat.com>
References: <20231117211544.1740466-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain gapps.redhat.com configured 207.211.31.81 as internal address) smtp.mailfrom=dhowells@redhat.com
Precedence: list
Mailing-list: list linux-cachefs@redhat.com; contact linux-cachefs+owners@redhat.com
List-ID: <linux-cachefs.redhat.com>
X-Spam-Checked-In-Group: linux-cachefs@redhat.com
X-Google-Group-Id: 998933772329
List-Post: <https://groups.google.com/a/redhat.com/group/linux-cachefs/post>, <mailto:linux-cachefs@redhat.com>
List-Help: <https://support.google.com/a/redhat.com/bin/topic.py?topic=25838>, <mailto:linux-cachefs+help@redhat.com>
List-Archive: <https://groups.google.com/a/redhat.com/group/linux-cachefs/>
List-Unsubscribe: <mailto:googlegroups-manage+998933772329+unsubscribe@googlegroups.com>,
 <https://groups.google.com/a/redhat.com/group/linux-cachefs/subscribe>

Provide default invalidate_folio and release_folio calls.  These will need
to interact with invalidation correctly at some point.  They will be needed
if netfslib is to make use of folio->private for its own purposes.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/9p/vfs_addr.c      | 33 ++-------------------------
 fs/afs/file.c         | 53 ++++---------------------------------------
 fs/ceph/addr.c        | 24 ++------------------
 fs/netfs/Makefile     |  1 +
 fs/netfs/misc.c       | 51 +++++++++++++++++++++++++++++++++++++++++
 include/linux/netfs.h |  6 +++--
 6 files changed, 64 insertions(+), 104 deletions(-)
 create mode 100644 fs/netfs/misc.c

diff --git a/fs/9p/vfs_addr.c b/fs/9p/vfs_addr.c
index 8a635999a7d6..18a666c43e4a 100644
--- a/fs/9p/vfs_addr.c
+++ b/fs/9p/vfs_addr.c
@@ -104,35 +104,6 @@ const struct netfs_request_ops v9fs_req_ops = {
 	.issue_read		= v9fs_issue_read,
 };
 
-/**
- * v9fs_release_folio - release the private state associated with a folio
- * @folio: The folio to be released
- * @gfp: The caller's allocation restrictions
- *
- * Returns true if the page can be released, false otherwise.
- */
-
-static bool v9fs_release_folio(struct folio *folio, gfp_t gfp)
-{
-	if (folio_test_private(folio))
-		return false;
-#ifdef CONFIG_9P_FSCACHE
-	if (folio_test_fscache(folio)) {
-		if (current_is_kswapd() || !(gfp & __GFP_FS))
-			return false;
-		folio_wait_fscache(folio);
-	}
-	fscache_note_page_release(v9fs_inode_cookie(V9FS_I(folio_inode(folio))));
-#endif
-	return true;
-}
-
-static void v9fs_invalidate_folio(struct folio *folio, size_t offset,
-				 size_t length)
-{
-	folio_wait_fscache(folio);
-}
-
 #ifdef CONFIG_9P_FSCACHE
 static void v9fs_write_to_cache_done(void *priv, ssize_t transferred_or_error,
 				     bool was_async)
@@ -355,8 +326,8 @@ const struct address_space_operations v9fs_addr_operations = {
 	.writepage = v9fs_vfs_writepage,
 	.write_begin = v9fs_write_begin,
 	.write_end = v9fs_write_end,
-	.release_folio = v9fs_release_folio,
-	.invalidate_folio = v9fs_invalidate_folio,
+	.release_folio = netfs_release_folio,
+	.invalidate_folio = netfs_invalidate_folio,
 	.launder_folio = v9fs_launder_folio,
 	.direct_IO = v9fs_direct_IO,
 };
diff --git a/fs/afs/file.c b/fs/afs/file.c
index 0c49b3b6f214..3fea5cd8ef13 100644
--- a/fs/afs/file.c
+++ b/fs/afs/file.c
@@ -20,9 +20,6 @@
 
 static int afs_file_mmap(struct file *file, struct vm_area_struct *vma);
 static int afs_symlink_read_folio(struct file *file, struct folio *folio);
-static void afs_invalidate_folio(struct folio *folio, size_t offset,
-			       size_t length);
-static bool afs_release_folio(struct folio *folio, gfp_t gfp_flags);
 
 static ssize_t afs_file_read_iter(struct kiocb *iocb, struct iov_iter *iter);
 static ssize_t afs_file_splice_read(struct file *in, loff_t *ppos,
@@ -57,8 +54,8 @@ const struct address_space_operations afs_file_aops = {
 	.readahead	= netfs_readahead,
 	.dirty_folio	= afs_dirty_folio,
 	.launder_folio	= afs_launder_folio,
-	.release_folio	= afs_release_folio,
-	.invalidate_folio = afs_invalidate_folio,
+	.release_folio	= netfs_release_folio,
+	.invalidate_folio = netfs_invalidate_folio,
 	.write_begin	= afs_write_begin,
 	.write_end	= afs_write_end,
 	.writepages	= afs_writepages,
@@ -67,8 +64,8 @@ const struct address_space_operations afs_file_aops = {
 
 const struct address_space_operations afs_symlink_aops = {
 	.read_folio	= afs_symlink_read_folio,
-	.release_folio	= afs_release_folio,
-	.invalidate_folio = afs_invalidate_folio,
+	.release_folio	= netfs_release_folio,
+	.invalidate_folio = netfs_invalidate_folio,
 	.migrate_folio	= filemap_migrate_folio,
 };
 
@@ -405,48 +402,6 @@ int afs_write_inode(struct inode *inode, struct writeback_control *wbc)
 	return 0;
 }
 
-/*
- * invalidate part or all of a page
- * - release a page and clean up its private data if offset is 0 (indicating
- *   the entire page)
- */
-static void afs_invalidate_folio(struct folio *folio, size_t offset,
-			       size_t length)
-{
-	_enter("{%lu},%zu,%zu", folio->index, offset, length);
-
-	folio_wait_fscache(folio);
-	_leave("");
-}
-
-/*
- * release a page and clean up its private state if it's not busy
- * - return true if the page can now be released, false if not
- */
-static bool afs_release_folio(struct folio *folio, gfp_t gfp)
-{
-	struct afs_vnode *vnode = AFS_FS_I(folio_inode(folio));
-
-	_enter("{{%llx:%llu}[%lu],%lx},%x",
-	       vnode->fid.vid, vnode->fid.vnode, folio_index(folio), folio->flags,
-	       gfp);
-
-	/* deny if folio is being written to the cache and the caller hasn't
-	 * elected to wait */
-#ifdef CONFIG_AFS_FSCACHE
-	if (folio_test_fscache(folio)) {
-		if (current_is_kswapd() || !(gfp & __GFP_FS))
-			return false;
-		folio_wait_fscache(folio);
-	}
-	fscache_note_page_release(afs_vnode_cache(vnode));
-#endif
-
-	/* Indicate that the folio can be released */
-	_leave(" = T");
-	return true;
-}
-
 static void afs_add_open_mmap(struct afs_vnode *vnode)
 {
 	if (atomic_inc_return(&vnode->cb_nr_mmap) == 1) {
diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index 85be3bf18cdf..03feb4dc6352 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -159,27 +159,7 @@ static void ceph_invalidate_folio(struct folio *folio, size_t offset,
 		ceph_put_snap_context(snapc);
 	}
 
-	folio_wait_fscache(folio);
-}
-
-static bool ceph_release_folio(struct folio *folio, gfp_t gfp)
-{
-	struct inode *inode = folio->mapping->host;
-	struct ceph_client *cl = ceph_inode_to_client(inode);
-
-	doutc(cl, "%llx.%llx idx %lu (%sdirty)\n", ceph_vinop(inode),
-	      folio->index, folio_test_dirty(folio) ? "" : "not ");
-
-	if (folio_test_private(folio))
-		return false;
-
-	if (folio_test_fscache(folio)) {
-		if (current_is_kswapd() || !(gfp & __GFP_FS))
-			return false;
-		folio_wait_fscache(folio);
-	}
-	ceph_fscache_note_page_release(inode);
-	return true;
+	netfs_invalidate_folio(folio, offset, length);
 }
 
 static void ceph_netfs_expand_readahead(struct netfs_io_request *rreq)
@@ -1586,7 +1566,7 @@ const struct address_space_operations ceph_aops = {
 	.write_end = ceph_write_end,
 	.dirty_folio = ceph_dirty_folio,
 	.invalidate_folio = ceph_invalidate_folio,
-	.release_folio = ceph_release_folio,
+	.release_folio = netfs_release_folio,
 	.direct_IO = noop_direct_IO,
 };
 
diff --git a/fs/netfs/Makefile b/fs/netfs/Makefile
index 386d6fb92793..cd22554d9048 100644
--- a/fs/netfs/Makefile
+++ b/fs/netfs/Makefile
@@ -5,6 +5,7 @@ netfs-y := \
 	io.o \
 	iterator.o \
 	main.o \
+	misc.o \
 	objects.o
 
 netfs-$(CONFIG_NETFS_STATS) += stats.o
diff --git a/fs/netfs/misc.c b/fs/netfs/misc.c
new file mode 100644
index 000000000000..c3baf2b247d9
--- /dev/null
+++ b/fs/netfs/misc.c
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Miscellaneous routines.
+ *
+ * Copyright (C) 2022 Red Hat, Inc. All Rights Reserved.
+ * Written by David Howells (dhowells@redhat.com)
+ */
+
+#include <linux/swap.h>
+#include "internal.h"
+
+/**
+ * netfs_invalidate_folio - Invalidate or partially invalidate a folio
+ * @folio: Folio proposed for release
+ * @offset: Offset of the invalidated region
+ * @length: Length of the invalidated region
+ *
+ * Invalidate part or all of a folio for a network filesystem.  The folio will
+ * be removed afterwards if the invalidated region covers the entire folio.
+ */
+void netfs_invalidate_folio(struct folio *folio, size_t offset, size_t length)
+{
+	_enter("{%lx},%zx,%zx", folio_index(folio), offset, length);
+
+	folio_wait_fscache(folio);
+}
+EXPORT_SYMBOL(netfs_invalidate_folio);
+
+/**
+ * netfs_release_folio - Try to release a folio
+ * @folio: Folio proposed for release
+ * @gfp: Flags qualifying the release
+ *
+ * Request release of a folio and clean up its private state if it's not busy.
+ * Returns true if the folio can now be released, false if not
+ */
+bool netfs_release_folio(struct folio *folio, gfp_t gfp)
+{
+	struct netfs_inode *ctx = netfs_inode(folio_inode(folio));
+
+	if (folio_test_private(folio))
+		return false;
+	if (folio_test_fscache(folio)) {
+		if (current_is_kswapd() || !(gfp & __GFP_FS))
+			return false;
+		folio_wait_fscache(folio);
+	}
+
+	fscache_note_page_release(netfs_i_cookie(ctx));
+	return true;
+}
+EXPORT_SYMBOL(netfs_release_folio);
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 0633cd9644e1..6e662832c3ae 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -297,8 +297,10 @@ struct readahead_control;
 void netfs_readahead(struct readahead_control *);
 int netfs_read_folio(struct file *, struct folio *);
 int netfs_write_begin(struct netfs_inode *, struct file *,
-		struct address_space *, loff_t pos, unsigned int len,
-		struct folio **, void **fsdata);
+		      struct address_space *, loff_t pos, unsigned int len,
+		      struct folio **, void **fsdata);
+void netfs_invalidate_folio(struct folio *folio, size_t offset, size_t length);
+bool netfs_release_folio(struct folio *folio, gfp_t gfp);
 
 void netfs_subreq_terminated(struct netfs_io_subrequest *, ssize_t, bool);
 void netfs_get_subrequest(struct netfs_io_subrequest *subreq,

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

