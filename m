Return-Path: <linux-cachefs+bncBDLIXLMFVAERBOMZ46VQMGQEO72CHOI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE57811637
	for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 16:24:43 +0100 (CET)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-58db6bfe269sf7001602eaf.3
        for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 07:24:43 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1702481082; cv=pass;
        d=google.com; s=arc-20160816;
        b=gD7Q04OEL3G2PADl32NPOiO0oYRyzXmlxKtaB4Atat0KR+nmgSdOyX5MMNxlIaomM3
         dGlDstklmcKKJ//q//TOe5G4tMFAYgWNSmui5+WWHCDSvgqDFrv25RZUFoUdNt/70UgN
         JyVR2qFudC4Wq1yvs0Pk/1QOnChY6lnDJz5/+8lz41FDhp7yjIjEfwfU+KypADLi2Xdq
         GuIC3NZxf0R1nYqmzsb2IVfKc+MQ38e/718PUXO3XZWkU3L0rjHXE+wQ0yRixlRZ89vm
         twoBB2+8gjZj2de9aYybNWyH1cuYE1q7b0UpXbavaRbRBEquBhDFYp5ghod5eEwotNf/
         v4Ig==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=2UByEIrPz5YgwlM7G1ItRs4ZXvzw/ZyY0cfDxI7C9hM=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=HPHmFvNfJLx+cvywHu2d9id4lgRvvT5GzTbuBsggyY0Qi+qI8sP33LogBUoLpMVH66
         4p+c5L5TcaJVMzqJ/m9iza0ftxOR+41abPjx6vKZ3F68zfuQ2rPWCFa2isgwEyFJHOFn
         qoPWiD2Xp1sBIYGOIs+Rv0UctOKAuv/lMBymVQvOpGuzkN5XpZtfdIzLiPllHKPOLvRr
         kig1GMAPb7ISg3bdmfQTPlejTIpaNCCwF+PudEckuIRSG9eag2Pi33O3xwhbMZ1sOtXF
         Kj+qnJd2YVgJRttC5BMdDZMcl+vCIGw25QXfVR4DjX3gntdRZT4yeMkIVfIfSmjHw1vQ
         7StA==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702481082; x=1703085882;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2UByEIrPz5YgwlM7G1ItRs4ZXvzw/ZyY0cfDxI7C9hM=;
        b=PHBEVw9q2PPlxdN0F9OQz0cs1XrYoQQPmzYMWIdtEeQXv8ZwfHsrAt34/B+PWOKUpP
         UwUsH4d2qjzF7Eqeh+IZhxVc1jHUXTB/oqJMdLsgzW9XuQj2igTpgpHJSf10UcPcclLn
         AnVTPjvQyVPLqTPtAUd+mAps7cfAMEMLPKcXp/OgWP2xWTmr2W6P4jKrHPw58IpRCNY0
         uWNSS1U/SaQjQgPQ6He/PXWBRnR1wXxiCj08MER1xkMYp8PWikliWyqYsGaLZD+D36Gj
         5agUPiddve27H9ZexiUYbiZf3zsNyVbWLxnBYDzy4ni9hTXXsOARI3NDYi+1lLM0tAgI
         qcRQ==
X-Gm-Message-State: AOJu0Yy3FvqZjXxGPO5XZX1epNTh0V8FaFbcMbjQe26v4pPM9dzCyGAt
	VylYiqu/EEogWlogLgYNYj4sqQ==
X-Google-Smtp-Source: AGHT+IGHO/VLRnTNSArp4+XU+2B9PWg9n6Hg4A1QQ8gvHdOw/R9/wMzvbF1vjuu7H1RAla6eLAQX8A==
X-Received: by 2002:a05:6358:921d:b0:16d:bc51:7601 with SMTP id d29-20020a056358921d00b0016dbc517601mr2523194rwb.9.1702481082070;
        Wed, 13 Dec 2023 07:24:42 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:2268:b0:67a:c190:f950 with SMTP id
 gs8-20020a056214226800b0067ac190f950ls180002qvb.0.-pod-prod-06-us; Wed, 13
 Dec 2023 07:24:41 -0800 (PST)
X-Received: by 2002:ad4:4a09:0:b0:67a:a394:e20c with SMTP id m9-20020ad44a09000000b0067aa394e20cmr9033878qvz.38.1702481081486;
        Wed, 13 Dec 2023 07:24:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702481081; cv=none;
        d=google.com; s=arc-20160816;
        b=rX02DbrcEyAH1cymg0UiVisIuTBuy0v0Qa29XVZVeAUaQ28eYUK2x2c/WVN5QkNHm6
         cbdkrQqyENlrneeYRNH3aT8W2M5ORDigS+pSB8Okl0qc4zjNtTK2m31KdAZiHYliB9vq
         oV50vYzk1J9XRlEojQY53q6pamEkyYg4Hz6Xd0ggY0UsyhHsQgKwxGrUQy7moDqhXcT8
         gEBSr3hJaniZWt7U6llfL5BEwPobMejGlSc+EPBZ7h7mvq9AMo5WL0uCEpaTUnnEGXG4
         HpngWZdyLZNCCDd7cbi7tAVjL/Q0hYswxhPNFr1rTn798X7q05vPdHs4uSNLj3/LIcBq
         dQug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=jj3k9IeX7NTGcPRjglvEPxLODcDVViOsYShT5ukMf5o=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=WMFr21llJiTON8b4LMjGlf9/RMRUuDysgbEDTW2Jwku8UAJawGzLbQi4taqQDaafV7
         ELhEYd3QDQWRvSp41+UHMEFB3M/60IDizIlS5JUJzGRL0oi/JHW/cg8m6fyYDI4HIX+S
         BaAnf2dbE+5crlyY50B1sAq1w49IfTAlRaAH+XBxLt2J/NlRlS9CLnXJYQiroBfRY/bA
         BXWBvRrwIjT+dKckRMoaw7hHK9RIQJ5SHUFH3Xgf5T3ZjNi3/IBseklNCIB6t/ktp2U5
         61mBz2zTLIQCXSkvigaDIws1frZXaRKYlxKHf2O5BP2HPZiVLKNL9kWc/ndTLYTvgU4S
         bsIw==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id ff19-20020a0562140bd300b0067ab4fe14e4si12756372qvb.446.2023.12.13.07.24.41
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 07:24:41 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-112-h-d4wQ7ANKa4gLxvjJnTug-1; Wed,
 13 Dec 2023 10:24:39 -0500
X-MC-Unique: h-d4wQ7ANKa4gLxvjJnTug-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 770343C0E64B
	for <linux-cachefs@gapps.redhat.com>; Wed, 13 Dec 2023 15:24:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 739962166B32; Wed, 13 Dec 2023 15:24:39 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 80F8D2166B31;
	Wed, 13 Dec 2023 15:24:36 +0000 (UTC)
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
Subject: [PATCH v4 10/39] netfs: Provide invalidate_folio and release_folio calls
Date: Wed, 13 Dec 2023 15:23:20 +0000
Message-ID: <20231213152350.431591-11-dhowells@redhat.com>
In-Reply-To: <20231213152350.431591-1-dhowells@redhat.com>
References: <20231213152350.431591-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
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
 fs/9p/vfs_addr.c      | 33 ++-------------------------
 fs/afs/file.c         | 53 ++++---------------------------------------
 fs/ceph/addr.c        | 24 ++------------------
 fs/netfs/misc.c       | 42 ++++++++++++++++++++++++++++++++++
 include/linux/netfs.h |  6 +++--
 5 files changed, 54 insertions(+), 104 deletions(-)

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
index 5e2bca3b02fd..c5013ec3c1dc 100644
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
 
@@ -383,48 +380,6 @@ const struct netfs_request_ops afs_req_ops = {
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
index 654f408a0aca..500a87b68a9a 100644
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
 
diff --git a/fs/netfs/misc.c b/fs/netfs/misc.c
index 68baf55c47a4..d946d85764de 100644
--- a/fs/netfs/misc.c
+++ b/fs/netfs/misc.c
@@ -84,3 +84,45 @@ void netfs_clear_inode_writeback(struct inode *inode, const void *aux)
 	}
 }
 EXPORT_SYMBOL(netfs_clear_inode_writeback);
+
+/*
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

