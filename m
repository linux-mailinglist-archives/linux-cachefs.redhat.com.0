Return-Path: <linux-cachefs+bncBDLIXLMFVAERBR5Q36VAMGQEPI4A3OQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mail.lfdr.de (Postfix) with ESMTPS id 065A77EF988
	for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 22:16:57 +0100 (CET)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-1f50a75ac0asf2389124fac.0
        for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 13:16:56 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700255816; cv=pass;
        d=google.com; s=arc-20160816;
        b=vR+ZtiTFYC4zcuY0EbRg2Ae43v2wPGx9DE9zijHI9pM3rIoaJ8Sc35nSI6h0GRhgtX
         7t8AvHvtPlNXomEo60+zBGIBmO7SvpX2EIPhDULVnaOWTHpQa6A4LYGkfjD4I0kVv+iO
         k1X9FUsfBIVjnxpJOteB6I0fquDYbmXKla0AJSSHe0zjT/3qCfi0QfhihMjQDiJCgMBH
         aWVFghJwp/cppPKyr0FU8DU3YyI+cV+gJfRKBE4dCN9XtOuZb1ebOBXXBeNblf5rWcHI
         is+JdJZ95ngr8NrkzBEXIVvOWXB3F9aYyqNHMLEueDgnB4fMBAu4jebppuGDOfD2qu2+
         nE7w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=BtlyTEePS3xPg4imuLNxebHyspHNxORRy1YdW52tgsc=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=FtMrzzsWz7EOtRavIsgT81BJG8RdRYGlt7zQtx2PrCNaTrE2Ap5ythI11/O36Md4i+
         WyiAStSS7ZRRYUKvv3FoZ+3XgGhEInqfzN0bqtlkBZ6U2c1bUIsTb7h+oeLjNkjaCBrF
         2EE9TC/jWLwRlu8jQWDhpf24oPAXI+lrIt0Euni+W/rQR5sp6BadyPxKWfibLVYa4yQo
         Vbjcnd/+m+tXsRCq6ORDNzD2o3fZrnumKmTX30JQ/AdbupTW6AJsPlA1njEs3mvY1A2m
         sCzt7bq2QSYYb+qoO0303GnOcwdA/evZR5MT8GCOcDoCizhAbBLHVDpy1bkBVoXxdkVm
         a74g==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.61 as internal address) smtp.mailfrom=dhowells@redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700255816; x=1700860616;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BtlyTEePS3xPg4imuLNxebHyspHNxORRy1YdW52tgsc=;
        b=tnHglF0vUFjObWqjKU/z9bs7DtVXBQ19kZ7k8aztwypwdksWNQUduqsgAWWha3j9R2
         scnyVC6/QgeIf8sOlT/RprSjDMNkqmZdDJa0994ygdvpCa8XtLQj7EBGE1cKyqqIOdYB
         o9hXt4r5eJT06/p8SyIHx8oxuSJE5fIBa9CfdnAiH5zHS2PUW2r5pba/KrDPW5NHbowh
         3z0iiqeGRu1rkN++8mDIJWXcQnK9xDeuR7bqkl0d4VCha+mBBrMiubvp1SW0h0+8jcYy
         JFLTVBCTvvsKyrBqei1Qenm5XI1pnglRf9m/B/ATqxYVH+Ln6g+oiOvh5oIF0EWSIVqs
         RCyA==
X-Gm-Message-State: AOJu0YxQ647TUCfLnpKqxhXCbgrZVBuH/vNLTV/F+TQOxp6PZIm/y9/w
	aigLXL78qvHcXmmzgOEB/aB3gg==
X-Google-Smtp-Source: AGHT+IEJI6U/e7Qv8TdD5O9ekpb5oaqhlmuRItk2o6z/Ge/iC1ahm6m3pWJxvBeqe4iIZaknL6vAdQ==
X-Received: by 2002:a05:6870:1cf:b0:1f0:3fdc:5995 with SMTP id n15-20020a05687001cf00b001f03fdc5995mr406106oad.50.1700255815871;
        Fri, 17 Nov 2023 13:16:55 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6870:8997:b0:1f5:bf3a:361b with SMTP id
 f23-20020a056870899700b001f5bf3a361bls547278oaq.2.-pod-prod-09-us; Fri, 17
 Nov 2023 13:16:55 -0800 (PST)
X-Received: by 2002:a05:6870:3055:b0:1ef:ace4:f360 with SMTP id u21-20020a056870305500b001eface4f360mr370399oau.17.1700255815278;
        Fri, 17 Nov 2023 13:16:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700255815; cv=none;
        d=google.com; s=arc-20160816;
        b=jTHiRZO1FQYrXr1U+X00wRnyoyuvZFwqJYY1pBruFA7unPk9Vni6yMzMYuxcbbBbqB
         3Jc+1kqjo3uYMzLtDhZSjArYExPqM6jn4OWxFucD6fO+CKflb1Ub5xmDPyJ9lX9he3vH
         yTDGncKBUhE4FGDrJe7ZFGutf6sRrsp9MgBTjKmxsZsciDMCu02EvkUZHVo7SItLZV1N
         VVHvYGdkswpWSxgTBg1fKBYGWd9Oc1CUIHvNuu66+XQYWI8hSGK40M9ui1N5DvrvJQj2
         RGzi6dfJyREQKXs6epvwHPl/b6lRf9KNerddiy4WxBuO36rP3c0PBvRD0gdWn6U/5Q/i
         6E/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=H+1i5F1S+6wxwGtTBxUYE1F0fETWm68EZav8/D9/C4o=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=0PCDPEPUbC8AWNfxthQtC79z07jFl6lXE3npKnE5wDHdTJhMg5E36beYWvEpo/RZjR
         roq7NXYESK2E6RyOr5wNCJZMoy7Hc/d+FbwJLYJ00mTV6ZWi333yQeMfQw91pQNARXDV
         dBQp+MHBMvnZ0mqMUGm9B2tuBAfRedUk/eaOKqJxm/hlNILKipvx3DjN6/KUnzsTLsT3
         fgh2TtNATqsXaETuPp/uO8kPGWBCAIQfpmsrMX0CtTwOzabm6+t7zNjEreJQkXO7VbCh
         dh2MbQJzx0ka+ZgVobWHnNF1ADwM6VQAdDuCEWxGACC2XFvfnShvSySOzN7Fm6oycnNs
         /MOg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.61 as internal address) smtp.mailfrom=dhowells@redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id a22-20020ac85b96000000b004181e1d50f9si2401032qta.549.2023.11.17.13.16.55
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 13:16:55 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.61 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-226-N6E9TqoIOD6biWPLRO0cFw-1; Fri,
 17 Nov 2023 16:16:53 -0500
X-MC-Unique: N6E9TqoIOD6biWPLRO0cFw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 693C33C0C11E
	for <linux-cachefs@gapps.redhat.com>; Fri, 17 Nov 2023 21:16:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 665BAC15882; Fri, 17 Nov 2023 21:16:53 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B83BCC15881;
	Fri, 17 Nov 2023 21:16:50 +0000 (UTC)
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
Subject: [PATCH v2 19/51] netfs: Make the refcounting of netfs_begin_read() easier to use
Date: Fri, 17 Nov 2023 21:15:11 +0000
Message-ID: <20231117211544.1740466-20-dhowells@redhat.com>
In-Reply-To: <20231117211544.1740466-1-dhowells@redhat.com>
References: <20231117211544.1740466-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain gapps.redhat.com configured 205.139.110.61 as internal address) smtp.mailfrom=dhowells@redhat.com
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
index 3b7eb706f2fe..05824f73cfc7 100644
--- a/fs/netfs/buffered_read.c
+++ b/fs/netfs/buffered_read.c
@@ -217,6 +217,7 @@ void netfs_readahead(struct readahead_control *ractl)
 		;
 
 	netfs_begin_read(rreq, false);
+	netfs_put_request(rreq, false, netfs_rreq_trace_put_return);
 	return;
 
 cleanup_free:
@@ -267,7 +268,9 @@ int netfs_read_folio(struct file *file, struct folio *folio)
 	iov_iter_xarray(&rreq->iter, ITER_DEST, &mapping->i_pages,
 			rreq->start, rreq->len);
 
-	return netfs_begin_read(rreq, true);
+	ret = netfs_begin_read(rreq, true);
+	netfs_put_request(rreq, false, netfs_rreq_trace_put_return);
+	return ret;
 
 discard:
 	netfs_put_request(rreq, false, netfs_rreq_trace_put_discard);
@@ -436,6 +439,7 @@ int netfs_write_begin(struct netfs_inode *ctx,
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

