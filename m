Return-Path: <linux-cachefs+bncBDLIXLMFVAERBZVB46VQMGQENQOY4GI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F0A8117A6
	for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 16:42:32 +0100 (CET)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-6d9e49a4c93sf1021289a34.1
        for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 07:42:31 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1702482151; cv=pass;
        d=google.com; s=arc-20160816;
        b=bWbyPTfKqYo/elRZWgfLiUWd6qRUUcuQJVJCAlRlJO3APu6KMjADERqHclYFUUKSZK
         HSRgXuGULObDTiwLSu582NNoh5jvvqxR9MZGP6G6VyKKFQt8aBkVrUt235RKP0HmJNs9
         7VJ79BmkEvHS9LeIIcP1eZsTIWqyhEEaxCYifxjbN3oJYtrTooaZUcTtu/H+uPXX17Ee
         ZqzHub7mTIMGouC+QU3T74l/dT3/1J+14HguX495uxhXgXhzU8qV87LYley6nI2t7an0
         4HWckIqSFoH2MfZ5Wy8t17/VCqaM0Sg97z8/rr0xPltHOj/imOeJvIGPRZ6DXI48tUUR
         ajAA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=MsVKs6gqtHJ9x3jZ3fGMBQSKHa9BPMbL4eAxCYhHBoQ=;
        fh=/d04rGhva23/oMvvc+i8J/J8+GzO8KYoVKSGWp4U6JE=;
        b=Da3dOjBYxxYYnv2VFeVgde5tmziYnMLO8qlvKvYEcea3P3yS4jO2pLvYksAVMgIHLJ
         qQX/uOe7ZnVEExYPOq7k4z7DIkEFK9RG+zN/YInraMXFl3RypteKdQJWNiBr4YoAHEKT
         R3obyublpdquMZb8yCMnINC5LYVSVzb+YfI6sR/oXkhUDdzsi1fj2hj24ATcsEy5Cn9k
         ONheWieE56ku20y/5fNuBBfKdocnSlwRYU65m5PUDjBDpvhgHWEFj3GiEnxfmY8EvyNH
         Xp3M2yaYuINsmPatgQLaygX5/lMd1KT8Q2eGYkY7xU+rXo25TFZkTEE+aa4mlreEc1au
         gcOA==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702482151; x=1703086951;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MsVKs6gqtHJ9x3jZ3fGMBQSKHa9BPMbL4eAxCYhHBoQ=;
        b=H84tY5EbCfvKHXEHtnwkc2aOqe0uhmYnrr3n6LpkhD3vCHd9XOQmYWR5lHDE06PCvz
         H3SBHLytmaxF5sNhsmdPMwn4+a47M7LojTw4MW5BUHg1S6sPwrb2YsJv75uIlxoByeti
         HbjvTc4XvcVVuA1AqbEbwszyStgYYnk25czzxHMIEJw1OtoTODZMJLrDI24EiA0QzTrb
         q4Pmu+7yAlUvvnjB/uZFM81KhawcQbxpiXDP+1BId86OlgM33qEVb5G5m2Gr8nPW0sPB
         rPSR1nV9gZsSUvg1lG6LtZyLx5Ye2BLfMPeQ8zBCfk4x1/08Aut8Z7n3e+isD5HyRCET
         +A5A==
X-Gm-Message-State: AOJu0YyjRZDZj4sRKPD2ioqrsCrurroUbDuHhgP7P/NfecI5338Vilvz
	bJZd9vHSp6n2fjvKsANFdpRAOA==
X-Google-Smtp-Source: AGHT+IEBZWVW0QV88bnXxeeYdfkSjWpT3D2p8rOE+IBqLZozNCYV+GWVCKyZKYerqVBKEM/7DHD1Ew==
X-Received: by 2002:a05:6870:f6aa:b0:1e9:8ab9:11ca with SMTP id el42-20020a056870f6aa00b001e98ab911camr14144275oab.3.1702482150723;
        Wed, 13 Dec 2023 07:42:30 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6871:3a26:b0:1fa:1efd:f65a with SMTP id
 pu38-20020a0568713a2600b001fa1efdf65als965982oac.1.-pod-prod-06-us; Wed, 13
 Dec 2023 07:42:30 -0800 (PST)
X-Received: by 2002:a05:6358:63a2:b0:170:f159:67dc with SMTP id k34-20020a05635863a200b00170f15967dcmr1125244rwh.3.1702482149969;
        Wed, 13 Dec 2023 07:42:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702482149; cv=none;
        d=google.com; s=arc-20160816;
        b=mzPvP3ABGPQe0Qpth6lroNT2+hbECqS6btDijEdpBlluTrR4FCaePmIkrzFD/5lSL6
         RHa2QF+Xrvxz1z1MOSvChtQT9BKXl1MOtTToDcPZpRr5hhB92i4uwqZO4q2qWFxhQqRE
         kjkw9vv4eU9e5OXdv2QNf2OxRipZ3SLPrD7C7nXqwEn46L93a+dlbwS0iACFhGK1IEJh
         Sk5y5RgOzBiAFZ806jpg1dNfZlhkZtV+QO0sXw1hr3uite7nyBuuHHv7dvQ2CFKGceNA
         ms7ojnScx9HuARYE2AgsxI2kGNe3YzrZKRjL65dQ4tOCpoTL/kNmqu+PzZKuQDgi51L6
         uyUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=X+OnJ03Tz1cgEl0WRFUi36RrXqRGEPVkzsiqmlRxMxc=;
        fh=/d04rGhva23/oMvvc+i8J/J8+GzO8KYoVKSGWp4U6JE=;
        b=vcF/fpFdxC9+mBYA0Rzux3EK9oMfjcq/giSJfPgomQooLM5YuC0oLjiCUVBi2FWJ1V
         cH19dyP3MmNT7+f0S8Z6JHf0VEmaH6+zINk8HDdbLwq5HN59KOVcWDMc4FR+QNYeBYXG
         j9XI3d38bF2lVKv+bHnEuB1Y1GPtZp+0kFn44U3FCClDt99dmCPtLvruWfLBoASxTkeO
         /Hfy0YiPyTuNx4PdFB/muigemP3ecxodXEJiaxTeo8gx4IdC8kCTaJeukyOEwgV5CJhs
         OT97poPHjz80gKHjqBmf73HPZMxsEG+5rQp369TQUS/rXthBhFe+aLT5jY/FzCOara8b
         YRXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id u4-20020a05620a120400b0077d7be192f6si12755268qkj.708.2023.12.13.07.42.29
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 07:42:29 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-232-N1lMeI4MP9aI8dlaXuE64w-1; Wed, 13 Dec 2023 10:42:27 -0500
X-MC-Unique: N1lMeI4MP9aI8dlaXuE64w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 97B99185A794
	for <linux-cachefs@gapps.redhat.com>; Wed, 13 Dec 2023 15:42:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 94AB03C30; Wed, 13 Dec 2023 15:42:26 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4CD393C25;
	Wed, 13 Dec 2023 15:42:23 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>,
	Steve French <smfrench@gmail.com>
Cc: David Howells <dhowells@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
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
	linux-kernel@vger.kernel.org,
	Steve French <sfrench@samba.org>,
	Shyam Prasad N <nspmangalore@gmail.com>,
	Rohith Surabattula <rohiths.msft@gmail.com>
Subject: [PATCH v4 11/13] cifs: Remove some code that's no longer used, part 1
Date: Wed, 13 Dec 2023 15:41:37 +0000
Message-ID: <20231213154139.432922-12-dhowells@redhat.com>
In-Reply-To: <20231213154139.432922-1-dhowells@redhat.com>
References: <20231213154139.432922-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
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

Remove some code that was #if'd out with the netfslib conversion.  This is
split into parts for file.c as the diff generator otherwise produces a hard
to read diff for part of it where a big chunk is cut out.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Steve French <sfrench@samba.org>
cc: Shyam Prasad N <nspmangalore@gmail.com>
cc: Rohith Surabattula <rohiths.msft@gmail.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cifs@vger.kernel.org
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/smb/client/cifsglob.h  |  12 -
 fs/smb/client/cifsproto.h |  21 --
 fs/smb/client/file.c      | 640 --------------------------------------
 fs/smb/client/fscache.c   | 111 -------
 fs/smb/client/fscache.h   |  58 ----
 5 files changed, 842 deletions(-)

diff --git a/fs/smb/client/cifsglob.h b/fs/smb/client/cifsglob.h
index 224cc47209eb..14cd63b226dd 100644
--- a/fs/smb/client/cifsglob.h
+++ b/fs/smb/client/cifsglob.h
@@ -1455,18 +1455,6 @@ struct cifs_io_subrequest {
 	struct smbd_mr			*mr;
 #endif
 	struct cifs_credits		credits;
-
-#if 0 // TODO: Remove following elements
-	struct list_head		list;
-	struct completion		done;
-	struct work_struct		work;
-	struct cifsFileInfo		*cfile;
-	struct address_space		*mapping;
-	struct cifs_aio_ctx		*ctx;
-	enum writeback_sync_modes	sync_mode;
-	bool				uncached;
-	struct bio_vec			*bv;
-#endif
 };
 
 /*
diff --git a/fs/smb/client/cifsproto.h b/fs/smb/client/cifsproto.h
index 3bbbe9b2fb8e..4d4a30ee9712 100644
--- a/fs/smb/client/cifsproto.h
+++ b/fs/smb/client/cifsproto.h
@@ -587,32 +587,11 @@ void __cifs_put_smb_ses(struct cifs_ses *ses);
 extern struct cifs_ses *
 cifs_get_smb_ses(struct TCP_Server_Info *server, struct smb3_fs_context *ctx);
 
-#if 0 // TODO Remove
-void cifs_readdata_release(struct cifs_io_subrequest *rdata);
-static inline void cifs_put_readdata(struct cifs_io_subrequest *rdata)
-{
-	if (refcount_dec_and_test(&rdata->subreq.ref))
-		cifs_readdata_release(rdata);
-}
-#endif
 int cifs_async_readv(struct cifs_io_subrequest *rdata);
 int cifs_readv_receive(struct TCP_Server_Info *server, struct mid_q_entry *mid);
 
 int cifs_async_writev(struct cifs_io_subrequest *wdata);
 void cifs_writev_complete(struct work_struct *work);
-#if 0 // TODO Remove
-struct cifs_io_subrequest *cifs_writedata_alloc(work_func_t complete);
-void cifs_writedata_release(struct cifs_io_subrequest *rdata);
-static inline void cifs_get_writedata(struct cifs_io_subrequest *wdata)
-{
-	refcount_inc(&wdata->subreq.ref);
-}
-static inline void cifs_put_writedata(struct cifs_io_subrequest *wdata)
-{
-	if (refcount_dec_and_test(&wdata->subreq.ref))
-		cifs_writedata_release(wdata);
-}
-#endif
 int cifs_query_mf_symlink(unsigned int xid, struct cifs_tcon *tcon,
 			  struct cifs_sb_info *cifs_sb,
 			  const unsigned char *path, char *pbuf,
diff --git a/fs/smb/client/file.c b/fs/smb/client/file.c
index 6917f998d9ff..d3cb65e3234b 100644
--- a/fs/smb/client/file.c
+++ b/fs/smb/client/file.c
@@ -395,133 +395,6 @@ const struct netfs_request_ops cifs_req_ops = {
 	.create_write_requests	= cifs_create_write_requests,
 };
 
-#if 0 // TODO remove 397
-/*
- * Remove the dirty flags from a span of pages.
- */
-static void cifs_undirty_folios(struct inode *inode, loff_t start, unsigned int len)
-{
-	struct address_space *mapping = inode->i_mapping;
-	struct folio *folio;
-	pgoff_t end;
-
-	XA_STATE(xas, &mapping->i_pages, start / PAGE_SIZE);
-
-	rcu_read_lock();
-
-	end = (start + len - 1) / PAGE_SIZE;
-	xas_for_each_marked(&xas, folio, end, PAGECACHE_TAG_DIRTY) {
-		if (xas_retry(&xas, folio))
-			continue;
-		xas_pause(&xas);
-		rcu_read_unlock();
-		folio_lock(folio);
-		folio_clear_dirty_for_io(folio);
-		folio_unlock(folio);
-		rcu_read_lock();
-	}
-
-	rcu_read_unlock();
-}
-
-/*
- * Completion of write to server.
- */
-void cifs_pages_written_back(struct inode *inode, loff_t start, unsigned int len)
-{
-	struct address_space *mapping = inode->i_mapping;
-	struct folio *folio;
-	pgoff_t end;
-
-	XA_STATE(xas, &mapping->i_pages, start / PAGE_SIZE);
-
-	if (!len)
-		return;
-
-	rcu_read_lock();
-
-	end = (start + len - 1) / PAGE_SIZE;
-	xas_for_each(&xas, folio, end) {
-		if (xas_retry(&xas, folio))
-			continue;
-		if (!folio_test_writeback(folio)) {
-			WARN_ONCE(1, "bad %x @%llx page %lx %lx\n",
-				  len, start, folio_index(folio), end);
-			continue;
-		}
-
-		folio_detach_private(folio);
-		folio_end_writeback(folio);
-	}
-
-	rcu_read_unlock();
-}
-
-/*
- * Failure of write to server.
- */
-void cifs_pages_write_failed(struct inode *inode, loff_t start, unsigned int len)
-{
-	struct address_space *mapping = inode->i_mapping;
-	struct folio *folio;
-	pgoff_t end;
-
-	XA_STATE(xas, &mapping->i_pages, start / PAGE_SIZE);
-
-	if (!len)
-		return;
-
-	rcu_read_lock();
-
-	end = (start + len - 1) / PAGE_SIZE;
-	xas_for_each(&xas, folio, end) {
-		if (xas_retry(&xas, folio))
-			continue;
-		if (!folio_test_writeback(folio)) {
-			WARN_ONCE(1, "bad %x @%llx page %lx %lx\n",
-				  len, start, folio_index(folio), end);
-			continue;
-		}
-
-		folio_set_error(folio);
-		folio_end_writeback(folio);
-	}
-
-	rcu_read_unlock();
-}
-
-/*
- * Redirty pages after a temporary failure.
- */
-void cifs_pages_write_redirty(struct inode *inode, loff_t start, unsigned int len)
-{
-	struct address_space *mapping = inode->i_mapping;
-	struct folio *folio;
-	pgoff_t end;
-
-	XA_STATE(xas, &mapping->i_pages, start / PAGE_SIZE);
-
-	if (!len)
-		return;
-
-	rcu_read_lock();
-
-	end = (start + len - 1) / PAGE_SIZE;
-	xas_for_each(&xas, folio, end) {
-		if (!folio_test_writeback(folio)) {
-			WARN_ONCE(1, "bad %x @%llx page %lx %lx\n",
-				  len, start, folio_index(folio), end);
-			continue;
-		}
-
-		filemap_dirty_folio(folio->mapping, folio);
-		folio_end_writeback(folio);
-	}
-
-	rcu_read_unlock();
-}
-#endif // end netfslib remove 397
-
 /*
  * Mark as invalid, all open files on tree connections since they
  * were closed when session to server was lost.
@@ -2484,92 +2357,6 @@ void cifs_write_subrequest_terminated(struct cifs_io_subrequest *wdata, ssize_t
 	netfs_write_subrequest_terminated(&wdata->subreq, result, was_async);
 }
 
-#if 0 // TODO remove 2483
-static ssize_t
-cifs_write(struct cifsFileInfo *open_file, __u32 pid, const char *write_data,
-	   size_t write_size, loff_t *offset)
-{
-	int rc = 0;
-	unsigned int bytes_written = 0;
-	unsigned int total_written;
-	struct cifs_tcon *tcon;
-	struct TCP_Server_Info *server;
-	unsigned int xid;
-	struct dentry *dentry = open_file->dentry;
-	struct cifsInodeInfo *cifsi = CIFS_I(d_inode(dentry));
-	struct cifs_io_parms io_parms = {0};
-
-	cifs_dbg(FYI, "write %zd bytes to offset %lld of %pd\n",
-		 write_size, *offset, dentry);
-
-	tcon = tlink_tcon(open_file->tlink);
-	server = tcon->ses->server;
-
-	if (!server->ops->sync_write)
-		return -ENOSYS;
-
-	xid = get_xid();
-
-	for (total_written = 0; write_size > total_written;
-	     total_written += bytes_written) {
-		rc = -EAGAIN;
-		while (rc == -EAGAIN) {
-			struct kvec iov[2];
-			unsigned int len;
-
-			if (open_file->invalidHandle) {
-				/* we could deadlock if we called
-				   filemap_fdatawait from here so tell
-				   reopen_file not to flush data to
-				   server now */
-				rc = cifs_reopen_file(open_file, false);
-				if (rc != 0)
-					break;
-			}
-
-			len = min(server->ops->wp_retry_size(d_inode(dentry)),
-				  (unsigned int)write_size - total_written);
-			/* iov[0] is reserved for smb header */
-			iov[1].iov_base = (char *)write_data + total_written;
-			iov[1].iov_len = len;
-			io_parms.pid = pid;
-			io_parms.tcon = tcon;
-			io_parms.offset = *offset;
-			io_parms.length = len;
-			rc = server->ops->sync_write(xid, &open_file->fid,
-					&io_parms, &bytes_written, iov, 1);
-		}
-		if (rc || (bytes_written == 0)) {
-			if (total_written)
-				break;
-			else {
-				free_xid(xid);
-				return rc;
-			}
-		} else {
-			spin_lock(&d_inode(dentry)->i_lock);
-			cifs_update_eof(cifsi, *offset, bytes_written);
-			spin_unlock(&d_inode(dentry)->i_lock);
-			*offset += bytes_written;
-		}
-	}
-
-	cifs_stats_bytes_written(tcon, total_written);
-
-	if (total_written > 0) {
-		spin_lock(&d_inode(dentry)->i_lock);
-		if (*offset > d_inode(dentry)->i_size) {
-			i_size_write(d_inode(dentry), *offset);
-			d_inode(dentry)->i_blocks = (512 - 1 + *offset) >> 9;
-		}
-		spin_unlock(&d_inode(dentry)->i_lock);
-	}
-	mark_inode_dirty_sync(d_inode(dentry));
-	free_xid(xid);
-	return total_written;
-}
-#endif // end netfslib remove 2483
-
 struct cifsFileInfo *find_readable_file(struct cifsInodeInfo *cifs_inode,
 					bool fsuid_only)
 {
@@ -4829,293 +4616,6 @@ int cifs_file_mmap(struct file *file, struct vm_area_struct *vma)
 	return rc;
 }
 
-#if 0 // TODO remove 4794
-/*
- * Unlock a bunch of folios in the pagecache.
- */
-static void cifs_unlock_folios(struct address_space *mapping, pgoff_t first, pgoff_t last)
-{
-	struct folio *folio;
-	XA_STATE(xas, &mapping->i_pages, first);
-
-	rcu_read_lock();
-	xas_for_each(&xas, folio, last) {
-		folio_unlock(folio);
-	}
-	rcu_read_unlock();
-}
-
-static void cifs_readahead_complete(struct work_struct *work)
-{
-	struct cifs_io_subrequest *rdata = container_of(work,
-						   struct cifs_io_subrequest, work);
-	struct folio *folio;
-	pgoff_t last;
-	bool good = rdata->result == 0 || (rdata->result == -EAGAIN && rdata->got_bytes);
-
-	XA_STATE(xas, &rdata->mapping->i_pages, rdata->subreq.start / PAGE_SIZE);
-
-	if (good)
-		cifs_readahead_to_fscache(rdata->mapping->host,
-					  rdata->subreq.start, rdata->subreq.len);
-
-	if (iov_iter_count(&rdata->subreq.io_iter) > 0)
-		iov_iter_zero(iov_iter_count(&rdata->subreq.io_iter), &rdata->subreq.io_iter);
-
-	last = (rdata->subreq.start + rdata->subreq.len - 1) / PAGE_SIZE;
-
-	rcu_read_lock();
-	xas_for_each(&xas, folio, last) {
-		if (good) {
-			flush_dcache_folio(folio);
-			folio_mark_uptodate(folio);
-		}
-		folio_unlock(folio);
-	}
-	rcu_read_unlock();
-
-	cifs_put_readdata(rdata);
-}
-
-static void cifs_readahead(struct readahead_control *ractl)
-{
-	struct cifsFileInfo *open_file = ractl->file->private_data;
-	struct cifs_sb_info *cifs_sb = CIFS_FILE_SB(ractl->file);
-	struct TCP_Server_Info *server;
-	unsigned int xid, nr_pages, cache_nr_pages = 0;
-	unsigned int ra_pages;
-	pgoff_t next_cached = ULONG_MAX, ra_index;
-	bool caching = fscache_cookie_enabled(cifs_inode_cookie(ractl->mapping->host)) &&
-		cifs_inode_cookie(ractl->mapping->host)->cache_priv;
-	bool check_cache = caching;
-	pid_t pid;
-	int rc = 0;
-
-	/* Note that readahead_count() lags behind our dequeuing of pages from
-	 * the ractl, wo we have to keep track for ourselves.
-	 */
-	ra_pages = readahead_count(ractl);
-	ra_index = readahead_index(ractl);
-
-	xid = get_xid();
-
-	if (cifs_sb->mnt_cifs_flags & CIFS_MOUNT_RWPIDFORWARD)
-		pid = open_file->pid;
-	else
-		pid = current->tgid;
-
-	server = cifs_pick_channel(tlink_tcon(open_file->tlink)->ses);
-
-	cifs_dbg(FYI, "%s: file=%p mapping=%p num_pages=%u\n",
-		 __func__, ractl->file, ractl->mapping, ra_pages);
-
-	/*
-	 * Chop the readahead request up into rsize-sized read requests.
-	 */
-	while ((nr_pages = ra_pages)) {
-		unsigned int i;
-		struct cifs_io_subrequest *rdata;
-		struct cifs_credits credits_on_stack;
-		struct cifs_credits *credits = &credits_on_stack;
-		struct folio *folio;
-		pgoff_t fsize;
-		size_t rsize;
-
-		/*
-		 * Find out if we have anything cached in the range of
-		 * interest, and if so, where the next chunk of cached data is.
-		 */
-		if (caching) {
-			if (check_cache) {
-				rc = cifs_fscache_query_occupancy(
-					ractl->mapping->host, ra_index, nr_pages,
-					&next_cached, &cache_nr_pages);
-				if (rc < 0)
-					caching = false;
-				check_cache = false;
-			}
-
-			if (ra_index == next_cached) {
-				/*
-				 * TODO: Send a whole batch of pages to be read
-				 * by the cache.
-				 */
-				folio = readahead_folio(ractl);
-				fsize = folio_nr_pages(folio);
-				ra_pages -= fsize;
-				ra_index += fsize;
-				if (cifs_readpage_from_fscache(ractl->mapping->host,
-							       &folio->page) < 0) {
-					/*
-					 * TODO: Deal with cache read failure
-					 * here, but for the moment, delegate
-					 * that to readpage.
-					 */
-					caching = false;
-				}
-				folio_unlock(folio);
-				next_cached += fsize;
-				cache_nr_pages -= fsize;
-				if (cache_nr_pages == 0)
-					check_cache = true;
-				continue;
-			}
-		}
-
-		if (open_file->invalidHandle) {
-			rc = cifs_reopen_file(open_file, true);
-			if (rc) {
-				if (rc == -EAGAIN)
-					continue;
-				break;
-			}
-		}
-
-		if (cifs_sb->ctx->rsize == 0)
-			cifs_sb->ctx->rsize =
-				server->ops->negotiate_rsize(tlink_tcon(open_file->tlink),
-							     cifs_sb->ctx);
-
-		rc = server->ops->wait_mtu_credits(server, cifs_sb->ctx->rsize,
-						   &rsize, credits);
-		if (rc)
-			break;
-		nr_pages = min_t(size_t, rsize / PAGE_SIZE, ra_pages);
-		if (next_cached != ULONG_MAX)
-			nr_pages = min_t(size_t, nr_pages, next_cached - ra_index);
-
-		/*
-		 * Give up immediately if rsize is too small to read an entire
-		 * page. The VFS will fall back to readpage. We should never
-		 * reach this point however since we set ra_pages to 0 when the
-		 * rsize is smaller than a cache page.
-		 */
-		if (unlikely(!nr_pages)) {
-			add_credits_and_wake_if(server, credits, 0);
-			break;
-		}
-
-		rdata = cifs_readdata_alloc(cifs_readahead_complete);
-		if (!rdata) {
-			/* best to give up if we're out of mem */
-			add_credits_and_wake_if(server, credits, 0);
-			break;
-		}
-
-		rdata->subreq.start	= ra_index * PAGE_SIZE;
-		rdata->subreq.len	= nr_pages * PAGE_SIZE;
-		rdata->cfile	= cifsFileInfo_get(open_file);
-		rdata->server	= server;
-		rdata->mapping	= ractl->mapping;
-		rdata->pid	= pid;
-		rdata->credits	= credits_on_stack;
-
-		for (i = 0; i < nr_pages; i++) {
-			if (!readahead_folio(ractl))
-				WARN_ON(1);
-		}
-		ra_pages -= nr_pages;
-		ra_index += nr_pages;
-
-		iov_iter_xarray(&rdata->subreq.io_iter, ITER_DEST, &rdata->mapping->i_pages,
-				rdata->subreq.start, rdata->subreq.len);
-
-		rc = adjust_credits(server, &rdata->credits, rdata->subreq.len);
-		if (!rc) {
-			if (rdata->cfile->invalidHandle)
-				rc = -EAGAIN;
-			else
-				rc = server->ops->async_readv(rdata);
-		}
-
-		if (rc) {
-			add_credits_and_wake_if(server, &rdata->credits, 0);
-			cifs_unlock_folios(rdata->mapping,
-					   rdata->subreq.start / PAGE_SIZE,
-					   (rdata->subreq.start + rdata->subreq.len - 1) / PAGE_SIZE);
-			/* Fallback to the readpage in error/reconnect cases */
-			cifs_put_readdata(rdata);
-			break;
-		}
-
-		cifs_put_readdata(rdata);
-	}
-
-	free_xid(xid);
-}
-
-/*
- * cifs_readpage_worker must be called with the page pinned
- */
-static int cifs_readpage_worker(struct file *file, struct page *page,
-	loff_t *poffset)
-{
-	struct inode *inode = file_inode(file);
-	struct timespec64 atime, mtime;
-	char *read_data;
-	int rc;
-
-	/* Is the page cached? */
-	rc = cifs_readpage_from_fscache(inode, page);
-	if (rc == 0)
-		goto read_complete;
-
-	read_data = kmap(page);
-	/* for reads over a certain size could initiate async read ahead */
-
-	rc = cifs_read(file, read_data, PAGE_SIZE, poffset);
-
-	if (rc < 0)
-		goto io_error;
-	else
-		cifs_dbg(FYI, "Bytes read %d\n", rc);
-
-	/* we do not want atime to be less than mtime, it broke some apps */
-	atime = inode_set_atime_to_ts(inode, current_time(inode));
-	mtime = inode_get_mtime(inode);
-	if (timespec64_compare(&atime, &mtime))
-		inode_set_atime_to_ts(inode, inode_get_mtime(inode));
-
-	if (PAGE_SIZE > rc)
-		memset(read_data + rc, 0, PAGE_SIZE - rc);
-
-	flush_dcache_page(page);
-	SetPageUptodate(page);
-	rc = 0;
-
-io_error:
-	kunmap(page);
-
-read_complete:
-	unlock_page(page);
-	return rc;
-}
-
-static int cifs_read_folio(struct file *file, struct folio *folio)
-{
-	struct page *page = &folio->page;
-	loff_t offset = page_file_offset(page);
-	int rc = -EACCES;
-	unsigned int xid;
-
-	xid = get_xid();
-
-	if (file->private_data == NULL) {
-		rc = -EBADF;
-		free_xid(xid);
-		return rc;
-	}
-
-	cifs_dbg(FYI, "read_folio %p at offset %d 0x%x\n",
-		 page, (int)offset, (int)offset);
-
-	rc = cifs_readpage_worker(file, page, &offset);
-
-	free_xid(xid);
-	return rc;
-}
-#endif // end netfslib remove 4794
-
 static int is_inode_writable(struct cifsInodeInfo *cifs_inode)
 {
 	struct cifsFileInfo *open_file;
@@ -5161,125 +4661,6 @@ bool is_size_safe_to_change(struct cifsInodeInfo *cifsInode, __u64 end_of_file)
 		return true;
 }
 
-#if 0 // TODO remove 5152
-static int cifs_write_begin(struct file *file, struct address_space *mapping,
-			loff_t pos, unsigned len,
-			struct page **pagep, void **fsdata)
-{
-	int oncethru = 0;
-	pgoff_t index = pos >> PAGE_SHIFT;
-	loff_t offset = pos & (PAGE_SIZE - 1);
-	loff_t page_start = pos & PAGE_MASK;
-	loff_t i_size;
-	struct page *page;
-	int rc = 0;
-
-	cifs_dbg(FYI, "write_begin from %lld len %d\n", (long long)pos, len);
-
-start:
-	page = grab_cache_page_write_begin(mapping, index);
-	if (!page) {
-		rc = -ENOMEM;
-		goto out;
-	}
-
-	if (PageUptodate(page))
-		goto out;
-
-	/*
-	 * If we write a full page it will be up to date, no need to read from
-	 * the server. If the write is short, we'll end up doing a sync write
-	 * instead.
-	 */
-	if (len == PAGE_SIZE)
-		goto out;
-
-	/*
-	 * optimize away the read when we have an oplock, and we're not
-	 * expecting to use any of the data we'd be reading in. That
-	 * is, when the page lies beyond the EOF, or straddles the EOF
-	 * and the write will cover all of the existing data.
-	 */
-	if (CIFS_CACHE_READ(CIFS_I(mapping->host))) {
-		i_size = i_size_read(mapping->host);
-		if (page_start >= i_size ||
-		    (offset == 0 && (pos + len) >= i_size)) {
-			zero_user_segments(page, 0, offset,
-					   offset + len,
-					   PAGE_SIZE);
-			/*
-			 * PageChecked means that the parts of the page
-			 * to which we're not writing are considered up
-			 * to date. Once the data is copied to the
-			 * page, it can be set uptodate.
-			 */
-			SetPageChecked(page);
-			goto out;
-		}
-	}
-
-	if ((file->f_flags & O_ACCMODE) != O_WRONLY && !oncethru) {
-		/*
-		 * might as well read a page, it is fast enough. If we get
-		 * an error, we don't need to return it. cifs_write_end will
-		 * do a sync write instead since PG_uptodate isn't set.
-		 */
-		cifs_readpage_worker(file, page, &page_start);
-		put_page(page);
-		oncethru = 1;
-		goto start;
-	} else {
-		/* we could try using another file handle if there is one -
-		   but how would we lock it to prevent close of that handle
-		   racing with this read? In any case
-		   this will be written out by write_end so is fine */
-	}
-out:
-	*pagep = page;
-	return rc;
-}
-
-static bool cifs_release_folio(struct folio *folio, gfp_t gfp)
-{
-	if (folio_test_private(folio))
-		return 0;
-	if (folio_test_fscache(folio)) {
-		if (current_is_kswapd() || !(gfp & __GFP_FS))
-			return false;
-		folio_wait_fscache(folio);
-	}
-	fscache_note_page_release(cifs_inode_cookie(folio->mapping->host));
-	return true;
-}
-
-static void cifs_invalidate_folio(struct folio *folio, size_t offset,
-				 size_t length)
-{
-	folio_wait_fscache(folio);
-}
-
-static int cifs_launder_folio(struct folio *folio)
-{
-	int rc = 0;
-	loff_t range_start = folio_pos(folio);
-	loff_t range_end = range_start + folio_size(folio);
-	struct writeback_control wbc = {
-		.sync_mode = WB_SYNC_ALL,
-		.nr_to_write = 0,
-		.range_start = range_start,
-		.range_end = range_end,
-	};
-
-	cifs_dbg(FYI, "Launder page: %lu\n", folio->index);
-
-	if (folio_clear_dirty_for_io(folio))
-		rc = cifs_writepage_locked(&folio->page, &wbc);
-
-	folio_wait_fscache(folio);
-	return rc;
-}
-#endif // end netfslib remove 5152
-
 void cifs_oplock_break(struct work_struct *work)
 {
 	struct cifsFileInfo *cfile = container_of(work, struct cifsFileInfo,
@@ -5369,27 +4750,6 @@ void cifs_oplock_break(struct work_struct *work)
 	cifs_done_oplock_break(cinode);
 }
 
-#if 0 // TODO remove 5333
-/*
- * The presence of cifs_direct_io() in the address space ops vector
- * allowes open() O_DIRECT flags which would have failed otherwise.
- *
- * In the non-cached mode (mount with cache=none), we shunt off direct read and write requests
- * so this method should never be called.
- *
- * Direct IO is not yet supported in the cached mode.
- */
-static ssize_t
-cifs_direct_io(struct kiocb *iocb, struct iov_iter *iter)
-{
-        /*
-         * FIXME
-         * Eventually need to support direct IO for non forcedirectio mounts
-         */
-        return -EINVAL;
-}
-#endif // netfs end remove 5333
-
 static int cifs_swap_activate(struct swap_info_struct *sis,
 			      struct file *swap_file, sector_t *span)
 {
diff --git a/fs/smb/client/fscache.c b/fs/smb/client/fscache.c
index 228fe57bbde3..bd9284923cc6 100644
--- a/fs/smb/client/fscache.c
+++ b/fs/smb/client/fscache.c
@@ -136,114 +136,3 @@ void cifs_fscache_release_inode_cookie(struct inode *inode)
 		cifsi->netfs.cache = NULL;
 	}
 }
-
-#if 0 // TODO remove
-/*
- * Fallback page reading interface.
- */
-static int fscache_fallback_read_page(struct inode *inode, struct page *page)
-{
-	struct netfs_cache_resources cres;
-	struct fscache_cookie *cookie = cifs_inode_cookie(inode);
-	struct iov_iter iter;
-	struct bio_vec bvec;
-	int ret;
-
-	memset(&cres, 0, sizeof(cres));
-	bvec_set_page(&bvec, page, PAGE_SIZE, 0);
-	iov_iter_bvec(&iter, ITER_DEST, &bvec, 1, PAGE_SIZE);
-
-	ret = fscache_begin_read_operation(&cres, cookie);
-	if (ret < 0)
-		return ret;
-
-	ret = fscache_read(&cres, page_offset(page), &iter, NETFS_READ_HOLE_FAIL,
-			   NULL, NULL);
-	fscache_end_operation(&cres);
-	return ret;
-}
-
-/*
- * Fallback page writing interface.
- */
-static int fscache_fallback_write_pages(struct inode *inode, loff_t start, size_t len,
-					bool no_space_allocated_yet)
-{
-	struct netfs_cache_resources cres;
-	struct fscache_cookie *cookie = cifs_inode_cookie(inode);
-	struct iov_iter iter;
-	int ret;
-
-	memset(&cres, 0, sizeof(cres));
-	iov_iter_xarray(&iter, ITER_SOURCE, &inode->i_mapping->i_pages, start, len);
-
-	ret = fscache_begin_write_operation(&cres, cookie);
-	if (ret < 0)
-		return ret;
-
-	ret = cres.ops->prepare_write(&cres, &start, &len, len, i_size_read(inode),
-				      no_space_allocated_yet);
-	if (ret == 0)
-		ret = fscache_write(&cres, start, &iter, NULL, NULL);
-	fscache_end_operation(&cres);
-	return ret;
-}
-
-/*
- * Retrieve a page from FS-Cache
- */
-int __cifs_readpage_from_fscache(struct inode *inode, struct page *page)
-{
-	int ret;
-
-	cifs_dbg(FYI, "%s: (fsc:%p, p:%p, i:0x%p\n",
-		 __func__, cifs_inode_cookie(inode), page, inode);
-
-	ret = fscache_fallback_read_page(inode, page);
-	if (ret < 0)
-		return ret;
-
-	/* Read completed synchronously */
-	SetPageUptodate(page);
-	return 0;
-}
-
-void __cifs_readahead_to_fscache(struct inode *inode, loff_t pos, size_t len)
-{
-	cifs_dbg(FYI, "%s: (fsc: %p, p: %llx, l: %zx, i: %p)\n",
-		 __func__, cifs_inode_cookie(inode), pos, len, inode);
-
-	fscache_fallback_write_pages(inode, pos, len, true);
-}
-
-/*
- * Query the cache occupancy.
- */
-int __cifs_fscache_query_occupancy(struct inode *inode,
-				   pgoff_t first, unsigned int nr_pages,
-				   pgoff_t *_data_first,
-				   unsigned int *_data_nr_pages)
-{
-	struct netfs_cache_resources cres;
-	struct fscache_cookie *cookie = cifs_inode_cookie(inode);
-	loff_t start, data_start;
-	size_t len, data_len;
-	int ret;
-
-	ret = fscache_begin_read_operation(&cres, cookie);
-	if (ret < 0)
-		return ret;
-
-	start = first * PAGE_SIZE;
-	len = nr_pages * PAGE_SIZE;
-	ret = cres.ops->query_occupancy(&cres, start, len, PAGE_SIZE,
-					&data_start, &data_len);
-	if (ret == 0) {
-		*_data_first = data_start / PAGE_SIZE;
-		*_data_nr_pages = len / PAGE_SIZE;
-	}
-
-	fscache_end_operation(&cres);
-	return ret;
-}
-#endif
diff --git a/fs/smb/client/fscache.h b/fs/smb/client/fscache.h
index c2c05a778a71..ece1a826adb9 100644
--- a/fs/smb/client/fscache.h
+++ b/fs/smb/client/fscache.h
@@ -74,43 +74,6 @@ static inline void cifs_invalidate_cache(struct inode *inode, unsigned int flags
 			   i_size_read(inode), flags);
 }
 
-#if 0 // TODO remove
-extern int __cifs_fscache_query_occupancy(struct inode *inode,
-					  pgoff_t first, unsigned int nr_pages,
-					  pgoff_t *_data_first,
-					  unsigned int *_data_nr_pages);
-
-static inline int cifs_fscache_query_occupancy(struct inode *inode,
-					       pgoff_t first, unsigned int nr_pages,
-					       pgoff_t *_data_first,
-					       unsigned int *_data_nr_pages)
-{
-	if (!cifs_inode_cookie(inode))
-		return -ENOBUFS;
-	return __cifs_fscache_query_occupancy(inode, first, nr_pages,
-					      _data_first, _data_nr_pages);
-}
-
-extern int __cifs_readpage_from_fscache(struct inode *pinode, struct page *ppage);
-extern void __cifs_readahead_to_fscache(struct inode *pinode, loff_t pos, size_t len);
-
-
-static inline int cifs_readpage_from_fscache(struct inode *inode,
-					     struct page *page)
-{
-	if (cifs_inode_cookie(inode))
-		return __cifs_readpage_from_fscache(inode, page);
-	return -ENOBUFS;
-}
-
-static inline void cifs_readahead_to_fscache(struct inode *inode,
-					     loff_t pos, size_t len)
-{
-	if (cifs_inode_cookie(inode))
-		__cifs_readahead_to_fscache(inode, pos, len);
-}
-#endif
-
 #else /* CONFIG_CIFS_FSCACHE */
 static inline
 void cifs_fscache_fill_coherency(struct inode *inode,
@@ -127,27 +90,6 @@ static inline void cifs_fscache_unuse_inode_cookie(struct inode *inode, bool upd
 static inline struct fscache_cookie *cifs_inode_cookie(struct inode *inode) { return NULL; }
 static inline void cifs_invalidate_cache(struct inode *inode, unsigned int flags) {}
 
-#if 0 // TODO remove
-static inline int cifs_fscache_query_occupancy(struct inode *inode,
-					       pgoff_t first, unsigned int nr_pages,
-					       pgoff_t *_data_first,
-					       unsigned int *_data_nr_pages)
-{
-	*_data_first = ULONG_MAX;
-	*_data_nr_pages = 0;
-	return -ENOBUFS;
-}
-
-static inline int
-cifs_readpage_from_fscache(struct inode *inode, struct page *page)
-{
-	return -ENOBUFS;
-}
-
-static inline
-void cifs_readahead_to_fscache(struct inode *inode, loff_t pos, size_t len) {}
-#endif
-
 #endif /* CONFIG_CIFS_FSCACHE */
 
 #endif /* _CIFS_FSCACHE_H */

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

