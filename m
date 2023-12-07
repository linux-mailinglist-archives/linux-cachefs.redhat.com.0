Return-Path: <linux-cachefs+bncBDLIXLMFVAERBV7QZCVQMGQENL5BKXI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD218093B7
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Dec 2023 22:25:45 +0100 (CET)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-67ade35a3a2sf16473126d6.1
        for <lists+linux-cachefs@lfdr.de>; Thu, 07 Dec 2023 13:25:44 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1701984344; cv=pass;
        d=google.com; s=arc-20160816;
        b=OX28/VuKwz/DP5hNa4u1v+SLDMuR8d8lH8uUS9Y7TnWjzkss5n3RIgStjIba+5neiN
         RMqfe83JfpxI9EU8KrByHEmW21UNZkQ4f2qJTuPUrGp7hIf8LCTot9xk+Ae7LM4o7PZy
         IfAOVkcTY+ul3IqCSVkrmgwKD+S6TVkC+Ec79UlLBYSa26HC3Ruci3+GOBg5k/Q6xnKn
         yyod2CByzH+dewjnaUwsidUSNpwvw7FavSaRgwKvrKircSfUAdkrVyW9SZAkzZNT2r2X
         PX+n0aSzLOL4qfJ1GsqI54GpdOwnz5aFNS2jpUuCBZ9LAyFjtE0IFPBEVJC1K7BgeeA9
         6CkA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=kmg84I169Xh1S9mr7NO//EPI/G1okXBy40t0dmpJZUo=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=savUjm3N+fSbMlNid0y6qwgUUz7a3M9Wxr+tdYUB0buu+3VxC/YHOa+lI+EeEiTiJt
         fuZTufHGoBmWHU1GV3H+gyPG+nPdRpSH9OC3zob9OSgVDKIfR/l7y5gpcPZJcvcmy5IV
         42Pt1Q1w0qXtqUTm/Hy3V14c+pULo9Jg2XCcv0VXqMdbW1N4STI+2Wc88rPqS74CNbsq
         rBi9Je2nw2YjtZy6aarqq3hDan79NF9xuS2jKyi8VJ7jItbq8UPRAtIsw2ZOl2asHTSs
         XYkOAN0znocQ29wlOY0kHmXquJNCgVoyfuZfx7EB+TXabDv6BSy3MxD/hGHzcwj899no
         Gp+Q==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701984344; x=1702589144;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kmg84I169Xh1S9mr7NO//EPI/G1okXBy40t0dmpJZUo=;
        b=XSZKlVykQLT2ffiiALBfnYbKvv/IFV05MevJ+Mf+PGCrsSk2mNZCfIf7W2tin0/NmT
         y9g/uc6UO2+fCq4QK3gKzH1ySJZHace5sJUROsOS6z9D+LvfzA6wkPuy3zAAlXVi5ASC
         RGfhyRVSMyaOS7mwhMqsw43M/PR8e4Jb/K0J+/xzv5rExs3WwTFgPmP8fNDWrTOn0lE2
         1IYZoVRXbUNrDHbPDkeFFBtJ8+JYKburN2zc09obv5xSjLDMjLrIrNOYKSXa8HB3Ljp2
         HR9iwmwIokXALw++BoZ38tRwIi2Lu/lCRlWk3d/qL3hHJ5q6M/WKPgaRmaLGzCiSKtAw
         WHAg==
X-Gm-Message-State: AOJu0YwRHBpdgvb5EZyrlPEEaiumpmAgbcnPXj/TLU7b8UhFHbjD266a
	yC+LS1CkH0AStuhqcIGfGdkLIQ==
X-Google-Smtp-Source: AGHT+IHTVGmF1/T7HplN6Hg19P5x//m6P9lVvNv4aiCc3WsskeQj/BiJsfPdGtCPF/jqLH9eaSNORw==
X-Received: by 2002:a05:622a:100c:b0:425:4043:7641 with SMTP id d12-20020a05622a100c00b0042540437641mr3991388qte.105.1701984343845;
        Thu, 07 Dec 2023 13:25:43 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:1751:b0:423:74ab:1ef4 with SMTP id
 l17-20020a05622a175100b0042374ab1ef4ls1534163qtk.0.-pod-prod-07-us; Thu, 07
 Dec 2023 13:25:43 -0800 (PST)
X-Received: by 2002:ac8:4e88:0:b0:425:4043:764d with SMTP id 8-20020ac84e88000000b004254043764dmr4439586qtp.117.1701984343227;
        Thu, 07 Dec 2023 13:25:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701984343; cv=none;
        d=google.com; s=arc-20160816;
        b=VAwxSh8GfFrH0V/XZI4oSfs5tFItD0ilHTlLmxi1fEhrBZY4bERLWTzdJEIQLPlWyc
         fwAwzWJmXtmgmapBMcOsucTbGEqyK1FafucroHG3sVlstr8/EXkRanr5BfEkBm3C3cJ0
         dfCXba6kG8om1Eg6DjSFOSI0WWlEEDVr/hcDHvXTI8bK9+fih0SLSe7QnN6fipN/SjlS
         g/PUe6mQA5qydtvTGB4/SONTIRAs6LENqMWXNgZVhmzd6LEHfuFKBs3dU6wjdsR2O3Sg
         rsaig+CJeZJrTiraoeTDGu3Lcy9MlRlrCTz9zQXKIN1uGqo1LfIA6GwyFpWNs+6zbLCt
         fuYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=jkHq/+i184kWzc4U7JtlXy4NCBKLuAkpDj1s1fANCmA=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=EgUzrFUhaooypBrQcOuWWah9rr3o0cLvZg78s9QhnhBct8GK7QHeHSiXtf9VKYScyf
         ZsHfsv4YysWrohJuj+WJd9Igk3gBGFDwyKzKtaZMhBfKzC5qi/2z1IoQxW737Znl38Z9
         4vLAKZgTksF4ou3eZPBGbbc2tzj2gkUcQYLgarnVqLkafq+t0Q2HjTnFw2bqfIhgYQMU
         +FgWdwE84zHBVz61Toz+OjXJXqInt4sa3Vpb7GWnBN5qxZhUxkg9dmIaqdV+UGx8uKks
         R7PQTS8UmYeupW0Er1QA8JKWqovKDobqaTjexRuUrH9sFu8cqJR5FZNq3Fo2Fpex9dZo
         fj9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id f19-20020a05622a1a1300b00423a31f6625si758931qtb.115.2023.12.07.13.25.43
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 13:25:43 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-352-X4vGEfkwOGOI4rCjp1JN7w-1; Thu,
 07 Dec 2023 16:25:41 -0500
X-MC-Unique: X4vGEfkwOGOI4rCjp1JN7w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 96099386A0AF
	for <linux-cachefs@gapps.redhat.com>; Thu,  7 Dec 2023 21:25:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 9323F111E402; Thu,  7 Dec 2023 21:25:41 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BC341112131D;
	Thu,  7 Dec 2023 21:25:38 +0000 (UTC)
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
Subject: [PATCH v3 59/59] netfs: Eliminate PG_fscache by setting folio->private and marking dirty
Date: Thu,  7 Dec 2023 21:22:06 +0000
Message-ID: <20231207212206.1379128-60-dhowells@redhat.com>
In-Reply-To: <20231207212206.1379128-1-dhowells@redhat.com>
References: <20231207212206.1379128-1-dhowells@redhat.com>
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

When dirty data is being written to the cache, setting/waiting on/clearing
the fscache flag is always done in tandem with setting/waiting on/clearing
the writeback flag.  The netfslib buffered write routines wait on and set
both flags and the write request cleanup clears both flags, so the fscache
flag is almost superfluous.

The reason it isn't superfluous is because the fscache flag is also used to
indicate that data just read from the server is being written to the cache.
The flag is used to prevent a race involving overlapping direct-I/O writes
to the cache.

Change this to indicate that a page is in need of being copied to the cache
by placing a magic value in folio->private and marking the folios dirty.
Then when the writeback code sees a folio marked in this way, it only
writes it to the cache and not to the server.

If a page is altered that has this magic value set, the value is just
replaced and the page will then be uplodaded too.

With this, PG_fscache is no longer required.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: Matthew Wilcox (Oracle) <willy@infradead.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/ceph/addr.c               |  20 +----
 fs/netfs/buffered_read.c     |  22 +++---
 fs/netfs/buffered_write.c    | 102 ++++++++++++-------------
 fs/netfs/fscache_io.c        |   4 -
 fs/netfs/internal.h          |  10 ++-
 fs/netfs/io.c                | 142 -----------------------------------
 fs/netfs/main.c              |   1 +
 fs/netfs/misc.c              |  10 +--
 include/linux/netfs.h        |  16 +++-
 include/trace/events/netfs.h |   6 +-
 10 files changed, 87 insertions(+), 246 deletions(-)

diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index 500a87b68a9a..a9f278a4c928 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -496,11 +496,6 @@ const struct netfs_request_ops ceph_netfs_ops = {
 };
 
 #ifdef CONFIG_CEPH_FSCACHE
-static void ceph_set_page_fscache(struct page *page)
-{
-	set_page_fscache(page);
-}
-
 static void ceph_fscache_write_terminated(void *priv, ssize_t error, bool was_async)
 {
 	struct inode *inode = priv;
@@ -518,10 +513,6 @@ static void ceph_fscache_write_to_cache(struct inode *inode, u64 off, u64 len, b
 			       ceph_fscache_write_terminated, inode, caching);
 }
 #else
-static inline void ceph_set_page_fscache(struct page *page)
-{
-}
-
 static inline void ceph_fscache_write_to_cache(struct inode *inode, u64 off, u64 len, bool caching)
 {
 }
@@ -713,8 +704,6 @@ static int writepage_nounlock(struct page *page, struct writeback_control *wbc)
 		len = wlen;
 
 	set_page_writeback(page);
-	if (caching)
-		ceph_set_page_fscache(page);
 	ceph_fscache_write_to_cache(inode, page_off, len, caching);
 
 	if (IS_ENCRYPTED(inode)) {
@@ -796,8 +785,6 @@ static int ceph_writepage(struct page *page, struct writeback_control *wbc)
 	    ceph_inode_to_fs_client(inode)->write_congested)
 		return AOP_WRITEPAGE_ACTIVATE;
 
-	wait_on_page_fscache(page);
-
 	err = writepage_nounlock(page, wbc);
 	if (err == -ERESTARTSYS) {
 		/* direct memory reclaimer was killed by SIGKILL. return 0
@@ -1071,7 +1058,7 @@ static int ceph_writepages_start(struct address_space *mapping,
 				unlock_page(page);
 				break;
 			}
-			if (PageWriteback(page) || PageFsCache(page)) {
+			if (PageWriteback(page)) {
 				if (wbc->sync_mode == WB_SYNC_NONE) {
 					doutc(cl, "%p under writeback\n", page);
 					unlock_page(page);
@@ -1079,7 +1066,6 @@ static int ceph_writepages_start(struct address_space *mapping,
 				}
 				doutc(cl, "waiting on writeback %p\n", page);
 				wait_on_page_writeback(page);
-				wait_on_page_fscache(page);
 			}
 
 			if (!clear_page_dirty_for_io(page)) {
@@ -1264,8 +1250,6 @@ static int ceph_writepages_start(struct address_space *mapping,
 			}
 
 			set_page_writeback(page);
-			if (caching)
-				ceph_set_page_fscache(page);
 			len += thp_size(page);
 		}
 		ceph_fscache_write_to_cache(inode, offset, len, caching);
@@ -1509,7 +1493,7 @@ static int ceph_write_begin(struct file *file, struct address_space *mapping,
 	if (r < 0)
 		return r;
 
-	folio_wait_fscache(folio);
+	folio_wait_writeback(folio);
 	WARN_ON_ONCE(!folio_test_locked(folio));
 	*pagep = &folio->page;
 	return 0;
diff --git a/fs/netfs/buffered_read.c b/fs/netfs/buffered_read.c
index 8b27ef2e78ca..4da9f3a0589d 100644
--- a/fs/netfs/buffered_read.c
+++ b/fs/netfs/buffered_read.c
@@ -10,7 +10,7 @@
 #include "internal.h"
 
 /*
- * Unlock the folios in a read operation.  We need to set PG_fscache on any
+ * Unlock the folios in a read operation.  We need to set PG_writeback on any
  * folios we're going to write back before we unlock them.
  */
 void netfs_rreq_unlock_folios(struct netfs_io_request *rreq)
@@ -48,14 +48,13 @@ void netfs_rreq_unlock_folios(struct netfs_io_request *rreq)
 	xas_for_each(&xas, folio, last_page) {
 		loff_t pg_end;
 		bool pg_failed = false;
-		bool folio_started;
+		bool copy_to_cache = false;
 
 		if (xas_retry(&xas, folio))
 			continue;
 
 		pg_end = folio_pos(folio) + folio_size(folio) - 1;
 
-		folio_started = false;
 		for (;;) {
 			loff_t sreq_end;
 
@@ -63,11 +62,7 @@ void netfs_rreq_unlock_folios(struct netfs_io_request *rreq)
 				pg_failed = true;
 				break;
 			}
-			if (!folio_started && test_bit(NETFS_SREQ_COPY_TO_CACHE, &subreq->flags)) {
-				trace_netfs_folio(folio, netfs_folio_trace_copy_to_cache);
-				folio_start_fscache(folio);
-				folio_started = true;
-			}
+			copy_to_cache |= test_bit(NETFS_SREQ_COPY_TO_CACHE, &subreq->flags);
 			pg_failed |= subreq_failed;
 			sreq_end = subreq->start + subreq->len - 1;
 			if (pg_end < sreq_end)
@@ -98,6 +93,11 @@ void netfs_rreq_unlock_folios(struct netfs_io_request *rreq)
 				kfree(finfo);
 			}
 			folio_mark_uptodate(folio);
+			if (copy_to_cache && !WARN_ON_ONCE(folio_get_private(folio) != NULL)) {
+				trace_netfs_folio(folio, netfs_folio_trace_copy_to_cache);
+				folio_attach_private(folio, NETFS_FOLIO_COPY_TO_CACHE);
+				filemap_dirty_folio(folio->mapping, folio);
+			}
 		}
 
 		if (!test_bit(NETFS_RREQ_DONT_UNLOCK_FOLIOS, &rreq->flags)) {
@@ -460,7 +460,7 @@ int netfs_write_begin(struct netfs_inode *ctx,
 	if (!netfs_is_cache_enabled(ctx) &&
 	    netfs_skip_folio_read(ctx, folio, pos, len, false)) {
 		netfs_stat(&netfs_n_rh_write_zskip);
-		goto have_folio_no_wait;
+		goto have_folio;
 	}
 
 	rreq = netfs_alloc_request(mapping, file,
@@ -501,10 +501,6 @@ int netfs_write_begin(struct netfs_inode *ctx,
 	netfs_put_request(rreq, false, netfs_rreq_trace_put_return);
 
 have_folio:
-	ret = folio_wait_fscache_killable(folio);
-	if (ret < 0)
-		goto error;
-have_folio_no_wait:
 	*_folio = folio;
 	_leave(" = 0");
 	return 0;
diff --git a/fs/netfs/buffered_write.c b/fs/netfs/buffered_write.c
index 0a6ec52a3aa3..85320e18d32e 100644
--- a/fs/netfs/buffered_write.c
+++ b/fs/netfs/buffered_write.c
@@ -30,21 +30,13 @@ static void netfs_cleanup_buffered_write(struct netfs_io_request *wreq);
 
 static void netfs_set_group(struct folio *folio, struct netfs_group *netfs_group)
 {
-	if (netfs_group && !folio_get_private(folio))
-		folio_attach_private(folio, netfs_get_group(netfs_group));
-}
+	void *priv = folio_get_private(folio);
 
-#if IS_ENABLED(CONFIG_FSCACHE)
-static void netfs_folio_start_fscache(bool caching, struct folio *folio)
-{
-	if (caching)
-		folio_start_fscache(folio);
-}
-#else
-static void netfs_folio_start_fscache(bool caching, struct folio *folio)
-{
+	if (netfs_group && (!priv || priv == NETFS_FOLIO_COPY_TO_CACHE))
+		folio_attach_private(folio, netfs_get_group(netfs_group));
+	else if (!netfs_group && priv == NETFS_FOLIO_COPY_TO_CACHE)
+		folio_detach_private(folio);
 }
-#endif
 
 /*
  * Decide how we should modify a folio.  We might be attempting to do
@@ -63,11 +55,12 @@ static enum netfs_how_to_modify netfs_how_to_modify(struct netfs_inode *ctx,
 						    bool maybe_trouble)
 {
 	struct netfs_folio *finfo = netfs_folio_info(folio);
+	struct netfs_group *group = netfs_folio_group(folio);
 	loff_t pos = folio_file_pos(folio);
 
 	_enter("");
 
-	if (netfs_folio_group(folio) != netfs_group)
+	if (group != netfs_group && group != NETFS_FOLIO_COPY_TO_CACHE)
 		return NETFS_FLUSH_CONTENT;
 
 	if (folio_test_uptodate(folio))
@@ -359,9 +352,7 @@ ssize_t netfs_perform_write(struct kiocb *iocb, struct iov_iter *iter,
 				folio_clear_dirty_for_io(folio);
 			/* We make multiple writes to the folio... */
 			if (!folio_test_writeback(folio)) {
-				folio_wait_fscache(folio);
 				folio_start_writeback(folio);
-				folio_start_fscache(folio);
 				if (wreq->iter.count == 0)
 					trace_netfs_folio(folio, netfs_folio_trace_wthru);
 				else
@@ -489,6 +480,7 @@ EXPORT_SYMBOL(netfs_file_write_iter);
  */
 vm_fault_t netfs_page_mkwrite(struct vm_fault *vmf, struct netfs_group *netfs_group)
 {
+	struct netfs_group *group;
 	struct folio *folio = page_folio(vmf->page);
 	struct file *file = vmf->vma->vm_file;
 	struct inode *inode = file_inode(file);
@@ -511,7 +503,8 @@ vm_fault_t netfs_page_mkwrite(struct vm_fault *vmf, struct netfs_group *netfs_gr
 		goto out;
 	}
 
-	if (netfs_folio_group(folio) != netfs_group) {
+	group = netfs_folio_group(folio);
+	if (group != netfs_group && group != NETFS_FOLIO_COPY_TO_CACHE) {
 		folio_unlock(folio);
 		err = filemap_fdatawait_range(inode->i_mapping,
 					      folio_pos(folio),
@@ -567,8 +560,6 @@ static void netfs_kill_pages(struct address_space *mapping,
 
 		trace_netfs_folio(folio, netfs_folio_trace_kill);
 		folio_clear_uptodate(folio);
-		if (folio_test_fscache(folio))
-			folio_end_fscache(folio);
 		folio_end_writeback(folio);
 		folio_lock(folio);
 		generic_error_remove_folio(mapping, folio);
@@ -604,8 +595,6 @@ static void netfs_redirty_pages(struct address_space *mapping,
 		next = folio_next_index(folio);
 		trace_netfs_folio(folio, netfs_folio_trace_redirty);
 		filemap_dirty_folio(mapping, folio);
-		if (folio_test_fscache(folio))
-			folio_end_fscache(folio);
 		folio_end_writeback(folio);
 		folio_put(folio);
 	} while (index = next, index <= last);
@@ -661,7 +650,11 @@ static void netfs_pages_written_back(struct netfs_io_request *wreq)
 				if (!folio_test_dirty(folio)) {
 					folio_detach_private(folio);
 					gcount++;
-					trace_netfs_folio(folio, netfs_folio_trace_clear_g);
+					if (group == NETFS_FOLIO_COPY_TO_CACHE)
+						trace_netfs_folio(folio,
+								  netfs_folio_trace_end_copy);
+					else
+						trace_netfs_folio(folio, netfs_folio_trace_clear_g);
 				} else {
 					trace_netfs_folio(folio, netfs_folio_trace_redirtied);
 				}
@@ -685,8 +678,6 @@ static void netfs_pages_written_back(struct netfs_io_request *wreq)
 			trace_netfs_folio(folio, netfs_folio_trace_clear);
 		}
 	end_wb:
-		if (folio_test_fscache(folio))
-			folio_end_fscache(folio);
 		folio_end_writeback(folio);
 	}
 
@@ -755,7 +746,6 @@ static void netfs_extend_writeback(struct address_space *mapping,
 				   long *_count,
 				   loff_t start,
 				   loff_t max_len,
-				   bool caching,
 				   size_t *_len,
 				   size_t *_top)
 {
@@ -790,12 +780,10 @@ static void netfs_extend_writeback(struct address_space *mapping,
 
 			priv = rcu_dereference(*(__force void __rcu **)&folio->private);
 			if ((const struct netfs_group *)priv != group) {
-				finfo = (void *)((unsigned long)priv & ~NETFS_FOLIO_INFO);
-				if (finfo->netfs_group != group) {
-					xas_reset(xas);
-					break;
-				}
-				if (finfo->dirty_offset > 0) {
+				finfo = __netfs_folio_info(priv);
+				if (!finfo ||
+				    finfo->netfs_group != group ||
+				    finfo->dirty_offset > 0) {
 					xas_reset(xas);
 					break;
 				}
@@ -819,8 +807,7 @@ static void netfs_extend_writeback(struct address_space *mapping,
 				break;
 			}
 			if (!folio_test_dirty(folio) ||
-			    folio_test_writeback(folio) ||
-			    folio_test_fscache(folio)) {
+			    folio_test_writeback(folio)) {
 				folio_unlock(folio);
 				folio_put(folio);
 				xas_reset(xas);
@@ -832,8 +819,9 @@ static void netfs_extend_writeback(struct address_space *mapping,
 			priv = folio->private;
 			if ((const struct netfs_group *)priv != group) {
 				stop = true;
-				finfo = (void *)((unsigned long)priv & ~NETFS_FOLIO_INFO);
-				if (finfo->netfs_group != group ||
+				finfo = __netfs_folio_info(priv);
+				if (!finfo ||
+				    finfo->netfs_group != group ||
 				    finfo->dirty_offset > 0) {
 					folio_unlock(folio);
 					folio_put(folio);
@@ -867,12 +855,14 @@ static void netfs_extend_writeback(struct address_space *mapping,
 
 		for (i = 0; i < folio_batch_count(&fbatch); i++) {
 			folio = fbatch.folios[i];
-			trace_netfs_folio(folio, netfs_folio_trace_store_plus);
+			if (group == NETFS_FOLIO_COPY_TO_CACHE)
+				trace_netfs_folio(folio, netfs_folio_trace_copy_plus);
+			else
+				trace_netfs_folio(folio, netfs_folio_trace_store_plus);
 
 			if (!folio_clear_dirty_for_io(folio))
 				BUG();
 			folio_start_writeback(folio);
-			netfs_folio_start_fscache(caching, folio);
 			folio_unlock(folio);
 		}
 
@@ -898,14 +888,14 @@ static ssize_t netfs_write_back_from_locked_folio(struct address_space *mapping,
 	struct netfs_inode *ctx = netfs_inode(mapping->host);
 	unsigned long long i_size = i_size_read(&ctx->inode);
 	size_t len, max_len;
-	bool caching = netfs_is_cache_enabled(ctx);
 	long count = wbc->nr_to_write;
 	int ret;
 
-	_enter(",%lx,%llx-%llx,%u", folio_index(folio), start, end, caching);
+	_enter(",%lx,%llx-%llx", folio_index(folio), start, end);
 
 	wreq = netfs_alloc_request(mapping, NULL, start, folio_size(folio),
-				   NETFS_WRITEBACK);
+				   group == NETFS_FOLIO_COPY_TO_CACHE ?
+				   NETFS_COPY_TO_CACHE : NETFS_WRITEBACK);
 	if (IS_ERR(wreq)) {
 		folio_unlock(folio);
 		return PTR_ERR(wreq);
@@ -914,7 +904,6 @@ static ssize_t netfs_write_back_from_locked_folio(struct address_space *mapping,
 	if (!folio_clear_dirty_for_io(folio))
 		BUG();
 	folio_start_writeback(folio);
-	netfs_folio_start_fscache(caching, folio);
 
 	count -= folio_nr_pages(folio);
 
@@ -923,7 +912,10 @@ static ssize_t netfs_write_back_from_locked_folio(struct address_space *mapping,
 	 * immediately lockable, is not dirty or is missing, or we reach the
 	 * end of the range.
 	 */
-	trace_netfs_folio(folio, netfs_folio_trace_store);
+	if (group == NETFS_FOLIO_COPY_TO_CACHE)
+		trace_netfs_folio(folio, netfs_folio_trace_copy);
+	else
+		trace_netfs_folio(folio, netfs_folio_trace_store);
 
 	len = wreq->len;
 	finfo = netfs_folio_info(folio);
@@ -946,7 +938,7 @@ static ssize_t netfs_write_back_from_locked_folio(struct address_space *mapping,
 
 		if (len < max_len)
 			netfs_extend_writeback(mapping, group, xas, &count, start,
-					       max_len, caching, &len, &wreq->upper_len);
+					       max_len, &len, &wreq->upper_len);
 	}
 
 cant_expand:
@@ -970,15 +962,18 @@ static ssize_t netfs_write_back_from_locked_folio(struct address_space *mapping,
 
 		iov_iter_xarray(&wreq->iter, ITER_SOURCE, &mapping->i_pages, start,
 				wreq->upper_len);
-		__set_bit(NETFS_RREQ_UPLOAD_TO_SERVER, &wreq->flags);
-		ret = netfs_begin_write(wreq, true, netfs_write_trace_writeback);
+		if (group != NETFS_FOLIO_COPY_TO_CACHE) {
+			__set_bit(NETFS_RREQ_UPLOAD_TO_SERVER, &wreq->flags);
+			ret = netfs_begin_write(wreq, true, netfs_write_trace_writeback);
+		} else {
+			ret = netfs_begin_write(wreq, true, netfs_write_trace_copy_to_cache);
+		}
 		if (ret == 0 || ret == -EIOCBQUEUED)
 			wbc->nr_to_write -= len / PAGE_SIZE;
 	} else {
 		_debug("write discard %zx @%llx [%llx]", len, start, i_size);
 
 		/* The dirty region was entirely beyond the EOF. */
-		fscache_clear_page_bits(mapping, start, len, caching);
 		netfs_pages_written_back(wreq);
 		ret = 0;
 	}
@@ -1020,9 +1015,11 @@ static ssize_t netfs_writepages_begin(struct address_space *mapping,
 
 		/* Skip any dirty folio that's not in the group of interest. */
 		priv = rcu_dereference(*(__force void __rcu **)&folio->private);
-		if ((const struct netfs_group *)priv != group) {
-			finfo = (void *)((unsigned long)priv & ~NETFS_FOLIO_INFO);
-			if (finfo->netfs_group != group)
+		if ((const struct netfs_group *)priv == NETFS_FOLIO_COPY_TO_CACHE) {
+			group = NETFS_FOLIO_COPY_TO_CACHE;
+		} else if ((const struct netfs_group *)priv != group) {
+			finfo = __netfs_folio_info(priv);
+			if (!finfo || finfo->netfs_group != group)
 				continue;
 		}
 
@@ -1070,8 +1067,7 @@ static ssize_t netfs_writepages_begin(struct address_space *mapping,
 		goto search_again;
 	}
 
-	if (folio_test_writeback(folio) ||
-	    folio_test_fscache(folio)) {
+	if (folio_test_writeback(folio)) {
 		folio_unlock(folio);
 		if (wbc->sync_mode != WB_SYNC_NONE) {
 			folio_wait_writeback(folio);
@@ -1236,7 +1232,8 @@ int netfs_launder_folio(struct folio *folio)
 
 	bvec_set_folio(&bvec, folio, len, offset);
 	iov_iter_bvec(&wreq->iter, ITER_SOURCE, &bvec, 1, len);
-	__set_bit(NETFS_RREQ_UPLOAD_TO_SERVER, &wreq->flags);
+	if (group != NETFS_FOLIO_COPY_TO_CACHE)
+		__set_bit(NETFS_RREQ_UPLOAD_TO_SERVER, &wreq->flags);
 	ret = netfs_begin_write(wreq, true, netfs_write_trace_launder);
 
 out_put:
@@ -1245,7 +1242,6 @@ int netfs_launder_folio(struct folio *folio)
 	kfree(finfo);
 	netfs_put_request(wreq, false, netfs_rreq_trace_put_return);
 out:
-	folio_wait_fscache(folio);
 	_leave(" = %d", ret);
 	return ret;
 }
diff --git a/fs/netfs/fscache_io.c b/fs/netfs/fscache_io.c
index ad572f7ee897..ad57e4412c6d 100644
--- a/fs/netfs/fscache_io.c
+++ b/fs/netfs/fscache_io.c
@@ -195,9 +195,6 @@ static void fscache_wreq_done(void *priv, ssize_t transferred_or_error,
 {
 	struct fscache_write_request *wreq = priv;
 
-	fscache_clear_page_bits(wreq->mapping, wreq->start, wreq->len,
-				wreq->set_bits);
-
 	if (wreq->term_func)
 		wreq->term_func(wreq->term_func_priv, transferred_or_error,
 				was_async);
@@ -255,7 +252,6 @@ void __fscache_write_to_cache(struct fscache_cookie *cookie,
 abandon_free:
 	kfree(wreq);
 abandon:
-	fscache_clear_page_bits(mapping, start, len, cond);
 	if (term_func)
 		term_func(term_func_priv, ret, false);
 }
diff --git a/fs/netfs/internal.h b/fs/netfs/internal.h
index dfc2351c69d7..2c4cd3c898c7 100644
--- a/fs/netfs/internal.h
+++ b/fs/netfs/internal.h
@@ -186,7 +186,7 @@ static inline bool netfs_is_cache_enabled(struct netfs_inode *ctx)
  */
 static inline struct netfs_group *netfs_get_group(struct netfs_group *netfs_group)
 {
-	if (netfs_group)
+	if (netfs_group && netfs_group != NETFS_FOLIO_COPY_TO_CACHE)
 		refcount_inc(&netfs_group->ref);
 	return netfs_group;
 }
@@ -196,7 +196,9 @@ static inline struct netfs_group *netfs_get_group(struct netfs_group *netfs_grou
  */
 static inline void netfs_put_group(struct netfs_group *netfs_group)
 {
-	if (netfs_group && refcount_dec_and_test(&netfs_group->ref))
+	if (netfs_group &&
+	    netfs_group != NETFS_FOLIO_COPY_TO_CACHE &&
+	    refcount_dec_and_test(&netfs_group->ref))
 		netfs_group->free(netfs_group);
 }
 
@@ -205,7 +207,9 @@ static inline void netfs_put_group(struct netfs_group *netfs_group)
  */
 static inline void netfs_put_group_many(struct netfs_group *netfs_group, int nr)
 {
-	if (netfs_group && refcount_sub_and_test(nr, &netfs_group->ref))
+	if (netfs_group &&
+	    netfs_group != NETFS_FOLIO_COPY_TO_CACHE &&
+	    refcount_sub_and_test(nr, &netfs_group->ref))
 		netfs_group->free(netfs_group);
 }
 
diff --git a/fs/netfs/io.c b/fs/netfs/io.c
index 4702799a153b..4199e2df609f 100644
--- a/fs/netfs/io.c
+++ b/fs/netfs/io.c
@@ -98,145 +98,6 @@ static void netfs_rreq_completed(struct netfs_io_request *rreq, bool was_async)
 	netfs_put_request(rreq, was_async, netfs_rreq_trace_put_complete);
 }
 
-/*
- * Deal with the completion of writing the data to the cache.  We have to clear
- * the PG_fscache bits on the folios involved and release the caller's ref.
- *
- * May be called in softirq mode and we inherit a ref from the caller.
- */
-static void netfs_rreq_unmark_after_write(struct netfs_io_request *rreq,
-					  bool was_async)
-{
-	struct netfs_io_subrequest *subreq;
-	struct folio *folio;
-	pgoff_t unlocked = 0;
-	bool have_unlocked = false;
-
-	rcu_read_lock();
-
-	list_for_each_entry(subreq, &rreq->subrequests, rreq_link) {
-		XA_STATE(xas, &rreq->mapping->i_pages, subreq->start / PAGE_SIZE);
-
-		xas_for_each(&xas, folio, (subreq->start + subreq->len - 1) / PAGE_SIZE) {
-			if (xas_retry(&xas, folio))
-				continue;
-
-			/* We might have multiple writes from the same huge
-			 * folio, but we mustn't unlock a folio more than once.
-			 */
-			if (have_unlocked && folio_index(folio) <= unlocked)
-				continue;
-			unlocked = folio_index(folio);
-			trace_netfs_folio(folio, netfs_folio_trace_end_copy);
-			folio_end_fscache(folio);
-			have_unlocked = true;
-		}
-	}
-
-	rcu_read_unlock();
-	netfs_rreq_completed(rreq, was_async);
-}
-
-static void netfs_rreq_copy_terminated(void *priv, ssize_t transferred_or_error,
-				       bool was_async)
-{
-	struct netfs_io_subrequest *subreq = priv;
-	struct netfs_io_request *rreq = subreq->rreq;
-
-	if (IS_ERR_VALUE(transferred_or_error)) {
-		netfs_stat(&netfs_n_rh_write_failed);
-		trace_netfs_failure(rreq, subreq, transferred_or_error,
-				    netfs_fail_copy_to_cache);
-	} else {
-		netfs_stat(&netfs_n_rh_write_done);
-	}
-
-	trace_netfs_sreq(subreq, netfs_sreq_trace_write_term);
-
-	/* If we decrement nr_copy_ops to 0, the ref belongs to us. */
-	if (atomic_dec_and_test(&rreq->nr_copy_ops))
-		netfs_rreq_unmark_after_write(rreq, was_async);
-
-	netfs_put_subrequest(subreq, was_async, netfs_sreq_trace_put_terminated);
-}
-
-/*
- * Perform any outstanding writes to the cache.  We inherit a ref from the
- * caller.
- */
-static void netfs_rreq_do_write_to_cache(struct netfs_io_request *rreq)
-{
-	struct netfs_cache_resources *cres = &rreq->cache_resources;
-	struct netfs_io_subrequest *subreq, *next, *p;
-	struct iov_iter iter;
-	int ret;
-
-	trace_netfs_rreq(rreq, netfs_rreq_trace_copy);
-
-	/* We don't want terminating writes trying to wake us up whilst we're
-	 * still going through the list.
-	 */
-	atomic_inc(&rreq->nr_copy_ops);
-
-	list_for_each_entry_safe(subreq, p, &rreq->subrequests, rreq_link) {
-		if (!test_bit(NETFS_SREQ_COPY_TO_CACHE, &subreq->flags)) {
-			list_del_init(&subreq->rreq_link);
-			netfs_put_subrequest(subreq, false,
-					     netfs_sreq_trace_put_no_copy);
-		}
-	}
-
-	list_for_each_entry(subreq, &rreq->subrequests, rreq_link) {
-		/* Amalgamate adjacent writes */
-		while (!list_is_last(&subreq->rreq_link, &rreq->subrequests)) {
-			next = list_next_entry(subreq, rreq_link);
-			if (next->start != subreq->start + subreq->len)
-				break;
-			subreq->len += next->len;
-			list_del_init(&next->rreq_link);
-			netfs_put_subrequest(next, false,
-					     netfs_sreq_trace_put_merged);
-		}
-
-		ret = cres->ops->prepare_write(cres, &subreq->start, &subreq->len,
-					       subreq->len, rreq->i_size, true);
-		if (ret < 0) {
-			trace_netfs_failure(rreq, subreq, ret, netfs_fail_prepare_write);
-			trace_netfs_sreq(subreq, netfs_sreq_trace_write_skip);
-			continue;
-		}
-
-		iov_iter_xarray(&iter, ITER_SOURCE, &rreq->mapping->i_pages,
-				subreq->start, subreq->len);
-
-		atomic_inc(&rreq->nr_copy_ops);
-		netfs_stat(&netfs_n_rh_write);
-		netfs_get_subrequest(subreq, netfs_sreq_trace_get_copy_to_cache);
-		trace_netfs_sreq(subreq, netfs_sreq_trace_write);
-		cres->ops->write(cres, subreq->start, &iter,
-				 netfs_rreq_copy_terminated, subreq);
-	}
-
-	/* If we decrement nr_copy_ops to 0, the usage ref belongs to us. */
-	if (atomic_dec_and_test(&rreq->nr_copy_ops))
-		netfs_rreq_unmark_after_write(rreq, false);
-}
-
-static void netfs_rreq_write_to_cache_work(struct work_struct *work)
-{
-	struct netfs_io_request *rreq =
-		container_of(work, struct netfs_io_request, work);
-
-	netfs_rreq_do_write_to_cache(rreq);
-}
-
-static void netfs_rreq_write_to_cache(struct netfs_io_request *rreq)
-{
-	rreq->work.func = netfs_rreq_write_to_cache_work;
-	if (!queue_work(system_unbound_wq, &rreq->work))
-		BUG();
-}
-
 /*
  * Handle a short read.
  */
@@ -417,9 +278,6 @@ static void netfs_rreq_assess(struct netfs_io_request *rreq, bool was_async)
 	clear_bit_unlock(NETFS_RREQ_IN_PROGRESS, &rreq->flags);
 	wake_up_bit(&rreq->flags, NETFS_RREQ_IN_PROGRESS);
 
-	if (test_bit(NETFS_RREQ_COPY_TO_CACHE, &rreq->flags))
-		return netfs_rreq_write_to_cache(rreq);
-
 	netfs_rreq_completed(rreq, was_async);
 }
 
diff --git a/fs/netfs/main.c b/fs/netfs/main.c
index 3a45ecdc4eac..cafefe323e9d 100644
--- a/fs/netfs/main.c
+++ b/fs/netfs/main.c
@@ -32,6 +32,7 @@ static const char *netfs_origins[nr__netfs_io_origin] = {
 	[NETFS_READAHEAD]		= "RA",
 	[NETFS_READPAGE]		= "RP",
 	[NETFS_READ_FOR_WRITE]		= "RW",
+	[NETFS_COPY_TO_CACHE]		= "CC",
 	[NETFS_WRITEBACK]		= "WB",
 	[NETFS_WRITETHROUGH]		= "WT",
 	[NETFS_LAUNDER_WRITE]		= "LW",
diff --git a/fs/netfs/misc.c b/fs/netfs/misc.c
index 31e45dfad5b0..020a0e906919 100644
--- a/fs/netfs/misc.c
+++ b/fs/netfs/misc.c
@@ -177,13 +177,11 @@ EXPORT_SYMBOL(netfs_clear_inode_writeback);
  */
 void netfs_invalidate_folio(struct folio *folio, size_t offset, size_t length)
 {
-	struct netfs_folio *finfo = NULL;
+	struct netfs_folio *finfo;
 	size_t flen = folio_size(folio);
 
 	_enter("{%lx},%zx,%zx", folio_index(folio), offset, length);
 
-	folio_wait_fscache(folio);
-
 	if (!folio_test_private(folio))
 		return;
 
@@ -248,12 +246,6 @@ bool netfs_release_folio(struct folio *folio, gfp_t gfp)
 
 	if (folio_test_private(folio))
 		return false;
-	if (folio_test_fscache(folio)) {
-		if (current_is_kswapd() || !(gfp & __GFP_FS))
-			return false;
-		folio_wait_fscache(folio);
-	}
-
 	fscache_note_page_release(netfs_i_cookie(ctx));
 	return true;
 }
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 39ff06dd4c17..2b5f4535aaa9 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -169,16 +169,25 @@ struct netfs_folio {
 	unsigned int		dirty_len;	/* Write-streaming dirty data length */
 };
 #define NETFS_FOLIO_INFO	0x1UL	/* OR'd with folio->private. */
+#define NETFS_FOLIO_COPY_TO_CACHE ((struct netfs_group *)0x356UL) /* Write to the cache only */
 
-static inline struct netfs_folio *netfs_folio_info(struct folio *folio)
+static inline bool netfs_is_folio_info(const void *priv)
 {
-	void *priv = folio_get_private(folio);
+	return (unsigned long)priv & NETFS_FOLIO_INFO;
+}
 
-	if ((unsigned long)priv & NETFS_FOLIO_INFO)
+static inline struct netfs_folio *__netfs_folio_info(const void *priv)
+{
+	if (netfs_is_folio_info(priv))
 		return (struct netfs_folio *)((unsigned long)priv & ~NETFS_FOLIO_INFO);
 	return NULL;
 }
 
+static inline struct netfs_folio *netfs_folio_info(struct folio *folio)
+{
+	return __netfs_folio_info(folio_get_private(folio));
+}
+
 static inline struct netfs_group *netfs_folio_group(struct folio *folio)
 {
 	struct netfs_folio *finfo;
@@ -234,6 +243,7 @@ enum netfs_io_origin {
 	NETFS_READAHEAD,		/* This read was triggered by readahead */
 	NETFS_READPAGE,			/* This read is a synchronous read */
 	NETFS_READ_FOR_WRITE,		/* This read is to prepare a write */
+	NETFS_COPY_TO_CACHE,		/* This write is to copy a read to the cache */
 	NETFS_WRITEBACK,		/* This write was triggered by writepages */
 	NETFS_WRITETHROUGH,		/* This write was made by netfs_perform_write() */
 	NETFS_LAUNDER_WRITE,		/* This is triggered by ->launder_folio() */
diff --git a/include/trace/events/netfs.h b/include/trace/events/netfs.h
index 6d39292559bf..218c486bf9cd 100644
--- a/include/trace/events/netfs.h
+++ b/include/trace/events/netfs.h
@@ -24,6 +24,7 @@
 	E_(netfs_read_trace_write_begin,	"WRITEBEGN")
 
 #define netfs_write_traces					\
+	EM(netfs_write_trace_copy_to_cache,	"COPY2CACH")	\
 	EM(netfs_write_trace_dio_write,		"DIO-WRITE")	\
 	EM(netfs_write_trace_launder,		"LAUNDER  ")	\
 	EM(netfs_write_trace_unbuffered_write,	"UNB-WRITE")	\
@@ -34,6 +35,7 @@
 	EM(NETFS_READAHEAD,			"RA")		\
 	EM(NETFS_READPAGE,			"RP")		\
 	EM(NETFS_READ_FOR_WRITE,		"RW")		\
+	EM(NETFS_COPY_TO_CACHE,			"CC")		\
 	EM(NETFS_WRITEBACK,			"WB")		\
 	EM(NETFS_WRITETHROUGH,			"WT")		\
 	EM(NETFS_LAUNDER_WRITE,			"LW")		\
@@ -133,7 +135,9 @@
 	EM(netfs_folio_trace_clear,		"clear")	\
 	EM(netfs_folio_trace_clear_s,		"clear-s")	\
 	EM(netfs_folio_trace_clear_g,		"clear-g")	\
-	EM(netfs_folio_trace_copy_to_cache,	"copy")		\
+	EM(netfs_folio_trace_copy,		"copy")		\
+	EM(netfs_folio_trace_copy_plus,		"copy+")	\
+	EM(netfs_folio_trace_copy_to_cache,	"mark-copy")	\
 	EM(netfs_folio_trace_end_copy,		"end-copy")	\
 	EM(netfs_folio_trace_filled_gaps,	"filled-gaps")	\
 	EM(netfs_folio_trace_kill,		"kill")		\

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

