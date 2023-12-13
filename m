Return-Path: <linux-cachefs+bncBDLIXLMFVAERB24Z46VQMGQE4LTBW2I@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB3D81165A
	for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 16:25:32 +0100 (CET)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4258d02fbdasf78280121cf.2
        for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 07:25:32 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1702481132; cv=pass;
        d=google.com; s=arc-20160816;
        b=yOCvJeVBhpDpQDgd7kVLYAQhHRHJ1j93lI81umKiMEtEjqEd3AvXW8McjvbVST+6pq
         PJEBvQgpykqf9+YvTOmvlxDkzGU3pzwcEDYSkopNcjOAE26iLtlvjV6acAOb4GEqERTm
         8VV+8J3L5gn3+KSrlMOWRVlFbplADI7m6x6y/LNR1leF8MqHKgoFMtG0L05YGFOCopUD
         zGLtTIcih4KP3+HvqKidx4Dppw01koQoicWkkOoICpjxMTrZR2qkl6sRbizWK2n5ECgk
         uKADPKDvmJAdCurFQgM6LT7V7UDZ1VigFqnEl7aDrW4ao0xi0jqyCUJgUfYKncd48Fn0
         Md3A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=Z2x+hpdK7Ih09BWNQFa76B/SQ+Z0eAwdc9bKVryAuLw=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=r7KYkCb75JRWOFpoNTSKGApK4rpnEfmKSj0W0SNXLrGJ/Ppn1wIhPT0BDbCP2GHf12
         dxeSfHzoX/zzOnNSLxa0U3FA+R09hpkWHZGhIxrlDhnODgnQm2VMAHncGfTkkodC834R
         BKYiOc1IshMI7CVm7X3DmPvPyjzUqDr0sjex5xGCnYpSLJiy/msYf1vxdg9zKocTWcww
         1WFoxIFOlL8Rp73bChRZNYFLp3sbq6v+QSlgsuGxo8b9Ekp4F+arl1dPLRXHUdXhtPo5
         zRQDUIH9VTYoiWXXV+x3zVtDtYdAP3nVuHvztyavHFPWiSY6+Y8FINYcWYVJ56WnQLkC
         wEcw==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702481132; x=1703085932;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z2x+hpdK7Ih09BWNQFa76B/SQ+Z0eAwdc9bKVryAuLw=;
        b=SHICbi5SPiLyMsr2rO0gnLJZ2WddbjIeOcYVwHp1xHKAZ/dFud0kUKGOq0TAS1b0az
         eTc+PZvhTYrJU+oqTUaGEqcGnGZlzXyM3xFJ1BHam9Wnx1h8EUHIso3gL05UZt79bEa5
         HvxbxmkMtc8nBJfzqp3ajjGRs0oI82nkva5b/ox/xe039s27NFxs0OeZQHI/l/3FNMyo
         RjMw4n2UJB90orFNY9igKRQekxTHephOwHO05na5BGwH88bShJQscJ8yqXIYPC/3IZNs
         l6xFNkDrZSwa+jjB7fRChQ3InR70qecgkVmbyDaGaw/QedTm+2yWmBtwh1v5ohOUqQV/
         aEGw==
X-Gm-Message-State: AOJu0Yy2Wa4DLv2KaC136gQf+wbRUBkGtSOtpBLD9I7q0O+jsBGXfF+J
	EVh0kSTHTzmGEtPs5B5OSHkIZQ==
X-Google-Smtp-Source: AGHT+IH5c85F1GfMjC7ZA05prwqWtfeSyFSGCWZiXCDc7ksfSf9TtdbYaPc3h6m9Lyep8lP/HnC+wA==
X-Received: by 2002:ac8:5f4f:0:b0:425:79a8:ad9c with SMTP id y15-20020ac85f4f000000b0042579a8ad9cmr8920598qta.22.1702481131896;
        Wed, 13 Dec 2023 07:25:31 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:190b:b0:41e:8c36:f7a3 with SMTP id
 w11-20020a05622a190b00b0041e8c36f7a3ls201050qtc.2.-pod-prod-03-us; Wed, 13
 Dec 2023 07:25:31 -0800 (PST)
X-Received: by 2002:a05:620a:450e:b0:77f:2878:52e6 with SMTP id t14-20020a05620a450e00b0077f287852e6mr8935251qkp.155.1702481131301;
        Wed, 13 Dec 2023 07:25:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702481131; cv=none;
        d=google.com; s=arc-20160816;
        b=S1C28hNf2SGr4QLy78jGkOeHvYyzrihJJvKNXbm12AR+pV0OoYUKTf0emoI6HBnYXA
         0uW8MBzdrK7UM+5+JSYwUmvnnZ5nkLIUhv2Z4ZxubiIflWyPF9XFpFk8AFQ2mtSS6Pzg
         N4+CZ5Hu/y53mW6jnFdra4rhGtu9pQ+B1CACBd6B+XOjk0rTDqg5kVjmgcDJUoXQobXL
         9JxzfamEdO0H57wuCG2JikJlHbLLpcDKytFvsvDnvRcu4IaPUCGd9HmFLf5n8dXPtK8y
         EUOhekLWvE+xv3+4iscxUFv77w3S6/8Kqu2LQrnl6ZBERkNHTF6SxRbo/m6t2JRuuPOP
         8+Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=9CUqcQhkx342wCXCrXY79eb8GLJZvNRKMGt3t1k0yyQ=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=ogz8J/zxhrnhinfm7hhWCnRsUBIAP2223kOX1I9YK0aL7GVXAPCptyc1Sz2uhohD0B
         Bs/Gz23ZDXoLz9WcZDrogaeBznBYTOEQu+XwhW2DLFsX7PicPOYnkLSQj47izQpYijUB
         a26RrNHEK69QuYWv5u/no70VAO/dtZTx4EWiqSHaxeOcVEtQj4U8+IDSTnxeY2ICojs5
         puWswzsQaVSB+XL8AMk2ooeD+XkJhg3euP7+gMIQpalKjlsxRN+jozYh6EOXk99ada0i
         RPkqCKlGu3jqYpGFdsUpwQW5dyFxglMLxIGU4AM3j00tCW3cAYAt44iY6TxL0STPiFnZ
         XLdg==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id ov11-20020a05620a628b00b0077f081e30d0si3566659qkn.657.2023.12.13.07.25.31
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 07:25:31 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-490-4miHHGsNNvesiZEIFJQvKg-1; Wed, 13 Dec 2023 10:25:29 -0500
X-MC-Unique: 4miHHGsNNvesiZEIFJQvKg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 61AA1890FD8
	for <linux-cachefs@gapps.redhat.com>; Wed, 13 Dec 2023 15:25:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 5E5641121306; Wed, 13 Dec 2023 15:25:29 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8FD7B112131D;
	Wed, 13 Dec 2023 15:25:26 +0000 (UTC)
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
Subject: [PATCH v4 22/39] netfs: Make the refcounting of netfs_begin_read() easier to use
Date: Wed, 13 Dec 2023 15:23:32 +0000
Message-ID: <20231213152350.431591-23-dhowells@redhat.com>
In-Reply-To: <20231213152350.431591-1-dhowells@redhat.com>
References: <20231213152350.431591-1-dhowells@redhat.com>
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

Make the refcounting of netfs_begin_read() easier to use by not eating the
caller's ref on the netfs_io_request it's given.  This makes it easier to
use when we need to look in the request struct after.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/buffered_read.c     |  6 +++++-
 fs/netfs/io.c                | 28 +++++++++++++---------------
 include/trace/events/netfs.h |  9 +++++----
 3 files changed, 23 insertions(+), 20 deletions(-)

diff --git a/fs/netfs/buffered_read.c b/fs/netfs/buffered_read.c
index 751556faa70b..6b9a44cafbac 100644
--- a/fs/netfs/buffered_read.c
+++ b/fs/netfs/buffered_read.c
@@ -210,6 +210,7 @@ void netfs_readahead(struct readahead_control *ractl)
 		;
 
 	netfs_begin_read(rreq, false);
+	netfs_put_request(rreq, false, netfs_rreq_trace_put_return);
 	return;
 
 cleanup_free:
@@ -260,7 +261,9 @@ int netfs_read_folio(struct file *file, struct folio *folio)
 	iov_iter_xarray(&rreq->iter, ITER_DEST, &mapping->i_pages,
 			rreq->start, rreq->len);
 
-	return netfs_begin_read(rreq, true);
+	ret = netfs_begin_read(rreq, true);
+	netfs_put_request(rreq, false, netfs_rreq_trace_put_return);
+	return ret;
 
 discard:
 	netfs_put_request(rreq, false, netfs_rreq_trace_put_discard);
@@ -429,6 +432,7 @@ int netfs_write_begin(struct netfs_inode *ctx,
 	ret = netfs_begin_read(rreq, true);
 	if (ret < 0)
 		goto error;
+	netfs_put_request(rreq, false, netfs_rreq_trace_put_return);
 
 have_folio:
 	ret = folio_wait_fscache_killable(folio);
diff --git a/fs/netfs/io.c b/fs/netfs/io.c
index c80b8eed1209..1795f8679be9 100644
--- a/fs/netfs/io.c
+++ b/fs/netfs/io.c
@@ -362,6 +362,7 @@ static void netfs_rreq_assess(struct netfs_io_request *rreq, bool was_async)
 
 	netfs_rreq_unlock_folios(rreq);
 
+	trace_netfs_rreq(rreq, netfs_rreq_trace_wake_ip);
 	clear_bit_unlock(NETFS_RREQ_IN_PROGRESS, &rreq->flags);
 	wake_up_bit(&rreq->flags, NETFS_RREQ_IN_PROGRESS);
 
@@ -657,7 +658,6 @@ int netfs_begin_read(struct netfs_io_request *rreq, bool sync)
 
 	if (rreq->len == 0) {
 		pr_err("Zero-sized read [R=%x]\n", rreq->debug_id);
-		netfs_put_request(rreq, false, netfs_rreq_trace_put_zero_len);
 		return -EIO;
 	}
 
@@ -669,12 +669,10 @@ int netfs_begin_read(struct netfs_io_request *rreq, bool sync)
 
 	INIT_WORK(&rreq->work, netfs_rreq_work);
 
-	if (sync)
-		netfs_get_request(rreq, netfs_rreq_trace_get_hold);
-
 	/* Chop the read into slices according to what the cache and the netfs
 	 * want and submit each one.
 	 */
+	netfs_get_request(rreq, netfs_rreq_trace_get_for_outstanding);
 	atomic_set(&rreq->nr_outstanding, 1);
 	io_iter = rreq->io_iter;
 	do {
@@ -684,25 +682,25 @@ int netfs_begin_read(struct netfs_io_request *rreq, bool sync)
 	} while (rreq->submitted < rreq->len);
 
 	if (sync) {
-		/* Keep nr_outstanding incremented so that the ref always belongs to
-		 * us, and the service code isn't punted off to a random thread pool to
-		 * process.
+		/* Keep nr_outstanding incremented so that the ref always
+		 * belongs to us, and the service code isn't punted off to a
+		 * random thread pool to process.  Note that this might start
+		 * further work, such as writing to the cache.
 		 */
-		for (;;) {
-			wait_var_event(&rreq->nr_outstanding,
-				       atomic_read(&rreq->nr_outstanding) == 1);
+		wait_var_event(&rreq->nr_outstanding,
+			       atomic_read(&rreq->nr_outstanding) == 1);
+		if (atomic_dec_and_test(&rreq->nr_outstanding))
 			netfs_rreq_assess(rreq, false);
-			if (!test_bit(NETFS_RREQ_IN_PROGRESS, &rreq->flags))
-				break;
-			cond_resched();
-		}
+
+		trace_netfs_rreq(rreq, netfs_rreq_trace_wait_ip);
+		wait_on_bit(&rreq->flags, NETFS_RREQ_IN_PROGRESS,
+			    TASK_UNINTERRUPTIBLE);
 
 		ret = rreq->error;
 		if (ret == 0 && rreq->submitted < rreq->len) {
 			trace_netfs_failure(rreq, NULL, ret, netfs_fail_short_read);
 			ret = -EIO;
 		}
-		netfs_put_request(rreq, false, netfs_rreq_trace_put_hold);
 	} else {
 		/* If we decrement nr_outstanding to 0, the ref belongs to us. */
 		if (atomic_dec_and_test(&rreq->nr_outstanding))
diff --git a/include/trace/events/netfs.h b/include/trace/events/netfs.h
index 4ea4e34d279f..6daadf2aac8a 100644
--- a/include/trace/events/netfs.h
+++ b/include/trace/events/netfs.h
@@ -34,7 +34,9 @@
 	EM(netfs_rreq_trace_free,		"FREE   ")	\
 	EM(netfs_rreq_trace_resubmit,		"RESUBMT")	\
 	EM(netfs_rreq_trace_unlock,		"UNLOCK ")	\
-	E_(netfs_rreq_trace_unmark,		"UNMARK ")
+	EM(netfs_rreq_trace_unmark,		"UNMARK ")	\
+	EM(netfs_rreq_trace_wait_ip,		"WAIT-IP")	\
+	E_(netfs_rreq_trace_wake_ip,		"WAKE-IP")
 
 #define netfs_sreq_sources					\
 	EM(NETFS_FILL_WITH_ZEROES,		"ZERO")		\
@@ -65,14 +67,13 @@
 	E_(netfs_fail_prepare_write,		"prep-write")
 
 #define netfs_rreq_ref_traces					\
-	EM(netfs_rreq_trace_get_hold,		"GET HOLD   ")	\
+	EM(netfs_rreq_trace_get_for_outstanding,"GET OUTSTND")	\
 	EM(netfs_rreq_trace_get_subreq,		"GET SUBREQ ")	\
 	EM(netfs_rreq_trace_put_complete,	"PUT COMPLT ")	\
 	EM(netfs_rreq_trace_put_discard,	"PUT DISCARD")	\
 	EM(netfs_rreq_trace_put_failed,		"PUT FAILED ")	\
-	EM(netfs_rreq_trace_put_hold,		"PUT HOLD   ")	\
+	EM(netfs_rreq_trace_put_return,		"PUT RETURN ")	\
 	EM(netfs_rreq_trace_put_subreq,		"PUT SUBREQ ")	\
-	EM(netfs_rreq_trace_put_zero_len,	"PUT ZEROLEN")	\
 	E_(netfs_rreq_trace_new,		"NEW        ")
 
 #define netfs_sreq_ref_traces					\

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

