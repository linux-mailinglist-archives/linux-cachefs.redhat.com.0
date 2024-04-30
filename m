Return-Path: <linux-cachefs+bncBDLIXLMFVAERBM7TYOYQMGQETHAZPYY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9328B77CB
	for <lists+linux-cachefs@lfdr.de>; Tue, 30 Apr 2024 16:01:25 +0200 (CEST)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-436e10399b8sf129992351cf.0
        for <lists+linux-cachefs@lfdr.de>; Tue, 30 Apr 2024 07:01:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1714485684; cv=pass;
        d=google.com; s=arc-20160816;
        b=EOpXiL8a//8aSoQXxzfkJcm+CyjMnFYDnkAfbklDZbDR8ULEy9KhV0RAdiGf4NUTVR
         v+JU/ZWEGfdvpAOIHuKfagfMe9rbHsq9dpYRv8JYI5LKoHJVkH8dORptRUmlsxMGnEBH
         j+IEnNEOVLSXwSZtrYLzMgcOaU2kTDngbBegHgFOcPh3jPyPOhg8EYCoQ2cZ21nDn+KP
         USoDky8UH3FMD/KYIDAAzt00DgAkycDsGIWfs0mbqbGzDtnRzics4Y9FiKEC9N3f+yfg
         tVe4OoZXn/qrkSme31depQh/GunPn+z7aAGgjBtVNNLlCD+zT+dFsTZYNiYP9ikYng1E
         Qo9Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=GmoiAJrBfvermL7/QDgMZDJc77tc4aVagxqFz0cXWbs=;
        fh=0CLq0M2t8591rSl+eLnZJ0HcNjUIjJirQ3ZJkv3nRyE=;
        b=St6L8qBDsRtmfLrtm+1Qy5Ze3HxL0Ro9NgVdqsf3hFPrxkw1qp52c2r6u+sqnKfOqu
         YyZPP/BKAQUL2Szx9/y8dtUFO72mh/eueiwx5wcXEaoJ4cWNc1i9qrrlJnxlugR+ahbe
         cGf3bRszPZmNhOZ4YKFbhHGB/hhP4E2orhim/8J26U2f8j4Q9T0d0yULSb1t0WhgtioR
         BlEdayZHbIoGcZjQ1KWw7X+eCMvwBQOSxSO1BNxesxYNGTotDqG3l3ZRbJjA84ggbut3
         nNM6ImduhPQ5z9jnZQl0WFOMDFAH6C8TSGUPwWt/gmxZfNNb/1MDVQwsvT6ce98k+iuw
         y85w==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485684; x=1715090484;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GmoiAJrBfvermL7/QDgMZDJc77tc4aVagxqFz0cXWbs=;
        b=Hk2l3Z640dhqrN0CAlPBFFI8o4DmmSTuL8LQfQDy8HWSx3DgrWvnSgoatC1S8qzlza
         dzQdSu1qhOJ4Ld2RMjgmEoWM5Gw4AK0xXr7CF8hHjfsPYEltd3eGNnEheBNEEkCD8UMd
         6eraAZuXYeBKZIvXCyw0LZ3g6tqlH7NKZxrSkjP2P8xyqXjlffh8HS5NfHWa1/CBcOC9
         C0ODtf3CcTjEhDdmFmX6Ll/U9TtuTb//t6+36CnBpt0pN5Mu15BpMALbXh8L8s+d7zVQ
         josrXR0ELXVaVzbR3rYiRzU3J3hfkOITy9pGGl+wyAF0uXHJLBAhYG78lSEA364Wkk0V
         1UOw==
X-Forwarded-Encrypted: i=2; AJvYcCWDr0+1T+avo7MYVsewb5Aud7RAMOK1F2mez2OeLMKd7w9OThBTKrdreGnCIolO3R1nlQy8iJC/yXrqquodGR9QrUhG5bv0GP4HDY4=
X-Gm-Message-State: AOJu0YxUE4ltCChVqHOmFSep77KzBxC3Fbyg43uljjDZbysFAui11pTG
	oTlXiAYCQbmyDZeiGcVwnQC2z/B0lTAFiWQ/S+SrYlaeBkp6cJiIgVuGEQaDa9Q=
X-Google-Smtp-Source: AGHT+IHB9aJO2T9keQwgmfxdpiqIk/BKK3axCOmMil3uLIUdKtx29ATXMtOJc+ewEwQAiEtioWZOSA==
X-Received: by 2002:ac8:5902:0:b0:439:e82a:c8bf with SMTP id 2-20020ac85902000000b00439e82ac8bfmr5153955qty.4.1714485683981;
        Tue, 30 Apr 2024 07:01:23 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:1789:b0:43a:f8c0:d7cd with SMTP id
 d75a77b69052e-43af8c0d923ls9694041cf.2.-pod-prod-00-us; Tue, 30 Apr 2024
 07:01:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU3VCKDp816jk0xEOFozsg0SuVKeP038cPSoNQGmJI+cUL88jF01f0ykEs0Pi8Fc9P/peRQ9gtMsjhJXUp8atIx4jjyOcwTc6yr7yZvTrk=
X-Received: by 2002:a05:620a:4081:b0:790:f5b3:a186 with SMTP id f1-20020a05620a408100b00790f5b3a186mr4555994qko.8.1714485682930;
        Tue, 30 Apr 2024 07:01:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714485682; cv=none;
        d=google.com; s=arc-20160816;
        b=mEYw6XmyzwSi+uIZ6qYeyXPQrboehgakc1yI9e+cWj8WoE8vLPlVa2iR5bl5ayRtMJ
         Fyng/lplvfp+dXpVO/WQwBE7VPWy3gkr5zPk20dBoieKtx9KbvVJmUieezf5PDYJhwjS
         TZYYewuJv2aHs/EhsCu5iHIFEzwApSJ8E1fCdEnFrS3mEGF0Uwge4lzNSAxNcw1vexRM
         pCnwThT/0+Mq9AU2SjDI27Mf3upiXl+LLnx4lvHf7BSNXAbj/2yHUKdodnOKsew32M4k
         Ll35sXzTc8yfCYw0pwfz6XXFQPuVwP/0GqnQDRs2z6nNTOLeWcqKt7wSL6r12FN3xvyO
         SNyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=Cm3cVHJn3glRWj2NOBwQjPn4OMyifol1a955ZreqhbY=;
        fh=dijFYpEVp+4ijccmXeOrV1fnLJQjsqwgNfcTPuMjuvg=;
        b=c2bhVKhvRt8Sm3LCJSSCU4B4hXMJt7oPpQiUgHqd+bMNbNMA3QRBTK916WzRKOB9BN
         7xw4QR+fC3IjXxZcpgWBW3IQQKk3b/8UW98ZxeD/rTg5Ya2VT0K4kgptixzU/inJPKWP
         8ocLsY00dAiTbbuf6jrCaoUco+T3U7n0f0E8gc03OjwB3G33Zkm2ZnwJ3Um/RxsZxtne
         U8x7dnV6e6iZegFFXwK4KED92J9zaDuyaAbRYHiB1Q+XijvtZFczEbZKQygd6aVsn3ec
         GRDnxIkENf0mOnaM9bRic2CNHm1za9402NjPHyJle61eOkm01ffs5Q4OZD0ZNNhiCs45
         immg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id vz18-20020a05620a495200b00790fa26400dsi3806275qkn.417.2024.04.30.07.01.22
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:01:22 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-26-Bp1_pVmsOJ2Tg7wdBX8MiQ-1; Tue, 30 Apr 2024 10:01:20 -0400
X-MC-Unique: Bp1_pVmsOJ2Tg7wdBX8MiQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 920F518065B1
	for <linux-cachefs@gapps.redhat.com>; Tue, 30 Apr 2024 14:01:20 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 8E4E0581DC; Tue, 30 Apr 2024 14:01:20 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6AC5D581C8;
	Tue, 30 Apr 2024 14:01:17 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Christian Brauner <christian@brauner.io>,
	Jeff Layton <jlayton@kernel.org>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Dominique Martinet <asmadeus@codewreck.org>
Cc: David Howells <dhowells@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Steve French <smfrench@gmail.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	netfs@lists.linux.dev,
	linux-cachefs@redhat.com,
	linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	v9fs@lists.linux.dev,
	linux-erofs@lists.ozlabs.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/22] netfs: Remove deprecated use of PG_private_2 as a second writeback flag
Date: Tue, 30 Apr 2024 15:00:35 +0100
Message-ID: <20240430140056.261997-5-dhowells@redhat.com>
In-Reply-To: <20240430140056.261997-1-dhowells@redhat.com>
References: <20240430140056.261997-1-dhowells@redhat.com>
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

Remove the deprecated use of PG_private_2 in netfslib.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
cc: Matthew Wilcox (Oracle) <willy@infradead.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/ceph/addr.c           |  19 +-----
 fs/netfs/buffered_read.c |   8 +--
 fs/netfs/io.c            | 144 ---------------------------------------
 3 files changed, 2 insertions(+), 169 deletions(-)

diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index 18ddacb00511..74bfd10b1b1a 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -498,11 +498,6 @@ const struct netfs_request_ops ceph_netfs_ops = {
 };
 
 #ifdef CONFIG_CEPH_FSCACHE
-static void ceph_set_page_fscache(struct page *page)
-{
-	folio_start_private_2(page_folio(page)); /* [DEPRECATED] */
-}
-
 static void ceph_fscache_write_terminated(void *priv, ssize_t error, bool was_async)
 {
 	struct inode *inode = priv;
@@ -520,10 +515,6 @@ static void ceph_fscache_write_to_cache(struct inode *inode, u64 off, u64 len, b
 			       ceph_fscache_write_terminated, inode, true, caching);
 }
 #else
-static inline void ceph_set_page_fscache(struct page *page)
-{
-}
-
 static inline void ceph_fscache_write_to_cache(struct inode *inode, u64 off, u64 len, bool caching)
 {
 }
@@ -715,8 +706,6 @@ static int writepage_nounlock(struct page *page, struct writeback_control *wbc)
 		len = wlen;
 
 	set_page_writeback(page);
-	if (caching)
-		ceph_set_page_fscache(page);
 	ceph_fscache_write_to_cache(inode, page_off, len, caching);
 
 	if (IS_ENCRYPTED(inode)) {
@@ -800,8 +789,6 @@ static int ceph_writepage(struct page *page, struct writeback_control *wbc)
 		return AOP_WRITEPAGE_ACTIVATE;
 	}
 
-	folio_wait_private_2(page_folio(page)); /* [DEPRECATED] */
-
 	err = writepage_nounlock(page, wbc);
 	if (err == -ERESTARTSYS) {
 		/* direct memory reclaimer was killed by SIGKILL. return 0
@@ -1075,8 +1062,7 @@ static int ceph_writepages_start(struct address_space *mapping,
 				unlock_page(page);
 				break;
 			}
-			if (PageWriteback(page) ||
-			    PagePrivate2(page) /* [DEPRECATED] */) {
+			if (PageWriteback(page)) {
 				if (wbc->sync_mode == WB_SYNC_NONE) {
 					doutc(cl, "%p under writeback\n", page);
 					unlock_page(page);
@@ -1084,7 +1070,6 @@ static int ceph_writepages_start(struct address_space *mapping,
 				}
 				doutc(cl, "waiting on writeback %p\n", page);
 				wait_on_page_writeback(page);
-				folio_wait_private_2(page_folio(page)); /* [DEPRECATED] */
 			}
 
 			if (!clear_page_dirty_for_io(page)) {
@@ -1269,8 +1254,6 @@ static int ceph_writepages_start(struct address_space *mapping,
 			}
 
 			set_page_writeback(page);
-			if (caching)
-				ceph_set_page_fscache(page);
 			len += thp_size(page);
 		}
 		ceph_fscache_write_to_cache(inode, offset, len, caching);
diff --git a/fs/netfs/buffered_read.c b/fs/netfs/buffered_read.c
index b3fd6e1fa322..1622cce535a3 100644
--- a/fs/netfs/buffered_read.c
+++ b/fs/netfs/buffered_read.c
@@ -464,7 +464,7 @@ int netfs_write_begin(struct netfs_inode *ctx,
 	if (!netfs_is_cache_enabled(ctx) &&
 	    netfs_skip_folio_read(folio, pos, len, false)) {
 		netfs_stat(&netfs_n_rh_write_zskip);
-		goto have_folio_no_wait;
+		goto have_folio;
 	}
 
 	rreq = netfs_alloc_request(mapping, file,
@@ -505,12 +505,6 @@ int netfs_write_begin(struct netfs_inode *ctx,
 	netfs_put_request(rreq, false, netfs_rreq_trace_put_return);
 
 have_folio:
-	if (test_bit(NETFS_ICTX_USE_PGPRIV2, &ctx->flags)) {
-		ret = folio_wait_private_2_killable(folio);
-		if (ret < 0)
-			goto error;
-	}
-have_folio_no_wait:
 	*_folio = folio;
 	_leave(" = 0");
 	return 0;
diff --git a/fs/netfs/io.c b/fs/netfs/io.c
index 60a19f96e0ce..2641238aae82 100644
--- a/fs/netfs/io.c
+++ b/fs/netfs/io.c
@@ -98,146 +98,6 @@ static void netfs_rreq_completed(struct netfs_io_request *rreq, bool was_async)
 	netfs_put_request(rreq, was_async, netfs_rreq_trace_put_complete);
 }
 
-/*
- * [DEPRECATED] Deal with the completion of writing the data to the cache.  We
- * have to clear the PG_fscache bits on the folios involved and release the
- * caller's ref.
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
-			if (have_unlocked && folio->index <= unlocked)
-				continue;
-			unlocked = folio_next_index(folio) - 1;
-			trace_netfs_folio(folio, netfs_folio_trace_end_copy);
-			folio_end_private_2(folio);
-			have_unlocked = true;
-		}
-	}
-
-	rcu_read_unlock();
-	netfs_rreq_completed(rreq, was_async);
-}
-
-static void netfs_rreq_copy_terminated(void *priv, ssize_t transferred_or_error,
-				       bool was_async) /* [DEPRECATED] */
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
- * [DEPRECATED] Perform any outstanding writes to the cache.  We inherit a ref
- * from the caller.
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
-static void netfs_rreq_write_to_cache_work(struct work_struct *work) /* [DEPRECATED] */
-{
-	struct netfs_io_request *rreq =
-		container_of(work, struct netfs_io_request, work);
-
-	netfs_rreq_do_write_to_cache(rreq);
-}
-
-static void netfs_rreq_write_to_cache(struct netfs_io_request *rreq) /* [DEPRECATED] */
-{
-	rreq->work.func = netfs_rreq_write_to_cache_work;
-	if (!queue_work(system_unbound_wq, &rreq->work))
-		BUG();
-}
-
 /*
  * Handle a short read.
  */
@@ -410,10 +270,6 @@ static void netfs_rreq_assess(struct netfs_io_request *rreq, bool was_async)
 	clear_bit_unlock(NETFS_RREQ_IN_PROGRESS, &rreq->flags);
 	wake_up_bit(&rreq->flags, NETFS_RREQ_IN_PROGRESS);
 
-	if (test_bit(NETFS_RREQ_COPY_TO_CACHE, &rreq->flags) &&
-	    test_bit(NETFS_RREQ_USE_PGPRIV2, &rreq->flags))
-		return netfs_rreq_write_to_cache(rreq);
-
 	netfs_rreq_completed(rreq, was_async);
 }
 

To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

