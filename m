Return-Path: <linux-cachefs+bncBDLIXLMFVAERBJXZSCWAMGQEVB36IOI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mail.lfdr.de (Postfix) with ESMTPS id 3610181B75A
	for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 14:24:55 +0100 (CET)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-67abf4618a2sf13558646d6.0
        for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 05:24:55 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1703165094; cv=pass;
        d=google.com; s=arc-20160816;
        b=qynIkxPiTeitg8wc7Ps1rG2bS3DOl0Apz7Yz2wHQTsKpvMVqnPa7uKDm1lrgRk4KG8
         AHG7m0TH6F23itAfmeQVV/zMkBNgWeiJ67KFFQW0cIkNTKbB4LY0sITlO9WVcEvYv6DQ
         VyC7N7OWOLWUypAeNteLDg1Dn0ljmqxEO0klmw2jSh9RrV2W8P+UFISMMJ4XjoagGD6A
         6lno4sBVNL9iXab0j5dgdCcFIe2L97g1W4f0ONbe7cNqTCnvhmCLJd/VBPyGL5HNYcc9
         703PwXu3KBGpcj80bDPFbW+nZf6IbUWP2NwIkwMs0ZL8i6ri15yXGCt69L+qxmsU/+t8
         ljcg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=Sc2VXLV/jtlqrJRMWG3rz0JeIbxjVA+obKylcgEIyCw=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=WERJIFxbULF1YhZ2sW6s9XWnhs3bKjdGpY4gHu3MjOkseW42tp54DDe+EyFw6fhuPB
         aLvycqnGtcvQGuZGCTNep49GIhiQ3afss/Mz/nkbyRGG6mwTv2tx1TyVFQd+hFZtK4QG
         DsNWfIlfTYziHF0ZHW11jeGeIWGfUe7MLTBjdSBYov6LU/juqW0b/rygwW13HSFMQT7L
         4D1KeVp6f9TLP41nZcwk56ASDbD7+GSLTIYwoI33FJ3hshElD4AQN78p+5FMHRmxJrp6
         u4wZRlyw1hDkIoWi7Ze3x8tdUg1Q2r1WMELl7Z1eoVQrlktXXny0Bhgty1RVK4Fb5YH1
         WI9A==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703165094; x=1703769894;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sc2VXLV/jtlqrJRMWG3rz0JeIbxjVA+obKylcgEIyCw=;
        b=seMnYiSGx/Vu89+9HOPMY21equKRKEaPEpygVwub2MoWKgkjEZp4jJu7/JPlZvq+Cm
         mLdkKEZXbM97vYK2p3rv9iuz9+BMkI7JKc6SVOlTpWSW9Qvplmg+YqynwiEKgcNkLbHR
         mmMFMgL2nvvYsCn1IYI3ZUBYFHfpNDGGvefhjsklXl/iwLtA1eGbqwiunUUl/uOtsj3j
         pHg1HFRxo6uaVsszD1lvWkOaUfvCIXsANmOLaL1rrqA0Fm0NlSjK0Dfq7eiiquRecLEA
         xaviSEAhhkuTCJQGKFKOyT4o0K1wYha/Mx50BfKiaVwb04NrdRdOgIYpDVPlxsd2qiYN
         etqQ==
X-Gm-Message-State: AOJu0YzeK8vmwMOHjGHzKGKEuoVfDSkkWU/kyUtXrHsA6/h8y89DvV30
	SqQqfjiujU+eAsDfOtEmIcv/lujN1BSO9A==
X-Google-Smtp-Source: AGHT+IG5PN7K9e9qiuOXi27g2rhh2KIjkNRuc1Ag9RTJLGmIOvHmQHhSZ3EiCAjL3reJso3+WVwgcA==
X-Received: by 2002:a05:6214:1c0a:b0:67f:67ca:1181 with SMTP id u10-20020a0562141c0a00b0067f67ca1181mr1014654qvc.40.1703165094222;
        Thu, 21 Dec 2023 05:24:54 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ad4:5c6e:0:b0:67f:647a:94e6 with SMTP id i14-20020ad45c6e000000b0067f647a94e6ls108667qvh.0.-pod-prod-00-us;
 Thu, 21 Dec 2023 05:24:53 -0800 (PST)
X-Received: by 2002:a05:6214:19e2:b0:67f:4881:1ad0 with SMTP id q2-20020a05621419e200b0067f48811ad0mr1214873qvc.34.1703165093631;
        Thu, 21 Dec 2023 05:24:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703165093; cv=none;
        d=google.com; s=arc-20160816;
        b=IhYQf3hk+WI7DvLU47GEL81pxddo+2P1ApaGNOO9EGn4QTNr8D7bs6DtIYWe7M5Nzq
         Cu3IHIyk/2ZgN4MFOZyQf9dmIW1HT4HP1c0MDtcC22ONMq2v6zbIc9cKypyKbop3URtx
         Rw66YwZyIutUitCs/P87F6Mq8hxO2VVDwzqL/rvdK3G++5+bBxW1qN/A5t8YL9gSl9sa
         J/or5gVyHP9lI7INIBlmxxlH8in5MVDV3iiNsLCt9kySTp5BPoHSDOMHXo7ciozbex5y
         r5iYgrfdHx42jrk5zeF85P/e7X/N8JTwX2ehZgBXDI5MyRQLp362kkxydj9BNfgCulqA
         IegA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=jT9hgLAowhp9EHvcWHW3pUvxomUXoaX+JM3H5DG5ux4=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=esIPdeHSgs2dvEpt9SubocLXkicX+tZyDoVblNuMIQUZ11gYVe3282A63iW/QBm3Ff
         vuNINF2d0H4Z+k2LJEbdjusMTPzshxHnzKpEruCLVZvQAeEtqwXqqvDL2A04B7X2fr7Q
         eLOyXL2Izy2mGPip6s+kaVC+X2WUUdW5JOzALm0rDTofbt1s7USidhQujPjHREpQe9tX
         q7WwgsergGF4pp/t4AMrtLfC8PgJ1ya4ggCmpmX9r2B57Uybll0j+b7nhH7zSav2i4rw
         KrQoDYHMNYR3CfxMCP0EhPoAYne7PMMDcBCwAu53x84iO7yELfDSXISFlKmGyGW2I9/F
         hn1w==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id g4-20020ac87f44000000b00425f24df298si2141426qtk.548.2023.12.21.05.24.53
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 05:24:53 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-94-NBl2gOEnNX6UbURDZxrv6Q-1; Thu, 21 Dec 2023 08:24:52 -0500
X-MC-Unique: NBl2gOEnNX6UbURDZxrv6Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7C6885A588
	for <linux-cachefs@gapps.redhat.com>; Thu, 21 Dec 2023 13:24:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id D17AEC15E6A; Thu, 21 Dec 2023 13:24:51 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.39.195.169])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DBC5AC15968;
	Thu, 21 Dec 2023 13:24:48 +0000 (UTC)
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
Subject: [PATCH v5 12/40] netfs: Provide invalidate_folio and release_folio calls
Date: Thu, 21 Dec 2023 13:23:07 +0000
Message-ID: <20231221132400.1601991-13-dhowells@redhat.com>
In-Reply-To: <20231221132400.1601991-1-dhowells@redhat.com>
References: <20231221132400.1601991-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
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

Provide default invalidate_folio and release_folio calls.  These will need
to interact with invalidation correctly at some point.  They will be needed
if netfslib is to make use of folio->private for its own purposes.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---

Notes:
    Changes
    =======
    ver #5)
     - Removed ceph_fscache_note_page_release() also as that is now unused.
     - Added missing '*' to turn comment into kdoc.

 fs/9p/vfs_addr.c      | 33 ++-------------------------
 fs/afs/file.c         | 53 ++++---------------------------------------
 fs/ceph/addr.c        | 24 ++------------------
 fs/ceph/cache.h       | 10 --------
 fs/netfs/misc.c       | 42 ++++++++++++++++++++++++++++++++++
 include/linux/netfs.h |  6 +++--
 6 files changed, 54 insertions(+), 114 deletions(-)

diff --git a/fs/9p/vfs_addr.c b/fs/9p/vfs_addr.c
index 131b83c31f85..055b672a247d 100644
--- a/fs/9p/vfs_addr.c
+++ b/fs/9p/vfs_addr.c
@@ -88,35 +88,6 @@ const struct netfs_request_ops v9fs_req_ops = {
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
@@ -324,8 +295,8 @@ const struct address_space_operations v9fs_addr_operations = {
 	.writepage	= v9fs_vfs_writepage,
 	.write_begin	= v9fs_write_begin,
 	.write_end	= v9fs_write_end,
-	.release_folio	= v9fs_release_folio,
-	.invalidate_folio = v9fs_invalidate_folio,
+	.release_folio	= netfs_release_folio,
+	.invalidate_folio = netfs_invalidate_folio,
 	.launder_folio	= v9fs_launder_folio,
 	.direct_IO	= v9fs_direct_IO,
 };
diff --git a/fs/afs/file.c b/fs/afs/file.c
index 0d783e5b2147..d152ba451f0e 100644
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
 	.dirty_folio	= netfs_dirty_folio,
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
 
@@ -386,48 +383,6 @@ const struct netfs_request_ops afs_req_ops = {
 	.issue_read		= afs_issue_read,
 };
 
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
index 3b8641febeac..8eedc62e7ac4 100644
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
@@ -1585,7 +1565,7 @@ const struct address_space_operations ceph_aops = {
 	.write_end = ceph_write_end,
 	.dirty_folio = ceph_dirty_folio,
 	.invalidate_folio = ceph_invalidate_folio,
-	.release_folio = ceph_release_folio,
+	.release_folio = netfs_release_folio,
 	.direct_IO = noop_direct_IO,
 };
 
diff --git a/fs/ceph/cache.h b/fs/ceph/cache.h
index 8fc7d828d990..20efac020394 100644
--- a/fs/ceph/cache.h
+++ b/fs/ceph/cache.h
@@ -56,12 +56,6 @@ static inline bool ceph_is_cache_enabled(struct inode *inode)
 	return fscache_cookie_enabled(ceph_fscache_cookie(ceph_inode(inode)));
 }
 
-static inline void ceph_fscache_note_page_release(struct inode *inode)
-{
-	struct ceph_inode_info *ci = ceph_inode(inode);
-
-	fscache_note_page_release(ceph_fscache_cookie(ci));
-}
 #else /* CONFIG_CEPH_FSCACHE */
 static inline int ceph_fscache_register_fs(struct ceph_fs_client* fsc,
 					   struct fs_context *fc)
@@ -118,10 +112,6 @@ static inline bool ceph_is_cache_enabled(struct inode *inode)
 {
 	return false;
 }
-
-static inline void ceph_fscache_note_page_release(struct inode *inode)
-{
-}
 #endif /* CONFIG_CEPH_FSCACHE */
 
 #endif
diff --git a/fs/netfs/misc.c b/fs/netfs/misc.c
index 68baf55c47a4..45bb19ec9a63 100644
--- a/fs/netfs/misc.c
+++ b/fs/netfs/misc.c
@@ -84,3 +84,45 @@ void netfs_clear_inode_writeback(struct inode *inode, const void *aux)
 	}
 }
 EXPORT_SYMBOL(netfs_clear_inode_writeback);
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
index 06f57d9d09f6..8efbfd3b2820 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -293,11 +293,13 @@ struct readahead_control;
 void netfs_readahead(struct readahead_control *);
 int netfs_read_folio(struct file *, struct folio *);
 int netfs_write_begin(struct netfs_inode *, struct file *,
-		struct address_space *, loff_t pos, unsigned int len,
-		struct folio **, void **fsdata);
+		      struct address_space *, loff_t pos, unsigned int len,
+		      struct folio **, void **fsdata);
 bool netfs_dirty_folio(struct address_space *mapping, struct folio *folio);
 int netfs_unpin_writeback(struct inode *inode, struct writeback_control *wbc);
 void netfs_clear_inode_writeback(struct inode *inode, const void *aux);
+void netfs_invalidate_folio(struct folio *folio, size_t offset, size_t length);
+bool netfs_release_folio(struct folio *folio, gfp_t gfp);
 
 void netfs_subreq_terminated(struct netfs_io_subrequest *, ssize_t, bool);
 void netfs_get_subrequest(struct netfs_io_subrequest *subreq,

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

