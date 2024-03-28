Return-Path: <linux-cachefs+bncBDLIXLMFVAERB55YS2YAMGQECOJCYZY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9AE89055C
	for <lists+linux-cachefs@lfdr.de>; Thu, 28 Mar 2024 17:36:08 +0100 (CET)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-690ab2b0de1sf2027716d6.0
        for <lists+linux-cachefs@lfdr.de>; Thu, 28 Mar 2024 09:36:08 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1711643768; cv=pass;
        d=google.com; s=arc-20160816;
        b=GEphpwtmpHfkxbUYi80hZFJmFAYsNwBW1M0zWT4D/5GOI+15XrPWL5EZCn5DPluwyo
         APS79wq+cp7NqhZQxRFFgpISd186M5DJy7GQ74DHvoJQcLCdAOFGs+s843/+/1yDmlcv
         4dR4Wr7LAG41YCdYT4FETpTyRGaOq3bioAWZE92r85dNdnPuf5CJoNNM/odvPuboe4w+
         dMayyyutafLWbuPU+rqXUQb35pIRlHwAgGZnFLIgjqaAzbv2sQGmucRsbqhlIZTH/xmh
         T6ulqJIc5sW8fNxCdjB8HuQXguJ5ydAOAe80Bgw6audEHkeIITViPBgdztYNKGmIsiBV
         AwOA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=213yOZKOJq+iZy0Z0Q+HcMeFKApQfhwnCjy2sAyUP0A=;
        fh=12Ro21+VZMeunog1GWnAj0ubV9TSO0ln+Ae4SkT4K5s=;
        b=cIZZwR1eEDOUANaYX3chNF3kAmVXgmDb44SKZ7o+0uNRIJjauuyGpMrbU/5tPBS17Y
         mkARJy5LygRYNXHSgAoFBJ7GzefbKpJSIls0DfqUT2hMqh5OXjmza6r8j7vlRBrtn9FG
         OO6RgQLiI2Mf/0wtgLUd153g8XM2fnZH3wW6zHQnlIH/JMk2nAIcqLZTSwnwsmlfOjMj
         cZpNlgw/ZVwzx9xjI9+EcWA69g3+6tDXCWFhPYZHn1oOua5SQDCySW2+jDnV/N8uA7Ni
         cfI1jq3JU2nDeiDznE0Iww3uWbT82Eil4INuVFeRv/b2SzZ/9fi7DSa2JgsyDjd3F1db
         89Qg==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711643768; x=1712248568;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=213yOZKOJq+iZy0Z0Q+HcMeFKApQfhwnCjy2sAyUP0A=;
        b=NxloP075DqcEqEfGpe2ZMUQigEwf9ci0oKcyoaTYFnvBFFaJE4JKzUaPwNJDzKVNa2
         y+OGNkYKjdyIQlzkNODyFz0n5N21tccdj1gAn3bRciZyh3bZYksJzHkOFDDlOITnG+yY
         UY703ml8HVQfB9SCieJitiRc91c/9DiaDcsFYUOTe1j7WBhqLd27vAfoO/FBf0EJ3e/R
         R9/ZI2AxF5ZEChIzygQ+cUlJZC5qXxv8TyrxKNDYAZRsp5Og1uLjlSa+owSi7/39SqSf
         HBTBI2Ys3v7QBYTcugEQOUE1FLtqcKr2hFyX2ucI4NEZwhIvHFUuZ0TTm4XNOOukb76T
         AsPg==
X-Forwarded-Encrypted: i=2; AJvYcCVkCdgqK2qtq5b1uboEbgknI4XnzohDqYlezh82bY5vr/wBGVmpWd7FQDYQ2m1RB44Wqr2Ia2OYBXsu2zsFF1nVrtdlJVx74ksTfr0=
X-Gm-Message-State: AOJu0YwWw73XK/URLQst6CFdugnbqKxRMCQm6vO7EcupvClVJUeFdiut
	Fnio7G4TDJyIgaU0deCVnktPthWGtnYT9PdPQ5SrrgIjAbrzPwFuoJpqGNU1zmQ=
X-Google-Smtp-Source: AGHT+IE+l+qUDfFD1XgCr5Uu41GaaOry2NDOHWEHszj7XRpx1xni5GYFMWNQhLr6FMx38iCA7HukhA==
X-Received: by 2002:ad4:5044:0:b0:696:71eb:76a1 with SMTP id m4-20020ad45044000000b0069671eb76a1mr3187305qvq.0.1711643767581;
        Thu, 28 Mar 2024 09:36:07 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:2606:b0:696:78dc:ab6a with SMTP id
 gu6-20020a056214260600b0069678dcab6als1788636qvb.0.-pod-prod-06-us; Thu, 28
 Mar 2024 09:36:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX/2bVAQpdC9OT2u6NF6AetWA+kyzpTXnZusMl58lvIf3gDxk7/BGG7Z6Y9FldkKHFrxDON80vfmshmhm25gp3oMezUruUbkxQF6D2ljcg=
X-Received: by 2002:a05:620a:17a5:b0:78b:c4ca:ff8c with SMTP id ay37-20020a05620a17a500b0078bc4caff8cmr860955qkb.4.1711643766910;
        Thu, 28 Mar 2024 09:36:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711643766; cv=none;
        d=google.com; s=arc-20160816;
        b=CmiCcfyk9cNK1SCiQcj6jsSxbRHhFM/YhVVyuy0Z1JWwhhbSLrnoXE9OVvHeTjauMn
         KWx4OxF3R+HI2tCrbutzqyEkbVI/fQKlScE4kZ/9ntX4F1r9yeSPf8EECQ2itXIXVEt3
         PhWh/H5ULGhL+xDmUG37f2ER/pj+sISDAiJfWk+bdm7l7J1eRaixtXRoGC+e2Pz/gXxa
         bBPT4SfDjxp283cx7UrdCD/j4e+C3l3/pKRhST/zdHbnQ/lQvytwBbkb5Zq5RCmMGoiO
         ynZQZrvwwzG46P4K9Gne7sSylBOfQQCjGc0E900lUPnf+wPujR28xZn+G364nASHuiBV
         iupA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=3tuMbXEALtXVN+9DP0lH6KC10UuXzf4Wno0E4exLjO4=;
        fh=dijFYpEVp+4ijccmXeOrV1fnLJQjsqwgNfcTPuMjuvg=;
        b=oKu/qA911vjJIrkXM3/V0nhRgF+0bNcdnIsQclqU+s/F2X7aFZPUH19zP3L0O0lX12
         eVItF2+RVq2ZuFEw/yfd6xiYp5W16ZNRQGZoyZKbXN3gFDDAlibD8pqqwbp1LHGkxYUU
         ctyop1OqYZFpXdjmz+clLjLzQw6E5MebPPkxe4dhcgC/JcSd1F13IEd79IWinnvlypKn
         mgefJRZuyXkmr1JX7yGyGoC/co5EIDYbT3pqRBO+yAVSHhw4BTSxE2l/Q4uSwzScBvW4
         AxRkB1AThr9SfwWoaaOWVEUCu8MTADmO2Sshx5n6xeQWsmBEPW0wCY/0tNaTVeljf4Dk
         Ha4g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id b15-20020a05620a126f00b0078a695a0553si1830113qkl.48.2024.03.28.09.36.06
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 09:36:06 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-370-NyS1G8TTPbeL-Ul__9EsRQ-1; Thu,
 28 Mar 2024 12:36:05 -0400
X-MC-Unique: NyS1G8TTPbeL-Ul__9EsRQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B376A3C40B5C
	for <linux-cachefs@gapps.redhat.com>; Thu, 28 Mar 2024 16:36:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id AF91B2166B5D; Thu, 28 Mar 2024 16:36:04 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.146])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 83BEC2166B31;
	Thu, 28 Mar 2024 16:36:01 +0000 (UTC)
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
Subject: [PATCH 06/26] netfs: Remove deprecated use of PG_private_2 as a second writeback flag
Date: Thu, 28 Mar 2024 16:33:58 +0000
Message-ID: <20240328163424.2781320-7-dhowells@redhat.com>
In-Reply-To: <20240328163424.2781320-1-dhowells@redhat.com>
References: <20240328163424.2781320-1-dhowells@redhat.com>
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

Remove the deprecated use of PG_private_2 in netfslib.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
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
index 75690f969ebc..2d0f13537c85 100644
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
@@ -798,8 +787,6 @@ static int ceph_writepage(struct page *page, struct writeback_control *wbc)
 	    ceph_inode_to_fs_client(inode)->write_congested)
 		return AOP_WRITEPAGE_ACTIVATE;
 
-	folio_wait_private_2(page_folio(page)); /* [DEPRECATED] */
-
 	err = writepage_nounlock(page, wbc);
 	if (err == -ERESTARTSYS) {
 		/* direct memory reclaimer was killed by SIGKILL. return 0
@@ -1073,8 +1060,7 @@ static int ceph_writepages_start(struct address_space *mapping,
 				unlock_page(page);
 				break;
 			}
-			if (PageWriteback(page) ||
-			    PagePrivate2(page) /* [DEPRECATED] */) {
+			if (PageWriteback(page)) {
 				if (wbc->sync_mode == WB_SYNC_NONE) {
 					doutc(cl, "%p under writeback\n", page);
 					unlock_page(page);
@@ -1082,7 +1068,6 @@ static int ceph_writepages_start(struct address_space *mapping,
 				}
 				doutc(cl, "waiting on writeback %p\n", page);
 				wait_on_page_writeback(page);
-				folio_wait_private_2(page_folio(page)); /* [DEPRECATED] */
 			}
 
 			if (!clear_page_dirty_for_io(page)) {
@@ -1267,8 +1252,6 @@ static int ceph_writepages_start(struct address_space *mapping,
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
 

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

