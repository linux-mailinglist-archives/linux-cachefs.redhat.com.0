Return-Path: <linux-cachefs+bncBDLIXLMFVAERBE7ZSCWAMGQES6VT7PI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mail.lfdr.de (Postfix) with ESMTPS id 413E181B751
	for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 14:24:36 +0100 (CET)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-67ec592bc29sf11537786d6.0
        for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 05:24:36 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1703165075; cv=pass;
        d=google.com; s=arc-20160816;
        b=C8zX4xTSHr2MVMK3I4RlXvXsH1DmkAf4nYxUR6H/i1oy1FM7U2g2sQ6t0iLXztcGOz
         jUvLnZpcOOa6oylw/oMK1UDwtvS011lqQ2UAHxElq2CxbUweCIOPEZVIkhlBq5BfbJ6D
         OGQOoX137jDkIfaPIDTUt1nms2o3i7s8vmiRLmnWGkBKrsPwlQJpG+mgByO4vIVInyiY
         bTxQV+543WQRc4tWNcNAny+Cnxj0Uuwdedm9guCn0RS1ytA0kq1Qha43rgPLqx7TD6/I
         7ZaiV1gVhAVnp2prt1bpRy+gcGK2hvGgl5nW8HSF1PMgIdVfhaH2NShSZAncZdX/oibt
         CGDw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=hRjRq0EQ3voK/B3LtXn5lI949qpYgLrJIP6+q6hZxXo=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=nHbzxbfV8LHpKdhpog2XovsgntXfqAozZ8w+lEw2WeLspcR9uUUeu6U3/CNv0fjNNh
         SHLi+gU+b6ky2YiW/vD63dIw/91WmnQYnDrWVz+mq9ITLty77GMiYKovMK/gaUS6+0ZH
         j6iS6fjBEP4jLLxQw4cDBE3+8kDqHy1hIY/cWRkwV92kJNIqIGHpe2yPbxCBa7erErbf
         Xfwea7bIA5K3h6uOzuR3inBWkX+sQMASQrg5LWlucdAaGYkvYB5WYNMK8DQ5bB8Iovw2
         010g/fY0nx7NWKbdC1ylQVylM2MuCab+G/VTkuzL6zc9Pd53iw0fyzRxWkYzbwoCmlSS
         33KQ==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703165075; x=1703769875;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hRjRq0EQ3voK/B3LtXn5lI949qpYgLrJIP6+q6hZxXo=;
        b=dB5VrmzdSEN+fi7M3G/T6YppJlcoXBEgfpQTGR37zxB81moqcKQLsU030sJ/9PBxAj
         XnBXIkX4AEtg1lqpwmxy8GVZ92V6a3snu7o5U+aw4WQpEsF/kvVXaXlkDIypnlW8Pykw
         ZU/ZtDv4fYNIH3W/Q6zyR9W+vAFhqpDztaBYo797TRdHagbxQ/QXSlSoYK7X/HrYjXtU
         31ogBHLIO2MqxWAohRILhfSBZeYa+tGO9Btdx5fo56vkmuCN57Z/qTKUTNvlMnJ4Ikx6
         eoTTXDdOUWsuZUlkgyQbHbiyYXGRSCunX5i/KT3qydljKP6Ltkhvkfu4wR1wO0C4CDFj
         FgMw==
X-Gm-Message-State: AOJu0YwG8JRe5vX3wOhB68Z2jgFQlSwlIXgztm2iPEUP0nT3plFXlvwK
	Ao+HXncYEpuVdBQ+mspc+faqbg==
X-Google-Smtp-Source: AGHT+IHZgXBKxXQE7bzXYiKOmcXSXD/co7eV2qTqI/Rgbtjx6G+K0cIpbisWz5O04Xjt/Y2A4GL38Q==
X-Received: by 2002:a05:6214:40c:b0:67a:a721:f32d with SMTP id z12-20020a056214040c00b0067aa721f32dmr29696224qvx.109.1703165075219;
        Thu, 21 Dec 2023 05:24:35 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ad4:5c6a:0:b0:67f:7fe9:75 with SMTP id i10-20020ad45c6a000000b0067f7fe90075ls1368344qvh.1.-pod-prod-09-us;
 Thu, 21 Dec 2023 05:24:34 -0800 (PST)
X-Received: by 2002:a37:de0d:0:b0:781:258d:2199 with SMTP id h13-20020a37de0d000000b00781258d2199mr252241qkj.149.1703165074718;
        Thu, 21 Dec 2023 05:24:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703165074; cv=none;
        d=google.com; s=arc-20160816;
        b=J5TM+w4k5cp023UeR3I1vnG4wEi2W2wxQb6QeXURKrM6j6D13JqQl43Opuf+2myQaS
         GaRV/UE2lfLLZOFtYgEko9J7uvMRc1TMoOjMVXAvMFp1HBMn7z0UsOfu0LbkUWN1Rhji
         xyUSKmNNVvsx9XAl5bJa/LSkdvUyzeEDkgICi9DnD48H2jTvxYqpCXbjmkKf/gyi/5uR
         SHiTSGbszEbUzgBGrKlOe+Op9JQZLQBLOcshqIcOnGiLBkD4ohO1/F7BQklXI/YlVqvL
         FsG5087X1MVkfiEpgC6IyaThtWVtMNXpuNo5sCWyaah1xs282YGKVNUzHpzpqgFMlFdB
         lYkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=B/DJy8HCQzr9VTruq/PRKZ7qW/X7SwsgSMPJwRDbzq8=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=Sb8mrL2+uZDOF9yGbtAGQfH+XNBm9ideFMh0JaUD0/YdzbLiVstOc+cb0quPdqY2B+
         qx8YpDhfCTb35hhBZJFtYhCvGZhiAS2ue7eOUgZ2H+oia6cJOWqoX7wMBikp96hU3C/b
         nrHnGKNamy4l6B5vRa7kpElLW6M39ywsXolXRD/aX6aXhrARPCiCeNodpfqZnAQNo9EE
         T1Jz7J6yMull7u6kkwwX0Hb9S/zBTUJWICzketAFBiRtDAlWEwnFNY/tomyejz5MJKn5
         Vle/kBIoyk87chGIa+KCF4Lgcey0jn6yJwfNcGqfbgTZQ5PGjpbGj9bz0LR5CkX5SatM
         EA4g==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id po27-20020a05620a385b00b0077f09c6aeadsi2010836qkn.145.2023.12.21.05.24.34
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 05:24:34 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-386-hrBwPT_jNgW_rDtKBwUyag-1; Thu,
 21 Dec 2023 08:24:32 -0500
X-MC-Unique: hrBwPT_jNgW_rDtKBwUyag-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AEBB93C000B4
	for <linux-cachefs@gapps.redhat.com>; Thu, 21 Dec 2023 13:24:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id AB7D1112132A; Thu, 21 Dec 2023 13:24:32 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.39.195.169])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9DDD81121313;
	Thu, 21 Dec 2023 13:24:29 +0000 (UTC)
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
	Eric Van Hensbergen <ericvh@kernel.org>,
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
Subject: [PATCH v5 07/40] netfs: Move pinning-for-writeback from fscache to netfs
Date: Thu, 21 Dec 2023 13:23:02 +0000
Message-ID: <20231221132400.1601991-8-dhowells@redhat.com>
In-Reply-To: <20231221132400.1601991-1-dhowells@redhat.com>
References: <20231221132400.1601991-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
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

Move the resource pinning-for-writeback from fscache code to netfslib code.
This is used to keep a cache backing object pinned whilst we have dirty
pages on the netfs inode in the pagecache such that VM writeback will be
able to reach it.

Whilst we're at it, switch the parameters of netfs_unpin_writeback() to
match ->write_inode() so that it can be used for that directly.

Note that this mechanism could be more generically useful than that for
network filesystems.  Quite often they have to keep around other resources
(e.g. authentication tokens or network connections) until the writeback is
complete.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/9p/vfs_addr.c          | 33 ++++-----------
 fs/9p/vfs_inode.c         |  3 +-
 fs/9p/vfs_super.c         | 14 +------
 fs/afs/file.c             |  8 +---
 fs/afs/inode.c            |  2 +-
 fs/afs/internal.h         |  6 ---
 fs/afs/super.c            |  2 +-
 fs/afs/write.c            |  9 ----
 fs/ceph/cache.h           | 23 ++++-------
 fs/ceph/inode.c           |  2 +-
 fs/fs-writeback.c         | 10 ++---
 fs/netfs/Makefile         |  1 +
 fs/netfs/fscache_io.c     | 40 ------------------
 fs/netfs/misc.c           | 86 +++++++++++++++++++++++++++++++++++++++
 fs/smb/client/cifsfs.c    |  5 +--
 fs/smb/client/file.c      | 18 +-------
 include/linux/fs.h        |  2 +-
 include/linux/fscache.h   | 42 -------------------
 include/linux/netfs.h     |  3 ++
 include/linux/writeback.h |  2 +-
 20 files changed, 124 insertions(+), 187 deletions(-)
 create mode 100644 fs/netfs/misc.c

diff --git a/fs/9p/vfs_addr.c b/fs/9p/vfs_addr.c
index 39db7c01e30a..131b83c31f85 100644
--- a/fs/9p/vfs_addr.c
+++ b/fs/9p/vfs_addr.c
@@ -317,30 +317,15 @@ static int v9fs_write_end(struct file *filp, struct address_space *mapping,
 	return copied;
 }
 
-#ifdef CONFIG_9P_FSCACHE
-/*
- * Mark a page as having been made dirty and thus needing writeback.  We also
- * need to pin the cache object to write back to.
- */
-static bool v9fs_dirty_folio(struct address_space *mapping, struct folio *folio)
-{
-	struct v9fs_inode *v9inode = V9FS_I(mapping->host);
-
-	return fscache_dirty_folio(mapping, folio, v9fs_inode_cookie(v9inode));
-}
-#else
-#define v9fs_dirty_folio filemap_dirty_folio
-#endif
-
 const struct address_space_operations v9fs_addr_operations = {
-	.read_folio = netfs_read_folio,
-	.readahead = netfs_readahead,
-	.dirty_folio = v9fs_dirty_folio,
-	.writepage = v9fs_vfs_writepage,
-	.write_begin = v9fs_write_begin,
-	.write_end = v9fs_write_end,
-	.release_folio = v9fs_release_folio,
+	.read_folio	= netfs_read_folio,
+	.readahead	= netfs_readahead,
+	.dirty_folio	= netfs_dirty_folio,
+	.writepage	= v9fs_vfs_writepage,
+	.write_begin	= v9fs_write_begin,
+	.write_end	= v9fs_write_end,
+	.release_folio	= v9fs_release_folio,
 	.invalidate_folio = v9fs_invalidate_folio,
-	.launder_folio = v9fs_launder_folio,
-	.direct_IO = v9fs_direct_IO,
+	.launder_folio	= v9fs_launder_folio,
+	.direct_IO	= v9fs_direct_IO,
 };
diff --git a/fs/9p/vfs_inode.c b/fs/9p/vfs_inode.c
index b845ee18a80b..74122540e00f 100644
--- a/fs/9p/vfs_inode.c
+++ b/fs/9p/vfs_inode.c
@@ -376,8 +376,7 @@ void v9fs_evict_inode(struct inode *inode)
 
 #ifdef CONFIG_9P_FSCACHE
 	version = cpu_to_le32(v9inode->qid.version);
-	fscache_clear_inode_writeback(v9fs_inode_cookie(v9inode), inode,
-				      &version);
+	netfs_clear_inode_writeback(inode, &version);
 #endif
 
 	clear_inode(inode);
diff --git a/fs/9p/vfs_super.c b/fs/9p/vfs_super.c
index 73db55c050bf..941f7d0e0bfa 100644
--- a/fs/9p/vfs_super.c
+++ b/fs/9p/vfs_super.c
@@ -289,31 +289,21 @@ static int v9fs_drop_inode(struct inode *inode)
 static int v9fs_write_inode(struct inode *inode,
 			    struct writeback_control *wbc)
 {
-	struct v9fs_inode *v9inode;
-
 	/*
 	 * send an fsync request to server irrespective of
 	 * wbc->sync_mode.
 	 */
 	p9_debug(P9_DEBUG_VFS, "%s: inode %p\n", __func__, inode);
-
-	v9inode = V9FS_I(inode);
-	fscache_unpin_writeback(wbc, v9fs_inode_cookie(v9inode));
-
-	return 0;
+	return netfs_unpin_writeback(inode, wbc);
 }
 
 static int v9fs_write_inode_dotl(struct inode *inode,
 				 struct writeback_control *wbc)
 {
-	struct v9fs_inode *v9inode;
 
-	v9inode = V9FS_I(inode);
 	p9_debug(P9_DEBUG_VFS, "%s: inode %p\n", __func__, inode);
 
-	fscache_unpin_writeback(wbc, v9fs_inode_cookie(v9inode));
-
-	return 0;
+	return netfs_unpin_writeback(inode, wbc);
 }
 
 static const struct super_operations v9fs_super_ops = {
diff --git a/fs/afs/file.c b/fs/afs/file.c
index 8c17e37c2e59..9142fda7dbd6 100644
--- a/fs/afs/file.c
+++ b/fs/afs/file.c
@@ -55,7 +55,7 @@ const struct inode_operations afs_file_inode_operations = {
 const struct address_space_operations afs_file_aops = {
 	.read_folio	= netfs_read_folio,
 	.readahead	= netfs_readahead,
-	.dirty_folio	= afs_dirty_folio,
+	.dirty_folio	= netfs_dirty_folio,
 	.launder_folio	= afs_launder_folio,
 	.release_folio	= afs_release_folio,
 	.invalidate_folio = afs_invalidate_folio,
@@ -386,12 +386,6 @@ const struct netfs_request_ops afs_req_ops = {
 	.issue_read		= afs_issue_read,
 };
 
-int afs_write_inode(struct inode *inode, struct writeback_control *wbc)
-{
-	fscache_unpin_writeback(wbc, afs_vnode_cache(AFS_FS_I(inode)));
-	return 0;
-}
-
 /*
  * Adjust the dirty region of the page on truncation or full invalidation,
  * getting rid of the markers altogether if the region is entirely invalidated.
diff --git a/fs/afs/inode.c b/fs/afs/inode.c
index 78efc9719349..6f375f0cf650 100644
--- a/fs/afs/inode.c
+++ b/fs/afs/inode.c
@@ -823,7 +823,7 @@ void afs_evict_inode(struct inode *inode)
 	truncate_inode_pages_final(&inode->i_data);
 
 	afs_set_cache_aux(vnode, &aux);
-	fscache_clear_inode_writeback(afs_vnode_cache(vnode), inode, &aux);
+	netfs_clear_inode_writeback(inode, &aux);
 	clear_inode(inode);
 
 	while (!list_empty(&vnode->wb_keys)) {
diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index a812952be1c9..2bea59ec533e 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -1072,7 +1072,6 @@ extern int afs_release(struct inode *, struct file *);
 extern int afs_fetch_data(struct afs_vnode *, struct afs_read *);
 extern struct afs_read *afs_alloc_read(gfp_t);
 extern void afs_put_read(struct afs_read *);
-extern int afs_write_inode(struct inode *, struct writeback_control *);
 
 static inline struct afs_read *afs_get_read(struct afs_read *req)
 {
@@ -1520,11 +1519,6 @@ extern int afs_check_volume_status(struct afs_volume *, struct afs_operation *);
 /*
  * write.c
  */
-#ifdef CONFIG_AFS_FSCACHE
-bool afs_dirty_folio(struct address_space *, struct folio *);
-#else
-#define afs_dirty_folio filemap_dirty_folio
-#endif
 extern int afs_write_begin(struct file *file, struct address_space *mapping,
 			loff_t pos, unsigned len,
 			struct page **pagep, void **fsdata);
diff --git a/fs/afs/super.c b/fs/afs/super.c
index a01a0fb2cdbb..4f1b0492f1c5 100644
--- a/fs/afs/super.c
+++ b/fs/afs/super.c
@@ -55,7 +55,7 @@ int afs_net_id;
 static const struct super_operations afs_super_ops = {
 	.statfs		= afs_statfs,
 	.alloc_inode	= afs_alloc_inode,
-	.write_inode	= afs_write_inode,
+	.write_inode	= netfs_unpin_writeback,
 	.drop_inode	= afs_drop_inode,
 	.destroy_inode	= afs_destroy_inode,
 	.free_inode	= afs_free_inode,
diff --git a/fs/afs/write.c b/fs/afs/write.c
index 4a168781936b..e40cf8e7543a 100644
--- a/fs/afs/write.c
+++ b/fs/afs/write.c
@@ -23,15 +23,6 @@ static void afs_write_to_cache(struct afs_vnode *vnode, loff_t start, size_t len
 			       loff_t i_size, bool caching);
 
 #ifdef CONFIG_AFS_FSCACHE
-/*
- * Mark a page as having been made dirty and thus needing writeback.  We also
- * need to pin the cache object to write back to.
- */
-bool afs_dirty_folio(struct address_space *mapping, struct folio *folio)
-{
-	return fscache_dirty_folio(mapping, folio,
-				afs_vnode_cache(AFS_FS_I(mapping->host)));
-}
 static void afs_folio_start_fscache(bool caching, struct folio *folio)
 {
 	if (caching)
diff --git a/fs/ceph/cache.h b/fs/ceph/cache.h
index b804f1094764..8fc7d828d990 100644
--- a/fs/ceph/cache.h
+++ b/fs/ceph/cache.h
@@ -43,19 +43,13 @@ static inline void ceph_fscache_resize(struct inode *inode, loff_t to)
 	}
 }
 
-static inline void ceph_fscache_unpin_writeback(struct inode *inode,
+static inline int ceph_fscache_unpin_writeback(struct inode *inode,
 						struct writeback_control *wbc)
 {
-	fscache_unpin_writeback(wbc, ceph_fscache_cookie(ceph_inode(inode)));
+	return netfs_unpin_writeback(inode, wbc);
 }
 
-static inline int ceph_fscache_dirty_folio(struct address_space *mapping,
-		struct folio *folio)
-{
-	struct ceph_inode_info *ci = ceph_inode(mapping->host);
-
-	return fscache_dirty_folio(mapping, folio, ceph_fscache_cookie(ci));
-}
+#define ceph_fscache_dirty_folio netfs_dirty_folio
 
 static inline bool ceph_is_cache_enabled(struct inode *inode)
 {
@@ -112,16 +106,13 @@ static inline void ceph_fscache_resize(struct inode *inode, loff_t to)
 {
 }
 
-static inline void ceph_fscache_unpin_writeback(struct inode *inode,
-						struct writeback_control *wbc)
+static inline int ceph_fscache_unpin_writeback(struct inode *inode,
+					       struct writeback_control *wbc)
 {
+	return 0;
 }
 
-static inline int ceph_fscache_dirty_folio(struct address_space *mapping,
-		struct folio *folio)
-{
-	return filemap_dirty_folio(mapping, folio);
-}
+#define ceph_fscache_dirty_folio filemap_dirty_folio
 
 static inline bool ceph_is_cache_enabled(struct inode *inode)
 {
diff --git a/fs/ceph/inode.c b/fs/ceph/inode.c
index 0679240f06db..3149d79a9dbe 100644
--- a/fs/ceph/inode.c
+++ b/fs/ceph/inode.c
@@ -694,7 +694,7 @@ void ceph_evict_inode(struct inode *inode)
 	percpu_counter_dec(&mdsc->metric.total_inodes);
 
 	truncate_inode_pages_final(&inode->i_data);
-	if (inode->i_state & I_PINNING_FSCACHE_WB)
+	if (inode->i_state & I_PINNING_NETFS_WB)
 		ceph_fscache_unuse_cookie(inode, true);
 	clear_inode(inode);
 
diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
index 1767493dffda..3d84fcc471c6 100644
--- a/fs/fs-writeback.c
+++ b/fs/fs-writeback.c
@@ -1675,11 +1675,11 @@ __writeback_single_inode(struct inode *inode, struct writeback_control *wbc)
 
 	if (mapping_tagged(mapping, PAGECACHE_TAG_DIRTY))
 		inode->i_state |= I_DIRTY_PAGES;
-	else if (unlikely(inode->i_state & I_PINNING_FSCACHE_WB)) {
+	else if (unlikely(inode->i_state & I_PINNING_NETFS_WB)) {
 		if (!(inode->i_state & I_DIRTY_PAGES)) {
-			inode->i_state &= ~I_PINNING_FSCACHE_WB;
-			wbc->unpinned_fscache_wb = true;
-			dirty |= I_PINNING_FSCACHE_WB; /* Cause write_inode */
+			inode->i_state &= ~I_PINNING_NETFS_WB;
+			wbc->unpinned_netfs_wb = true;
+			dirty |= I_PINNING_NETFS_WB; /* Cause write_inode */
 		}
 	}
 
@@ -1691,7 +1691,7 @@ __writeback_single_inode(struct inode *inode, struct writeback_control *wbc)
 		if (ret == 0)
 			ret = err;
 	}
-	wbc->unpinned_fscache_wb = false;
+	wbc->unpinned_netfs_wb = false;
 	trace_writeback_single_inode(inode, wbc, nr_to_write);
 	return ret;
 }
diff --git a/fs/netfs/Makefile b/fs/netfs/Makefile
index b57162ef9cfb..a84fe9bbd3c4 100644
--- a/fs/netfs/Makefile
+++ b/fs/netfs/Makefile
@@ -5,6 +5,7 @@ netfs-y := \
 	io.o \
 	iterator.o \
 	main.o \
+	misc.o \
 	objects.o
 
 netfs-$(CONFIG_NETFS_STATS) += stats.o
diff --git a/fs/netfs/fscache_io.c b/fs/netfs/fscache_io.c
index 0d2b8dec8f82..79171a687930 100644
--- a/fs/netfs/fscache_io.c
+++ b/fs/netfs/fscache_io.c
@@ -158,46 +158,6 @@ int __fscache_begin_write_operation(struct netfs_cache_resources *cres,
 }
 EXPORT_SYMBOL(__fscache_begin_write_operation);
 
-/**
- * fscache_dirty_folio - Mark folio dirty and pin a cache object for writeback
- * @mapping: The mapping the folio belongs to.
- * @folio: The folio being dirtied.
- * @cookie: The cookie referring to the cache object
- *
- * Set the dirty flag on a folio and pin an in-use cache object in memory
- * so that writeback can later write to it.  This is intended
- * to be called from the filesystem's ->dirty_folio() method.
- *
- * Return: true if the dirty flag was set on the folio, false otherwise.
- */
-bool fscache_dirty_folio(struct address_space *mapping, struct folio *folio,
-				struct fscache_cookie *cookie)
-{
-	struct inode *inode = mapping->host;
-	bool need_use = false;
-
-	_enter("");
-
-	if (!filemap_dirty_folio(mapping, folio))
-		return false;
-	if (!fscache_cookie_valid(cookie))
-		return true;
-
-	if (!(inode->i_state & I_PINNING_FSCACHE_WB)) {
-		spin_lock(&inode->i_lock);
-		if (!(inode->i_state & I_PINNING_FSCACHE_WB)) {
-			inode->i_state |= I_PINNING_FSCACHE_WB;
-			need_use = true;
-		}
-		spin_unlock(&inode->i_lock);
-
-		if (need_use)
-			fscache_use_cookie(cookie, true);
-	}
-	return true;
-}
-EXPORT_SYMBOL(fscache_dirty_folio);
-
 struct fscache_write_request {
 	struct netfs_cache_resources cache_resources;
 	struct address_space	*mapping;
diff --git a/fs/netfs/misc.c b/fs/netfs/misc.c
new file mode 100644
index 000000000000..68baf55c47a4
--- /dev/null
+++ b/fs/netfs/misc.c
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Miscellaneous routines.
+ *
+ * Copyright (C) 2023 Red Hat, Inc. All Rights Reserved.
+ * Written by David Howells (dhowells@redhat.com)
+ */
+
+#include <linux/swap.h>
+#include "internal.h"
+
+/**
+ * netfs_dirty_folio - Mark folio dirty and pin a cache object for writeback
+ * @mapping: The mapping the folio belongs to.
+ * @folio: The folio being dirtied.
+ *
+ * Set the dirty flag on a folio and pin an in-use cache object in memory so
+ * that writeback can later write to it.  This is intended to be called from
+ * the filesystem's ->dirty_folio() method.
+ *
+ * Return: true if the dirty flag was set on the folio, false otherwise.
+ */
+bool netfs_dirty_folio(struct address_space *mapping, struct folio *folio)
+{
+	struct inode *inode = mapping->host;
+	struct netfs_inode *ictx = netfs_inode(inode);
+	struct fscache_cookie *cookie = netfs_i_cookie(ictx);
+	bool need_use = false;
+
+	_enter("");
+
+	if (!filemap_dirty_folio(mapping, folio))
+		return false;
+	if (!fscache_cookie_valid(cookie))
+		return true;
+
+	if (!(inode->i_state & I_PINNING_NETFS_WB)) {
+		spin_lock(&inode->i_lock);
+		if (!(inode->i_state & I_PINNING_NETFS_WB)) {
+			inode->i_state |= I_PINNING_NETFS_WB;
+			need_use = true;
+		}
+		spin_unlock(&inode->i_lock);
+
+		if (need_use)
+			fscache_use_cookie(cookie, true);
+	}
+	return true;
+}
+EXPORT_SYMBOL(netfs_dirty_folio);
+
+/**
+ * netfs_unpin_writeback - Unpin writeback resources
+ * @inode: The inode on which the cookie resides
+ * @wbc: The writeback control
+ *
+ * Unpin the writeback resources pinned by netfs_dirty_folio().  This is
+ * intended to be called as/by the netfs's ->write_inode() method.
+ */
+int netfs_unpin_writeback(struct inode *inode, struct writeback_control *wbc)
+{
+	struct fscache_cookie *cookie = netfs_i_cookie(netfs_inode(inode));
+
+	if (wbc->unpinned_netfs_wb)
+		fscache_unuse_cookie(cookie, NULL, NULL);
+	return 0;
+}
+EXPORT_SYMBOL(netfs_unpin_writeback);
+
+/**
+ * netfs_clear_inode_writeback - Clear writeback resources pinned by an inode
+ * @inode: The inode to clean up
+ * @aux: Auxiliary data to apply to the inode
+ *
+ * Clear any writeback resources held by an inode when the inode is evicted.
+ * This must be called before clear_inode() is called.
+ */
+void netfs_clear_inode_writeback(struct inode *inode, const void *aux)
+{
+	struct fscache_cookie *cookie = netfs_i_cookie(netfs_inode(inode));
+
+	if (inode->i_state & I_PINNING_NETFS_WB) {
+		loff_t i_size = i_size_read(inode);
+		fscache_unuse_cookie(cookie, aux, &i_size);
+	}
+}
+EXPORT_SYMBOL(netfs_clear_inode_writeback);
diff --git a/fs/smb/client/cifsfs.c b/fs/smb/client/cifsfs.c
index 2131638f26d0..96a65cf9b5ec 100644
--- a/fs/smb/client/cifsfs.c
+++ b/fs/smb/client/cifsfs.c
@@ -429,7 +429,7 @@ static void
 cifs_evict_inode(struct inode *inode)
 {
 	truncate_inode_pages_final(&inode->i_data);
-	if (inode->i_state & I_PINNING_FSCACHE_WB)
+	if (inode->i_state & I_PINNING_NETFS_WB)
 		cifs_fscache_unuse_inode_cookie(inode, true);
 	cifs_fscache_release_inode_cookie(inode);
 	clear_inode(inode);
@@ -792,8 +792,7 @@ static int cifs_show_stats(struct seq_file *s, struct dentry *root)
 
 static int cifs_write_inode(struct inode *inode, struct writeback_control *wbc)
 {
-	fscache_unpin_writeback(wbc, cifs_inode_cookie(inode));
-	return 0;
+	return netfs_unpin_writeback(inode, wbc);
 }
 
 static int cifs_drop_inode(struct inode *inode)
diff --git a/fs/smb/client/file.c b/fs/smb/client/file.c
index cf17e3dd703e..22be7587fcaf 100644
--- a/fs/smb/client/file.c
+++ b/fs/smb/client/file.c
@@ -5043,27 +5043,13 @@ static void cifs_swap_deactivate(struct file *file)
 	/* do we need to unpin (or unlock) the file */
 }
 
-/*
- * Mark a page as having been made dirty and thus needing writeback.  We also
- * need to pin the cache object to write back to.
- */
-#ifdef CONFIG_CIFS_FSCACHE
-static bool cifs_dirty_folio(struct address_space *mapping, struct folio *folio)
-{
-	return fscache_dirty_folio(mapping, folio,
-					cifs_inode_cookie(mapping->host));
-}
-#else
-#define cifs_dirty_folio filemap_dirty_folio
-#endif
-
 const struct address_space_operations cifs_addr_ops = {
 	.read_folio = cifs_read_folio,
 	.readahead = cifs_readahead,
 	.writepages = cifs_writepages,
 	.write_begin = cifs_write_begin,
 	.write_end = cifs_write_end,
-	.dirty_folio = cifs_dirty_folio,
+	.dirty_folio = netfs_dirty_folio,
 	.release_folio = cifs_release_folio,
 	.direct_IO = cifs_direct_io,
 	.invalidate_folio = cifs_invalidate_folio,
@@ -5087,7 +5073,7 @@ const struct address_space_operations cifs_addr_ops_smallbuf = {
 	.writepages = cifs_writepages,
 	.write_begin = cifs_write_begin,
 	.write_end = cifs_write_end,
-	.dirty_folio = cifs_dirty_folio,
+	.dirty_folio = netfs_dirty_folio,
 	.release_folio = cifs_release_folio,
 	.invalidate_folio = cifs_invalidate_folio,
 	.launder_folio = cifs_launder_folio,
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 98b7a7a8c42e..68a957261694 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2294,7 +2294,7 @@ static inline void kiocb_clone(struct kiocb *kiocb, struct kiocb *kiocb_src,
 #define I_CREATING		(1 << 15)
 #define I_DONTCACHE		(1 << 16)
 #define I_SYNC_QUEUED		(1 << 17)
-#define I_PINNING_FSCACHE_WB	(1 << 18)
+#define I_PINNING_NETFS_WB	(1 << 18)
 
 #define I_DIRTY_INODE (I_DIRTY_SYNC | I_DIRTY_DATASYNC)
 #define I_DIRTY (I_DIRTY_INODE | I_DIRTY_PAGES)
diff --git a/include/linux/fscache.h b/include/linux/fscache.h
index 9ed6696aee7a..6e8562cbcc43 100644
--- a/include/linux/fscache.h
+++ b/include/linux/fscache.h
@@ -626,48 +626,6 @@ static inline void fscache_write_to_cache(struct fscache_cookie *cookie,
 
 }
 
-#if __fscache_available
-bool fscache_dirty_folio(struct address_space *mapping, struct folio *folio,
-		struct fscache_cookie *cookie);
-#else
-#define fscache_dirty_folio(MAPPING, FOLIO, COOKIE) \
-		filemap_dirty_folio(MAPPING, FOLIO)
-#endif
-
-/**
- * fscache_unpin_writeback - Unpin writeback resources
- * @wbc: The writeback control
- * @cookie: The cookie referring to the cache object
- *
- * Unpin the writeback resources pinned by fscache_dirty_folio().  This is
- * intended to be called by the netfs's ->write_inode() method.
- */
-static inline void fscache_unpin_writeback(struct writeback_control *wbc,
-					   struct fscache_cookie *cookie)
-{
-	if (wbc->unpinned_fscache_wb)
-		fscache_unuse_cookie(cookie, NULL, NULL);
-}
-
-/**
- * fscache_clear_inode_writeback - Clear writeback resources pinned by an inode
- * @cookie: The cookie referring to the cache object
- * @inode: The inode to clean up
- * @aux: Auxiliary data to apply to the inode
- *
- * Clear any writeback resources held by an inode when the inode is evicted.
- * This must be called before clear_inode() is called.
- */
-static inline void fscache_clear_inode_writeback(struct fscache_cookie *cookie,
-						 struct inode *inode,
-						 const void *aux)
-{
-	if (inode->i_state & I_PINNING_FSCACHE_WB) {
-		loff_t i_size = i_size_read(inode);
-		fscache_unuse_cookie(cookie, aux, &i_size);
-	}
-}
-
 /**
  * fscache_note_page_release - Note that a netfs page got released
  * @cookie: The cookie corresponding to the file
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 9bd91cd615d5..32faf6c89702 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -288,6 +288,9 @@ int netfs_read_folio(struct file *, struct folio *);
 int netfs_write_begin(struct netfs_inode *, struct file *,
 		struct address_space *, loff_t pos, unsigned int len,
 		struct folio **, void **fsdata);
+bool netfs_dirty_folio(struct address_space *mapping, struct folio *folio);
+int netfs_unpin_writeback(struct inode *inode, struct writeback_control *wbc);
+void netfs_clear_inode_writeback(struct inode *inode, const void *aux);
 
 void netfs_subreq_terminated(struct netfs_io_subrequest *, ssize_t, bool);
 void netfs_get_subrequest(struct netfs_io_subrequest *subreq,
diff --git a/include/linux/writeback.h b/include/linux/writeback.h
index 083387c00f0c..1e08392fb43e 100644
--- a/include/linux/writeback.h
+++ b/include/linux/writeback.h
@@ -60,7 +60,7 @@ struct writeback_control {
 	unsigned for_reclaim:1;		/* Invoked from the page allocator */
 	unsigned range_cyclic:1;	/* range_start is cyclic */
 	unsigned for_sync:1;		/* sync(2) WB_SYNC_ALL writeback */
-	unsigned unpinned_fscache_wb:1;	/* Cleared I_PINNING_FSCACHE_WB */
+	unsigned unpinned_netfs_wb:1;	/* Cleared I_PINNING_NETFS_WB */
 
 	/*
 	 * When writeback IOs are bounced through async layers, only the

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

